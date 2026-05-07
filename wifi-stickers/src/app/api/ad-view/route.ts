import { NextRequest, NextResponse } from "next/server";
import { prisma } from "@/lib/prisma";
import { hashIp } from "@/lib/hash";

export async function POST(req: NextRequest) {
  const body = await req.json();
  const { qrCodeId, consented, skipped } = body;

  if (!qrCodeId) return NextResponse.json({ error: "qrCodeId requis" }, { status: 400 });

  const ip = req.headers.get("x-forwarded-for")?.split(",")[0] || "unknown";
  const userAgent = req.headers.get("user-agent") || "";

  await prisma.adView.create({
    data: {
      qrCodeId,
      consented: Boolean(consented),
      skipped: Boolean(skipped),
      ipHash: hashIp(ip),
      userAgent: userAgent.slice(0, 200),
    },
  });

  return NextResponse.json({ ok: true });
}

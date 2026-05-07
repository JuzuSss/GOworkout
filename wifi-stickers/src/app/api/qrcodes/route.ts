import { NextRequest, NextResponse } from "next/server";
import { prisma } from "@/lib/prisma";

export async function POST(req: NextRequest) {
  const body = await req.json();
  const { businessId, label } = body;

  if (!businessId) return NextResponse.json({ error: "businessId requis" }, { status: 400 });

  const qrCode = await prisma.qrCode.create({
    data: { businessId, label: label || "Nouveau QR" },
  });
  return NextResponse.json(qrCode, { status: 201 });
}

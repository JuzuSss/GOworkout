import { NextRequest, NextResponse } from "next/server";
import { prisma } from "@/lib/prisma";

export async function GET(_req: NextRequest, { params }: { params: Promise<{ id: string }> }) {
  const { id } = await params;
  const qrCode = await prisma.qrCode.findUnique({
    where: { id },
    include: { business: true },
  });
  if (!qrCode) return NextResponse.json({ error: "Introuvable" }, { status: 404 });
  return NextResponse.json(qrCode);
}

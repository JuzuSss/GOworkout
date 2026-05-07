import { NextRequest, NextResponse } from "next/server";
import { prisma } from "@/lib/prisma";

export async function GET(_req: NextRequest, { params }: { params: Promise<{ id: string }> }) {
  const { id } = await params;
  const business = await prisma.business.findUnique({
    where: { id },
    include: { qrCodes: { orderBy: { createdAt: "desc" }, include: { _count: { select: { adViews: true } } } } },
  });
  if (!business) return NextResponse.json({ error: "Introuvable" }, { status: 404 });
  return NextResponse.json(business);
}

export async function PUT(req: NextRequest, { params }: { params: Promise<{ id: string }> }) {
  const { id } = await params;
  const body = await req.json();
  const { name, address, contactName, contactPhone, wifiSsid, wifiPassword, wifiType, active } = body;

  const business = await prisma.business.update({
    where: { id },
    data: { name, address, contactName, contactPhone, wifiSsid, wifiPassword, wifiType, active },
  });
  return NextResponse.json(business);
}

export async function DELETE(_req: NextRequest, { params }: { params: Promise<{ id: string }> }) {
  const { id } = await params;
  await prisma.business.delete({ where: { id } });
  return NextResponse.json({ ok: true });
}

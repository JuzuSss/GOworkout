import { NextRequest, NextResponse } from "next/server";
import { prisma } from "@/lib/prisma";

export async function GET() {
  const businesses = await prisma.business.findMany({
    orderBy: { createdAt: "desc" },
    include: { _count: { select: { qrCodes: true } } },
  });
  return NextResponse.json(businesses);
}

export async function POST(req: NextRequest) {
  const body = await req.json();
  const { name, address, contactName, contactPhone, wifiSsid, wifiPassword, wifiType } = body;

  if (!name || !wifiSsid || !wifiPassword) {
    return NextResponse.json({ error: "Champs obligatoires manquants" }, { status: 400 });
  }

  const business = await prisma.business.create({
    data: { name, address, contactName, contactPhone, wifiSsid, wifiPassword, wifiType: wifiType || "WPA" },
  });

  // Créer un QR code par défaut
  await prisma.qrCode.create({
    data: { businessId: business.id, label: "Principal" },
  });

  return NextResponse.json(business, { status: 201 });
}

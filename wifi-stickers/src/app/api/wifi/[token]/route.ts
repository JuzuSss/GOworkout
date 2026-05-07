import { NextRequest, NextResponse } from "next/server";
import { prisma } from "@/lib/prisma";

export async function GET(_req: NextRequest, { params }: { params: Promise<{ token: string }> }) {
  const { token } = await params;
  const qrCode = await prisma.qrCode.findUnique({
    where: { token },
    include: { business: true },
  });

  if (!qrCode || !qrCode.active || !qrCode.business.active) {
    return NextResponse.json({ error: "QR code invalide ou désactivé" }, { status: 404 });
  }

  return NextResponse.json({
    businessName: qrCode.business.name,
    wifiSsid: qrCode.business.wifiSsid,
    wifiPassword: qrCode.business.wifiPassword,
    wifiType: qrCode.business.wifiType,
    qrCodeId: qrCode.id,
  });
}

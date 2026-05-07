import QRCode from "qrcode";

export async function generateQrDataUrl(text: string): Promise<string> {
  return QRCode.toDataURL(text, {
    width: 300,
    margin: 2,
    color: { dark: "#000000", light: "#ffffff" },
  });
}

export function buildWifiString(ssid: string, password: string, type: string): string {
  if (type === "nopass") return `WIFI:T:nopass;S:${escapeWifi(ssid)};;`;
  return `WIFI:T:${type};S:${escapeWifi(ssid)};P:${escapeWifi(password)};;`;
}

function escapeWifi(str: string): string {
  return str.replace(/([\\;,":'])/g, "\\$1");
}

export function buildLandingUrl(token: string): string {
  const base = process.env.NEXT_PUBLIC_BASE_URL || "http://localhost:3000";
  return `${base}/wifi/${token}`;
}

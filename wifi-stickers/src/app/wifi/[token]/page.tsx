"use client";

import { useEffect, useState, useCallback } from "react";
import { useParams } from "next/navigation";
import { buildWifiString } from "@/lib/qrcode";
import QRCodeDisplay from "@/components/QRCodeDisplay";
import ConsentBanner from "@/components/ConsentBanner";
import AdOverlay from "@/components/AdOverlay";
import WifiCredentials from "@/components/WifiCredentials";

type Step = "loading" | "error" | "consent" | "refused" | "ad" | "wifi";

interface WifiData {
  businessName: string;
  wifiSsid: string;
  wifiPassword: string;
  wifiType: string;
  qrCodeId: string;
}

export default function WifiPage() {
  const params = useParams();
  const token = params.token as string;

  const [step, setStep] = useState<Step>("loading");
  const [data, setData] = useState<WifiData | null>(null);
  const [error, setError] = useState("");

  useEffect(() => {
    fetch(`/api/wifi/${token}`)
      .then((r) => r.json())
      .then((d) => {
        if (d.error) { setError(d.error); setStep("error"); return; }
        setData(d);
        setStep("consent");
      })
      .catch(() => { setError("Erreur réseau"); setStep("error"); });
  }, [token]);

  const handleConsent = useCallback(async (accepted: boolean) => {
    if (!data) return;
    await fetch("/api/ad-view", {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ qrCodeId: data.qrCodeId, consented: accepted, skipped: false }),
    });
    if (accepted) { setStep("ad"); }
    else { setStep("refused"); }
  }, [data]);

  const handleAdFinished = useCallback(() => {
    setStep("wifi");
  }, []);

  if (step === "loading") return <FullScreen><Spinner /><p className="text-gray-500 mt-4">Chargement...</p></FullScreen>;
  if (step === "error") return <FullScreen><ErrorCard message={error} /></FullScreen>;
  if (step === "refused") return <FullScreen><RefusedCard /></FullScreen>;

  return (
    <div className="min-h-screen bg-gradient-to-br from-blue-50 to-indigo-100 flex flex-col items-center justify-center p-4">
      <div className="w-full max-w-sm">
        {data && (
          <div className="text-center mb-6">
            <div className="inline-flex items-center justify-center w-16 h-16 bg-blue-600 rounded-full mb-3">
              <WifiIcon />
            </div>
            <h1 className="text-2xl font-bold text-gray-800">WiFi Gratuit</h1>
            <p className="text-gray-500 text-sm mt-1">{data.businessName}</p>
          </div>
        )}

        {step === "consent" && <ConsentBanner onAccept={() => handleConsent(true)} onRefuse={() => handleConsent(false)} />}
        {step === "ad" && <AdOverlay onFinished={handleAdFinished} qrCodeId={data?.qrCodeId || ""} />}
        {step === "wifi" && data && (
          <WifiCredentials
            ssid={data.wifiSsid}
            password={data.wifiPassword}
            wifiType={data.wifiType}
            wifiString={buildWifiString(data.wifiSsid, data.wifiPassword, data.wifiType)}
          />
        )}
      </div>
    </div>
  );
}

function FullScreen({ children }: { children: React.ReactNode }) {
  return <div className="min-h-screen bg-gradient-to-br from-blue-50 to-indigo-100 flex flex-col items-center justify-center p-4">{children}</div>;
}

function Spinner() {
  return <div className="w-10 h-10 border-4 border-blue-500 border-t-transparent rounded-full animate-spin" />;
}

function ErrorCard({ message }: { message: string }) {
  return (
    <div className="bg-white rounded-2xl shadow-lg p-6 text-center">
      <div className="text-4xl mb-3">⚠️</div>
      <h2 className="text-lg font-semibold text-gray-800 mb-2">QR code invalide</h2>
      <p className="text-gray-500 text-sm">{message}</p>
    </div>
  );
}

function RefusedCard() {
  return (
    <div className="bg-white rounded-2xl shadow-lg p-6 text-center max-w-sm w-full">
      <div className="text-4xl mb-3">🔒</div>
      <h2 className="text-lg font-semibold text-gray-800 mb-2">Accès WiFi refusé</h2>
      <p className="text-gray-500 text-sm">
        Pour accéder au WiFi gratuit, vous devez accepter l'affichage d'une courte publicité. Rechargez la page pour réessayer.
      </p>
      <button
        onClick={() => window.location.reload()}
        className="mt-4 px-4 py-2 bg-blue-600 text-white rounded-lg text-sm font-medium hover:bg-blue-700 transition-colors"
      >
        Réessayer
      </button>
    </div>
  );
}

function WifiIcon() {
  return (
    <svg className="w-8 h-8 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
      <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M8.111 16.404a5.5 5.5 0 017.778 0M12 20h.01m-7.08-7.071c3.904-3.905 10.236-3.905 14.141 0M1.394 9.393c5.857-5.857 15.355-5.857 21.213 0" />
    </svg>
  );
}

// Re-export for server usage
QRCodeDisplay;

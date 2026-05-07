"use client";

import { useEffect, useState } from "react";

interface Props {
  onFinished: () => void;
  qrCodeId: string;
}

const AD_DURATION = 5;

export default function AdOverlay({ onFinished, qrCodeId }: Props) {
  const [secondsLeft, setSecondsLeft] = useState(AD_DURATION);
  const [canSkip, setCanSkip] = useState(false);

  useEffect(() => {
    const interval = setInterval(() => {
      setSecondsLeft((s) => {
        if (s <= 1) {
          clearInterval(interval);
          setCanSkip(true);
          return 0;
        }
        return s - 1;
      });
    }, 1000);
    return () => clearInterval(interval);
  }, []);

  const handleSkip = async () => {
    await fetch("/api/ad-view", {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ qrCodeId, consented: true, skipped: true }),
    });
    onFinished();
  };

  return (
    <div className="bg-white rounded-2xl shadow-lg overflow-hidden">
      {/* Zone publicitaire — à remplacer par votre réseau pub (Monetag, AdsTerra...) */}
      <div className="bg-gray-100 h-64 flex flex-col items-center justify-center border-b border-gray-200">
        <div className="text-gray-400 text-sm mb-2">Publicité</div>
        {/* ↓ Insérez ici le script de votre régie publicitaire (Monetag, AdsTerra, etc.) */}
        <div className="w-full h-full flex items-center justify-center bg-gradient-to-br from-gray-100 to-gray-200">
          <div className="text-center text-gray-400">
            <div className="text-4xl mb-2">📢</div>
            <p className="text-sm font-medium">Zone publicitaire</p>
            <p className="text-xs mt-1">Intégrez votre réseau pub ici</p>
          </div>
        </div>
      </div>

      <div className="p-4 flex items-center justify-between">
        <p className="text-xs text-gray-500">
          {secondsLeft > 0 ? `Publicité — ${secondsLeft}s` : "Vous pouvez continuer"}
        </p>
        {canSkip ? (
          <button
            onClick={handleSkip}
            className="px-4 py-2 bg-blue-600 text-white text-sm font-semibold rounded-lg hover:bg-blue-700 transition-colors"
          >
            Accéder au WiFi →
          </button>
        ) : (
          <div className="flex items-center gap-2 text-sm text-gray-400">
            <div className="w-5 h-5 border-2 border-gray-300 border-t-blue-500 rounded-full animate-spin" />
            {secondsLeft}s
          </div>
        )}
      </div>
    </div>
  );
}

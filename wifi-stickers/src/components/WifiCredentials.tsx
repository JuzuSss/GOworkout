"use client";

import { useState } from "react";
import QRCodeDisplay from "./QRCodeDisplay";

interface Props {
  ssid: string;
  password: string;
  wifiType: string;
  wifiString: string;
}

export default function WifiCredentials({ ssid, password, wifiType, wifiString }: Props) {
  const [copied, setCopied] = useState(false);

  const copyPassword = () => {
    navigator.clipboard.writeText(password).then(() => {
      setCopied(true);
      setTimeout(() => setCopied(false), 2000);
    });
  };

  return (
    <div className="bg-white rounded-2xl shadow-lg p-6 space-y-5">
      <div className="text-center">
        <div className="inline-flex items-center gap-2 bg-green-100 text-green-700 px-3 py-1 rounded-full text-sm font-medium">
          <span className="w-2 h-2 bg-green-500 rounded-full animate-pulse" />
          Connexion autorisée
        </div>
      </div>

      {/* Réseau */}
      <div className="bg-gray-50 rounded-xl p-4">
        <p className="text-xs text-gray-400 uppercase tracking-wide mb-1">Réseau WiFi</p>
        <p className="font-semibold text-gray-800 text-lg">{ssid}</p>
      </div>

      {/* Mot de passe */}
      {wifiType !== "nopass" && (
        <div className="bg-gray-50 rounded-xl p-4">
          <p className="text-xs text-gray-400 uppercase tracking-wide mb-1">Mot de passe</p>
          <div className="flex items-center justify-between gap-3">
            <p className="font-mono text-gray-800 text-base break-all">{password}</p>
            <button
              onClick={copyPassword}
              className="shrink-0 px-3 py-1.5 bg-blue-600 text-white text-xs font-medium rounded-lg hover:bg-blue-700 transition-colors"
            >
              {copied ? "Copié ✓" : "Copier"}
            </button>
          </div>
        </div>
      )}

      {/* QR code connexion automatique */}
      <div className="text-center">
        <p className="text-xs text-gray-400 mb-3">Ou scannez ce QR avec votre appareil photo pour vous connecter automatiquement</p>
        <div className="flex justify-center">
          <QRCodeDisplay value={wifiString} size={160} />
        </div>
        <p className="text-xs text-gray-400 mt-2">Fonctionne sur Android et iOS 11+</p>
      </div>

      <div className="border-t pt-4 text-center">
        <p className="text-xs text-gray-400">
          Vous êtes connecté via le service WiFi partenaire.{" "}
          <a href="/politique-confidentialite" className="underline" target="_blank" rel="noopener">
            Politique de confidentialité
          </a>
        </p>
      </div>
    </div>
  );
}

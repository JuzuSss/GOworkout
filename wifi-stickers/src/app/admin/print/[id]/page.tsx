"use client";

import { useEffect, useState, useRef } from "react";
import { useParams } from "next/navigation";
import Link from "next/link";
import QRCodeDisplay from "@/components/QRCodeDisplay";
import { buildLandingUrl } from "@/lib/qrcode";

interface QrCodeData {
  id: string;
  token: string;
  label: string | null;
  business: {
    id: string;
    name: string;
    wifiSsid: string;
  };
}

export default function PrintPage() {
  const params = useParams();
  const id = params.id as string;
  const [data, setData] = useState<QrCodeData | null>(null);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    fetch(`/api/qrcodes/${id}`)
      .then((r) => r.json())
      .then((d) => { setData(d); setLoading(false); });
  }, [id]);

  const handlePrint = () => window.print();

  if (loading) return <div className="min-h-screen flex items-center justify-center text-gray-400">Chargement...</div>;
  if (!data) return <div className="min-h-screen flex items-center justify-center text-gray-400">QR code introuvable</div>;

  const url = buildLandingUrl(data.token);

  return (
    <>
      {/* Barre de contrôle — cachée à l'impression */}
      <div className="no-print bg-white border-b border-gray-200 px-6 py-3 flex items-center justify-between">
        <div className="flex items-center gap-3">
          <Link href={`/admin/businesses/${data.business.id}`} className="text-gray-400 hover:text-gray-600 text-sm">← Retour</Link>
          <span className="text-gray-300">|</span>
          <span className="text-sm font-medium text-gray-700">Impression sticker — {data.business.name}</span>
        </div>
        <div className="flex items-center gap-3">
          <p className="text-xs text-gray-400">Taille : environ 8×8 cm (modifiable dans les options d'impression)</p>
          <button
            onClick={handlePrint}
            className="px-4 py-2 bg-blue-600 text-white text-sm font-medium rounded-lg hover:bg-blue-700 transition-colors"
          >
            Imprimer / Enregistrer PDF
          </button>
        </div>
      </div>

      {/* Zone d'impression */}
      <div className="min-h-screen bg-gray-100 flex items-center justify-center p-8 no-print-bg">
        <div className="sticker-card">
          {/* En-tête sticker */}
          <div className="sticker-header">
            <svg className="wifi-icon" viewBox="0 0 24 24" fill="none" stroke="currentColor">
              <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2.5} d="M8.111 16.404a5.5 5.5 0 017.778 0M12 20h.01m-7.08-7.071c3.904-3.905 10.236-3.905 14.141 0M1.394 9.393c5.857-5.857 15.355-5.857 21.213 0" />
            </svg>
            <span className="sticker-title">WiFi Gratuit</span>
          </div>

          {/* QR Code */}
          <div className="qr-container">
            <QRCodeDisplay value={url} size={200} />
          </div>

          {/* Instructions */}
          <div className="sticker-instructions">
            <p className="instruction-main">Scannez pour vous connecter</p>
            <p className="instruction-sub">Appareil photo ou application de scan</p>
          </div>

          {/* Réseau */}
          <div className="sticker-network">
            <span className="network-label">Réseau</span>
            <span className="network-name">{data.business.wifiSsid}</span>
          </div>

          {/* Footer */}
          <div className="sticker-footer">
            <p>{data.business.name}</p>
          </div>
        </div>
      </div>

      <style jsx global>{`
        @media print {
          .no-print { display: none !important; }
          .no-print-bg { background: white !important; padding: 0 !important; }
          body { margin: 0; }
          .sticker-card {
            box-shadow: none !important;
            border: 2px dashed #ccc !important;
          }
        }

        .sticker-card {
          width: 300px;
          background: white;
          border-radius: 20px;
          box-shadow: 0 4px 24px rgba(0,0,0,0.12);
          overflow: hidden;
          font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', sans-serif;
        }

        .sticker-header {
          background: linear-gradient(135deg, #1d4ed8, #3b82f6);
          padding: 16px 20px;
          display: flex;
          align-items: center;
          gap: 10px;
        }

        .wifi-icon {
          width: 28px;
          height: 28px;
          color: white;
        }

        .sticker-title {
          font-size: 20px;
          font-weight: 700;
          color: white;
          letter-spacing: -0.3px;
        }

        .qr-container {
          display: flex;
          justify-content: center;
          padding: 20px 20px 12px;
          background: white;
        }

        .sticker-instructions {
          text-align: center;
          padding: 0 20px 12px;
        }

        .instruction-main {
          font-size: 13px;
          font-weight: 600;
          color: #1f2937;
          margin: 0;
        }

        .instruction-sub {
          font-size: 11px;
          color: #9ca3af;
          margin: 2px 0 0;
        }

        .sticker-network {
          margin: 0 20px 12px;
          background: #f3f4f6;
          border-radius: 10px;
          padding: 10px 14px;
          display: flex;
          flex-direction: column;
          gap: 2px;
        }

        .network-label {
          font-size: 10px;
          text-transform: uppercase;
          letter-spacing: 0.05em;
          color: #9ca3af;
          font-weight: 600;
        }

        .network-name {
          font-size: 14px;
          font-weight: 700;
          color: #111827;
        }

        .sticker-footer {
          background: #f9fafb;
          border-top: 1px solid #e5e7eb;
          padding: 10px 20px;
          text-align: center;
          font-size: 11px;
          color: #6b7280;
        }
      `}</style>
    </>
  );
}

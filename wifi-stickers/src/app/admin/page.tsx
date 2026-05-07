"use client";

import { useEffect, useState } from "react";
import Link from "next/link";

interface Business {
  id: string;
  name: string;
  address: string | null;
  wifiSsid: string;
  active: boolean;
  createdAt: string;
  _count: { qrCodes: number };
}

export default function AdminPage() {
  const [businesses, setBusinesses] = useState<Business[]>([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    fetch("/api/businesses")
      .then((r) => r.json())
      .then((d) => { setBusinesses(d); setLoading(false); });
  }, []);

  return (
    <div className="min-h-screen bg-gray-50">
      {/* Header */}
      <header className="bg-white border-b border-gray-200 px-6 py-4">
        <div className="max-w-5xl mx-auto flex items-center justify-between">
          <div className="flex items-center gap-3">
            <div className="w-8 h-8 bg-blue-600 rounded-lg flex items-center justify-center">
              <svg className="w-5 h-5 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M8.111 16.404a5.5 5.5 0 017.778 0M12 20h.01m-7.08-7.071c3.904-3.905 10.236-3.905 14.141 0M1.394 9.393c5.857-5.857 15.355-5.857 21.213 0" />
              </svg>
            </div>
            <h1 className="text-lg font-bold text-gray-900">WiFi Stickers — Admin</h1>
          </div>
          <Link
            href="/admin/businesses/new"
            className="px-4 py-2 bg-blue-600 text-white text-sm font-medium rounded-lg hover:bg-blue-700 transition-colors"
          >
            + Nouveau commerce
          </Link>
        </div>
      </header>

      <main className="max-w-5xl mx-auto px-6 py-8">
        {/* Stats */}
        <div className="grid grid-cols-3 gap-4 mb-8">
          <StatCard label="Commerces" value={businesses.length} />
          <StatCard label="Actifs" value={businesses.filter((b) => b.active).length} />
          <StatCard label="QR codes" value={businesses.reduce((s, b) => s + b._count.qrCodes, 0)} />
        </div>

        {/* Liste */}
        <div className="bg-white rounded-2xl border border-gray-200 overflow-hidden">
          <div className="px-6 py-4 border-b border-gray-100">
            <h2 className="font-semibold text-gray-800">Commerces partenaires</h2>
          </div>

          {loading ? (
            <div className="p-8 text-center text-gray-400">Chargement...</div>
          ) : businesses.length === 0 ? (
            <div className="p-8 text-center">
              <p className="text-gray-400 mb-4">Aucun commerce enregistré</p>
              <Link href="/admin/businesses/new" className="text-blue-600 hover:underline text-sm">
                Ajouter le premier commerce →
              </Link>
            </div>
          ) : (
            <div className="divide-y divide-gray-100">
              {businesses.map((b) => (
                <div key={b.id} className="px-6 py-4 flex items-center justify-between hover:bg-gray-50 transition-colors">
                  <div>
                    <div className="flex items-center gap-2">
                      <span className="font-medium text-gray-800">{b.name}</span>
                      <span className={`text-xs px-2 py-0.5 rounded-full ${b.active ? "bg-green-100 text-green-700" : "bg-gray-100 text-gray-500"}`}>
                        {b.active ? "Actif" : "Inactif"}
                      </span>
                    </div>
                    <p className="text-sm text-gray-500 mt-0.5">
                      {b.address || "Adresse non renseignée"} · WiFi: {b.wifiSsid}
                    </p>
                    <p className="text-xs text-gray-400 mt-0.5">{b._count.qrCodes} QR code(s)</p>
                  </div>
                  <div className="flex items-center gap-2">
                    <Link
                      href={`/admin/businesses/${b.id}`}
                      className="px-3 py-1.5 text-sm text-blue-600 border border-blue-200 rounded-lg hover:bg-blue-50 transition-colors"
                    >
                      Gérer
                    </Link>
                  </div>
                </div>
              ))}
            </div>
          )}
        </div>
      </main>
    </div>
  );
}

function StatCard({ label, value }: { label: string; value: number }) {
  return (
    <div className="bg-white rounded-xl border border-gray-200 p-4">
      <p className="text-2xl font-bold text-gray-800">{value}</p>
      <p className="text-sm text-gray-500 mt-0.5">{label}</p>
    </div>
  );
}

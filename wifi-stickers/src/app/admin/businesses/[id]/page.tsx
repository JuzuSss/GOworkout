"use client";

import { useEffect, useState } from "react";
import { useParams, useRouter } from "next/navigation";
import Link from "next/link";
import QRCodeDisplay from "@/components/QRCodeDisplay";
import { buildLandingUrl } from "@/lib/qrcode";

interface QrCode {
  id: string;
  token: string;
  label: string | null;
  active: boolean;
  createdAt: string;
  _count: { adViews: number };
}

interface Business {
  id: string;
  name: string;
  address: string | null;
  contactName: string | null;
  contactPhone: string | null;
  wifiSsid: string;
  wifiPassword: string;
  wifiType: string;
  active: boolean;
  qrCodes: QrCode[];
}

export default function BusinessDetailPage() {
  const params = useParams();
  const router = useRouter();
  const id = params.id as string;

  const [business, setBusiness] = useState<Business | null>(null);
  const [loading, setLoading] = useState(true);
  const [saving, setSaving] = useState(false);
  const [addingQr, setAddingQr] = useState(false);
  const [editMode, setEditMode] = useState(false);
  const [form, setForm] = useState<Partial<Business>>({});

  useEffect(() => {
    fetch(`/api/businesses/${id}`)
      .then((r) => r.json())
      .then((d) => { setBusiness(d); setForm(d); setLoading(false); });
  }, [id]);

  const update = (key: string, value: string | boolean) =>
    setForm((f) => ({ ...f, [key]: value }));

  const handleSave = async () => {
    setSaving(true);
    await fetch(`/api/businesses/${id}`, {
      method: "PUT",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify(form),
    });
    const updated = await fetch(`/api/businesses/${id}`).then((r) => r.json());
    setBusiness(updated);
    setForm(updated);
    setSaving(false);
    setEditMode(false);
  };

  const handleDelete = async () => {
    if (!confirm(`Supprimer définitivement ${business?.name} ?`)) return;
    await fetch(`/api/businesses/${id}`, { method: "DELETE" });
    router.push("/admin");
  };

  const handleAddQr = async () => {
    setAddingQr(true);
    const label = prompt("Libellé du QR code (ex: Entrée, Terrasse, Chambre 1):");
    if (!label) { setAddingQr(false); return; }
    await fetch("/api/qrcodes", {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ businessId: id, label }),
    });
    const updated = await fetch(`/api/businesses/${id}`).then((r) => r.json());
    setBusiness(updated);
    setAddingQr(false);
  };

  if (loading) return <div className="min-h-screen bg-gray-50 flex items-center justify-center text-gray-400">Chargement...</div>;
  if (!business) return <div className="min-h-screen bg-gray-50 flex items-center justify-center text-gray-400">Commerce introuvable</div>;

  return (
    <div className="min-h-screen bg-gray-50">
      <header className="bg-white border-b border-gray-200 px-6 py-4">
        <div className="max-w-4xl mx-auto flex items-center justify-between">
          <div className="flex items-center gap-3">
            <Link href="/admin" className="text-gray-400 hover:text-gray-600 text-sm">← Retour</Link>
            <span className="text-gray-300">|</span>
            <h1 className="text-lg font-bold text-gray-900">{business.name}</h1>
            <span className={`text-xs px-2 py-0.5 rounded-full ${business.active ? "bg-green-100 text-green-700" : "bg-gray-100 text-gray-500"}`}>
              {business.active ? "Actif" : "Inactif"}
            </span>
          </div>
          <div className="flex gap-2">
            <button onClick={() => setEditMode((e) => !e)} className="px-3 py-1.5 border border-gray-200 text-gray-600 text-sm rounded-lg hover:bg-gray-50">
              {editMode ? "Annuler" : "Modifier"}
            </button>
            <button onClick={handleDelete} className="px-3 py-1.5 border border-red-200 text-red-600 text-sm rounded-lg hover:bg-red-50">
              Supprimer
            </button>
          </div>
        </div>
      </header>

      <main className="max-w-4xl mx-auto px-6 py-8 space-y-6">
        {/* Infos */}
        <section className="bg-white rounded-2xl border border-gray-200 p-6">
          <h2 className="font-semibold text-gray-800 mb-4">Informations</h2>
          {editMode ? (
            <div className="space-y-3">
              <EditRow label="Nom" value={form.name || ""} onChange={(v) => update("name", v)} />
              <EditRow label="Adresse" value={form.address || ""} onChange={(v) => update("address", v)} />
              <EditRow label="Contact" value={form.contactName || ""} onChange={(v) => update("contactName", v)} />
              <EditRow label="Téléphone" value={form.contactPhone || ""} onChange={(v) => update("contactPhone", v)} />
              <EditRow label="SSID" value={form.wifiSsid || ""} onChange={(v) => update("wifiSsid", v)} />
              <EditRow label="Mot de passe" value={form.wifiPassword || ""} onChange={(v) => update("wifiPassword", v)} />
              <div className="flex items-center gap-3 mt-2">
                <label className="flex items-center gap-2 text-sm text-gray-700 cursor-pointer">
                  <input type="checkbox" checked={form.active ?? true} onChange={(e) => update("active", e.target.checked)} className="rounded" />
                  Commerce actif
                </label>
              </div>
              <button onClick={handleSave} disabled={saving} className="mt-2 px-4 py-2 bg-blue-600 text-white text-sm font-medium rounded-lg hover:bg-blue-700 disabled:opacity-50">
                {saving ? "Sauvegarde..." : "Sauvegarder"}
              </button>
            </div>
          ) : (
            <div className="grid grid-cols-2 gap-4 text-sm">
              <InfoRow label="Adresse" value={business.address || "—"} />
              <InfoRow label="Contact" value={business.contactName || "—"} />
              <InfoRow label="Téléphone" value={business.contactPhone || "—"} />
              <InfoRow label="Réseau WiFi" value={business.wifiSsid} />
              <InfoRow label="Mot de passe" value={business.wifiPassword} mono />
              <InfoRow label="Sécurité" value={business.wifiType} />
            </div>
          )}
        </section>

        {/* QR Codes */}
        <section className="bg-white rounded-2xl border border-gray-200 p-6">
          <div className="flex items-center justify-between mb-4">
            <h2 className="font-semibold text-gray-800">QR Codes</h2>
            <button onClick={handleAddQr} disabled={addingQr} className="px-3 py-1.5 bg-blue-600 text-white text-sm font-medium rounded-lg hover:bg-blue-700 disabled:opacity-50">
              + Ajouter un QR
            </button>
          </div>

          <div className="grid grid-cols-1 sm:grid-cols-2 gap-4">
            {business.qrCodes.map((qr) => {
              const url = buildLandingUrl(qr.token);
              return (
                <div key={qr.id} className="border border-gray-200 rounded-xl p-4 flex flex-col items-center gap-3">
                  <div className="flex items-center justify-between w-full">
                    <span className="font-medium text-sm text-gray-700">{qr.label || "QR Principal"}</span>
                    <span className="text-xs text-gray-400">{qr._count.adViews} vues</span>
                  </div>
                  <QRCodeDisplay value={url} size={160} />
                  <p className="text-xs text-gray-400 break-all text-center">{url}</p>
                  <Link
                    href={`/admin/print/${qr.id}`}
                    className="w-full text-center py-2 bg-gray-800 text-white text-sm font-medium rounded-lg hover:bg-gray-900 transition-colors"
                  >
                    Imprimer le sticker
                  </Link>
                </div>
              );
            })}
          </div>
        </section>
      </main>
    </div>
  );
}

function InfoRow({ label, value, mono }: { label: string; value: string; mono?: boolean }) {
  return (
    <div>
      <p className="text-xs text-gray-400 uppercase tracking-wide">{label}</p>
      <p className={`text-gray-800 mt-0.5 ${mono ? "font-mono" : ""}`}>{value}</p>
    </div>
  );
}

function EditRow({ label, value, onChange }: { label: string; value: string; onChange: (v: string) => void }) {
  return (
    <div className="flex items-center gap-3">
      <label className="text-sm text-gray-500 w-28 shrink-0">{label}</label>
      <input
        type="text"
        value={value}
        onChange={(e) => onChange(e.target.value)}
        className="flex-1 px-3 py-1.5 border border-gray-200 rounded-lg text-sm focus:border-blue-400 outline-none bg-gray-50"
      />
    </div>
  );
}

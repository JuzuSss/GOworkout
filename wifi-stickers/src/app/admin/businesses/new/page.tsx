"use client";

import { useState } from "react";
import { useRouter } from "next/navigation";
import Link from "next/link";

export default function NewBusinessPage() {
  const router = useRouter();
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState("");

  const [form, setForm] = useState({
    name: "",
    address: "",
    contactName: "",
    contactPhone: "",
    wifiSsid: "",
    wifiPassword: "",
    wifiType: "WPA",
  });

  const update = (key: string, value: string) => setForm((f) => ({ ...f, [key]: value }));

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    setLoading(true);
    setError("");

    const res = await fetch("/api/businesses", {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify(form),
    });

    if (!res.ok) {
      const d = await res.json();
      setError(d.error || "Erreur serveur");
      setLoading(false);
      return;
    }

    const business = await res.json();
    router.push(`/admin/businesses/${business.id}`);
  };

  return (
    <div className="min-h-screen bg-gray-50">
      <header className="bg-white border-b border-gray-200 px-6 py-4">
        <div className="max-w-2xl mx-auto flex items-center gap-3">
          <Link href="/admin" className="text-gray-400 hover:text-gray-600 text-sm">← Retour</Link>
          <span className="text-gray-300">|</span>
          <h1 className="text-lg font-bold text-gray-900">Nouveau commerce</h1>
        </div>
      </header>

      <main className="max-w-2xl mx-auto px-6 py-8">
        <form onSubmit={handleSubmit} className="space-y-6">
          {/* Infos commerce */}
          <section className="bg-white rounded-2xl border border-gray-200 p-6">
            <h2 className="font-semibold text-gray-800 mb-4">Informations du commerce</h2>
            <div className="space-y-4">
              <Field label="Nom du commerce *" required>
                <input
                  type="text"
                  required
                  value={form.name}
                  onChange={(e) => update("name", e.target.value)}
                  placeholder="Restaurant Le Gaulois"
                  className="input"
                />
              </Field>
              <Field label="Adresse">
                <input
                  type="text"
                  value={form.address}
                  onChange={(e) => update("address", e.target.value)}
                  placeholder="12 rue de la Paix, Paris"
                  className="input"
                />
              </Field>
              <div className="grid grid-cols-2 gap-4">
                <Field label="Contact (nom)">
                  <input
                    type="text"
                    value={form.contactName}
                    onChange={(e) => update("contactName", e.target.value)}
                    placeholder="Jean Dupont"
                    className="input"
                  />
                </Field>
                <Field label="Téléphone">
                  <input
                    type="tel"
                    value={form.contactPhone}
                    onChange={(e) => update("contactPhone", e.target.value)}
                    placeholder="06 12 34 56 78"
                    className="input"
                  />
                </Field>
              </div>
            </div>
          </section>

          {/* Infos WiFi */}
          <section className="bg-white rounded-2xl border border-gray-200 p-6">
            <h2 className="font-semibold text-gray-800 mb-4">Configuration WiFi</h2>
            <div className="space-y-4">
              <Field label="Nom du réseau (SSID) *" required>
                <input
                  type="text"
                  required
                  value={form.wifiSsid}
                  onChange={(e) => update("wifiSsid", e.target.value)}
                  placeholder="LeGaulois_WiFi"
                  className="input"
                />
              </Field>
              <Field label="Mot de passe WiFi *" required>
                <input
                  type="text"
                  required={form.wifiType !== "nopass"}
                  value={form.wifiPassword}
                  onChange={(e) => update("wifiPassword", e.target.value)}
                  placeholder="motdepasse123"
                  className="input"
                />
              </Field>
              <Field label="Type de sécurité">
                <select
                  value={form.wifiType}
                  onChange={(e) => update("wifiType", e.target.value)}
                  className="input"
                >
                  <option value="WPA">WPA / WPA2 / WPA3 (recommandé)</option>
                  <option value="WEP">WEP (ancien)</option>
                  <option value="nopass">Réseau ouvert (sans mot de passe)</option>
                </select>
              </Field>
            </div>
          </section>

          {error && <p className="text-red-600 text-sm bg-red-50 p-3 rounded-lg">{error}</p>}

          <div className="flex gap-3">
            <Link
              href="/admin"
              className="px-4 py-2.5 border border-gray-200 text-gray-600 text-sm font-medium rounded-xl hover:bg-gray-50 transition-colors"
            >
              Annuler
            </Link>
            <button
              type="submit"
              disabled={loading}
              className="flex-1 py-2.5 bg-blue-600 text-white text-sm font-semibold rounded-xl hover:bg-blue-700 disabled:opacity-50 transition-colors"
            >
              {loading ? "Création..." : "Créer le commerce et générer le QR code"}
            </button>
          </div>
        </form>
      </main>

      <style jsx global>{`
        .input {
          width: 100%;
          padding: 0.625rem 0.875rem;
          border: 1px solid #e5e7eb;
          border-radius: 0.75rem;
          font-size: 0.875rem;
          color: #111827;
          background: #f9fafb;
          outline: none;
          transition: border-color 0.15s;
        }
        .input:focus {
          border-color: #3b82f6;
          background: #fff;
        }
      `}</style>
    </div>
  );
}

function Field({ label, required, children }: { label: string; required?: boolean; children: React.ReactNode }) {
  return (
    <div>
      <label className="block text-sm font-medium text-gray-700 mb-1.5">
        {label}
      </label>
      {children}
    </div>
  );
}

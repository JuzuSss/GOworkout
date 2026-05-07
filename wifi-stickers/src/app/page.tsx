import Link from "next/link";

export default function Home() {
  return (
    <div className="min-h-screen bg-gradient-to-br from-blue-600 to-indigo-700 flex flex-col items-center justify-center p-6 text-white">
      <div className="max-w-md text-center">
        <div className="inline-flex items-center justify-center w-20 h-20 bg-white/20 rounded-2xl mb-6 backdrop-blur">
          <svg className="w-10 h-10 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M8.111 16.404a5.5 5.5 0 017.778 0M12 20h.01m-7.08-7.071c3.904-3.905 10.236-3.905 14.141 0M1.394 9.393c5.857-5.857 15.355-5.857 21.213 0" />
          </svg>
        </div>

        <h1 className="text-4xl font-bold mb-3">WiFi Stickers</h1>
        <p className="text-blue-100 text-lg mb-8">
          Solution clé en main de QR codes WiFi pour restaurants, hôtels et commerces.
        </p>

        <div className="flex flex-col gap-3">
          <Link
            href="/admin"
            className="py-3 px-6 bg-white text-blue-700 font-semibold rounded-xl hover:bg-blue-50 transition-colors"
          >
            Accéder au dashboard admin
          </Link>
        </div>

        <p className="text-blue-200 text-sm mt-8">
          Service WiFi publicitaire · Conforme RGPD
        </p>
      </div>
    </div>
  );
}

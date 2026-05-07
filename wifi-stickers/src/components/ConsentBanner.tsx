"use client";

interface Props {
  onAccept: () => void;
  onRefuse: () => void;
}

export default function ConsentBanner({ onAccept, onRefuse }: Props) {
  return (
    <div className="bg-white rounded-2xl shadow-lg p-6">
      <h2 className="text-lg font-semibold text-gray-800 mb-3">WiFi gratuit — Consentement requis</h2>
      <p className="text-gray-600 text-sm mb-4">
        Pour accéder au WiFi gratuit, nous affichons une courte publicité (5 secondes). Vos données ne sont pas revendues à des tiers.
      </p>

      <div className="bg-gray-50 rounded-xl p-3 mb-5 text-xs text-gray-500 space-y-1">
        <p>✓ Aucune inscription requise</p>
        <p>✓ Pas de collecte d'email</p>
        <p>✓ Publicité non ciblée</p>
        <p>✓ Conforme RGPD</p>
      </div>

      <div className="space-y-3">
        <button
          onClick={onAccept}
          className="w-full py-3 bg-blue-600 text-white font-semibold rounded-xl hover:bg-blue-700 active:bg-blue-800 transition-colors"
        >
          Accepter et accéder au WiFi
        </button>
        <button
          onClick={onRefuse}
          className="w-full py-2 text-gray-400 text-sm hover:text-gray-600 transition-colors"
        >
          Refuser (pas d'accès WiFi)
        </button>
      </div>

      <p className="text-xs text-gray-400 text-center mt-4">
        En acceptant, vous consentez à l'affichage d'une publicité conformément à notre{" "}
        <a href="/politique-confidentialite" className="underline" target="_blank" rel="noopener">
          politique de confidentialité
        </a>.
      </p>
    </div>
  );
}

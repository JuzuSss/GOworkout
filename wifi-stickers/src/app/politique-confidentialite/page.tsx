export default function PolitiqueConfidentialite() {
  return (
    <div className="min-h-screen bg-gray-50 py-12 px-6">
      <div className="max-w-2xl mx-auto bg-white rounded-2xl border border-gray-200 p-8">
        <h1 className="text-2xl font-bold text-gray-900 mb-6">Politique de confidentialité</h1>
        <p className="text-sm text-gray-400 mb-8">Dernière mise à jour : mai 2025</p>

        <div className="prose prose-sm text-gray-600 space-y-6">
          <section>
            <h2 className="text-base font-semibold text-gray-800">1. Qui sommes-nous ?</h2>
            <p>
              Ce service WiFi publicitaire est opéré par [Votre Société]. En scannant le QR code
              et en acceptant les conditions, vous accédez au réseau WiFi du commerce partenaire
              après avoir visionné une courte publicité.
            </p>
          </section>

          <section>
            <h2 className="text-base font-semibold text-gray-800">2. Données collectées</h2>
            <p>Lors de votre connexion, nous collectons uniquement :</p>
            <ul className="list-disc pl-5 space-y-1">
              <li>Un identifiant anonymisé de votre adresse IP (hashé, non réversible)</li>
              <li>Votre type d'appareil (user-agent) de manière anonyme</li>
              <li>L'horodatage de la connexion</li>
              <li>Votre consentement ou refus</li>
            </ul>
            <p className="mt-2">
              Nous ne collectons <strong>pas</strong> votre nom, email, numéro de téléphone,
              ni aucune donnée personnelle identifiable.
            </p>
          </section>

          <section>
            <h2 className="text-base font-semibold text-gray-800">3. Finalité du traitement</h2>
            <p>Les données collectées servent uniquement à :</p>
            <ul className="list-disc pl-5 space-y-1">
              <li>Comptabiliser les vues publicitaires (statistiques anonymes)</li>
              <li>Respecter les obligations légales de journalisation (loi LCEN)</li>
            </ul>
          </section>

          <section>
            <h2 className="text-base font-semibold text-gray-800">4. Base légale</h2>
            <p>
              Le traitement est basé sur votre <strong>consentement explicite</strong> donné lors
              du scan du QR code. Vous pouvez refuser à tout moment — dans ce cas, l'accès au
              WiFi ne vous sera pas accordé.
            </p>
          </section>

          <section>
            <h2 className="text-base font-semibold text-gray-800">5. Conservation des données</h2>
            <p>
              Les données anonymisées sont conservées pendant 12 mois conformément aux
              obligations légales françaises (LCEN).
            </p>
          </section>

          <section>
            <h2 className="text-base font-semibold text-gray-800">6. Vos droits</h2>
            <p>
              Conformément au RGPD, vous disposez d'un droit d'accès, de rectification et
              d'effacement de vos données. Étant donné que vos données sont anonymisées dès la
              collecte, il n'est techniquement pas possible de les identifier individuellement.
            </p>
            <p className="mt-2">
              Pour toute demande : <a href="mailto:contact@votresite.fr" className="text-blue-600 underline">contact@votresite.fr</a>
            </p>
          </section>

          <section>
            <h2 className="text-base font-semibold text-gray-800">7. Publicité</h2>
            <p>
              Les publicités affichées ne sont pas ciblées sur la base de données personnelles.
              Elles proviennent d'un réseau publicitaire tiers. Vous pouvez vous opposer à
              la publicité ciblée via les paramètres de votre navigateur ou l'outil YourAdChoices.
            </p>
          </section>
        </div>
      </div>
    </div>
  );
}

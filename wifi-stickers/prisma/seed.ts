import { PrismaClient } from "@prisma/client";
import { PrismaBetterSqlite3 } from "@prisma/adapter-better-sqlite3";
import { fileURLToPath } from "url";
import path from "path";

const dbPath = path.resolve(process.cwd(), "dev.db");
const adapter = new PrismaBetterSqlite3({ url: dbPath });
const prisma = new PrismaClient({ adapter } as ConstructorParameters<typeof PrismaClient>[0]);

async function main() {
  const business = await prisma.business.create({
    data: {
      name: "Restaurant Le Gaulois",
      address: "12 rue de la Paix, 75001 Paris",
      contactName: "Jean Dupont",
      contactPhone: "06 12 34 56 78",
      wifiSsid: "LeGaulois_WiFi",
      wifiPassword: "bienvenue2024",
      wifiType: "WPA",
      qrCodes: {
        create: [
          { label: "Salle principale" },
          { label: "Terrasse" },
        ],
      },
    },
    include: { qrCodes: true },
  });

  console.log("Commerce créé :", business.name);
  console.log("QR codes :");
  business.qrCodes.forEach((qr) => {
    console.log(`  - ${qr.label} → http://localhost:3000/wifi/${qr.token}`);
  });
}

main()
  .catch(console.error)
  .finally(() => prisma.$disconnect());

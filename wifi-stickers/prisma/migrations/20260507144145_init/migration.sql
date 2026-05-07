-- CreateTable
CREATE TABLE "Business" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "name" TEXT NOT NULL,
    "address" TEXT,
    "contactName" TEXT,
    "contactPhone" TEXT,
    "wifiSsid" TEXT NOT NULL,
    "wifiPassword" TEXT NOT NULL,
    "wifiType" TEXT NOT NULL DEFAULT 'WPA',
    "active" BOOLEAN NOT NULL DEFAULT true,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME NOT NULL
);

-- CreateTable
CREATE TABLE "QrCode" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "token" TEXT NOT NULL,
    "businessId" TEXT NOT NULL,
    "label" TEXT,
    "active" BOOLEAN NOT NULL DEFAULT true,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT "QrCode_businessId_fkey" FOREIGN KEY ("businessId") REFERENCES "Business" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "AdView" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "qrCodeId" TEXT NOT NULL,
    "consented" BOOLEAN NOT NULL,
    "skipped" BOOLEAN NOT NULL DEFAULT false,
    "ipHash" TEXT,
    "userAgent" TEXT,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT "AdView_qrCodeId_fkey" FOREIGN KEY ("qrCodeId") REFERENCES "QrCode" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);

-- CreateIndex
CREATE UNIQUE INDEX "QrCode_token_key" ON "QrCode"("token");

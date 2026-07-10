#!/bin/bash
# Bu scripti kendi bilgisayarında çalıştır (Java/keytool gerekli)
# Çıktısındaki 4 değeri GitHub Secrets'a ekleyeceksin

set -e

ALIAS="upload"
STOREPASS=$(LC_ALL=C tr -dc 'A-Za-z0-9' < /dev/urandom | head -c 24)

echo ""
echo "=== Keystore oluşturuluyor ==="
keytool -genkeypair \
  -keystore upload.keystore \
  -alias "$ALIAS" \
  -keyalg RSA -keysize 2048 -validity 10000 \
  -storepass "$STOREPASS" -keypass "$STOREPASS" \
  -dname "CN=Alkito12, O=Alkito12, C=TR"

echo ""
echo "=== GitHub Secrets için kopyala ==="
echo ""
echo "Secret adı : KEYSTORE_BASE64"
echo "Değer      :"
base64 -w 0 upload.keystore
echo ""
echo ""
echo "Secret adı : KEY_ALIAS"
echo "Değer      : $ALIAS"
echo ""
echo "Secret adı : STORE_PASSWORD"
echo "Değer      : $STOREPASS"
echo ""
echo "Secret adı : KEY_PASSWORD"
echo "Değer      : $STOREPASS"
echo ""
echo "=== ÖNEMLİ: upload.keystore dosyasını güvenli bir yere kaydet! ==="

# Su Fiziği Simülasyonu — Android (Play Store) Projesi

Bu klasör, `water-simulation.html` dosyasını [Capacitor](https://capacitorjs.com/) ile sarmalayan, hazır bir Android projesidir. Oyun tamamen offline çalıştığı için internet izni eklenmedi.

- `www/index.html` — oyunun kendisi (ana `water-simulation.html` ile senkron tutulmalı)
- `android/` — native Android (Gradle) projesi
- App ID: `com.alkito.sufiziksim`
- App adı: `Su Fiziği Simülasyonu`

## Oyun dosyası güncellenince

Kökteki `water-simulation.html` değiştiğinde, Android projesine yansıtmak için:

```bash
cd android-app
cp ../water-simulation.html www/index.html
npx cap sync android
```

## Play Store'a yüklemek için (Android Studio gerekir)

Bu ortamda Android SDK indirme adresleri engelli olduğundan APK/AAB burada derlenemiyor. Aşağıdaki adımlar kendi bilgisayarında (Android Studio kurulu) yapılmalı:

1. Bu repoyu kendi bilgisayarına çek (`git clone` / `git pull`)
2. `android-app` klasöründe `npm install`
3. `npx cap open android` → Android Studio açılır
4. Android Studio'da: **Build > Generate Signed App Bundle / APK** → **Android App Bundle (AAB)** seç
5. "Create new..." ile bir keystore (imza anahtarı) oluştur — **bu dosyayı ve şifreni kaybetme, ileride güncelleme yüklerken yine aynısı gerekiyor**
6. Release modunda derle → `android/app/release/app-release.aab` üretilir
7. Bu `.aab` dosyasını Google Play Console'a yüklersin

Detaylı adımlar için ana sohbette verilen "Google Play hesabı alındıktan sonra" rehberine bak.

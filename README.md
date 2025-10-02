# 📱 gemini app

Aplicación Flutter con integración de **Firebase** y **Gemini AI**.
Este proyecto es un ejemplo de chat que responde con lógica de IA usando Firebase AI Logic.

---

## 🚀 Requisitos

* [Flutter SDK](https://docs.flutter.dev/get-started/install) (versión estable recomendada)
* [Dart SDK](https://dart.dev/get-dart)
* Acceso a un proyecto en [Firebase Console](https://console.firebase.google.com/)
* Claves de API necesarias (Gemini, Firebase)

---

## ⚙️ Configuración inicial

1. Clonar el repositorio:

   ```bash
   git clone https://github.com/GastonBasante/gemini_app.git
   cd gemini_app
   ```

2. Instalar dependencias:

   ```bash
   flutter pub get
   ```

3. Crear un archivo `.env` en assets/.env:

   deje un .env.example como referencia
   
  

4. Configurar Firebase:

   * Descargar `google-services.json` para Android y ponerlo en `android/app/`.
   * Descargar `GoogleService-Info.plist` para iOS y ponerlo en `ios/Runner/`.

5. Ejecutar la app:

   ```bash
   flutter run
   ```


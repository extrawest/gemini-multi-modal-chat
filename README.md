# 🤖 Gemini Chat - Multimodal AI Assistant

A modern, clean-architecture Flutter application that integrates Google's **Gemini 1.5 Flash** model. The app supports **multimodal interaction**, allowing users to send both text prompts and images for AI analysis.

[gemini_chat_mobile_app.mp4](..%2F..%2F..%2F..%2FDownloads%2Fgemini_chat_mobile_app.mp4)

## ✨ Key Features

*   **Multimodal AI:** Chat with text or send images for analysis (e.g., "Describe this photo").
*   **Clean Architecture:** Feature-based folder structure separating UI, Logic (Controllers), and Services.
*   **State Management:** Built using `Provider` for efficient state updates.
*   **Secure Config:** API keys are managed via `.env` file (not hardcoded).
*   **Modern UI:**
    *   WhatsApp/Telegram-style message bubbles.
    *   Adaptive UI with `IntrinsicWidth`.
    *   Timestamps and User/AI avatars.
    *   Custom App Icon and Native Splash Screen.

## 🛠 Tech Stack

*   **Framework:** Flutter (Dart)
*   **AI Model:** Google Gemini 1.5 Flash (`flutter_gemini`)
*   **State Management:** Provider (`ChangeNotifier`)
*   **Utils:** `flutter_dotenv`, `uuid`, `image_picker`
*   **Assets Generation:** `flutter_launcher_icons`, `flutter_native_splash`

## 📂 Project Structure

The project follows a **Feature-First** architecture to ensure scalability and maintainability.

```text
lib/
├── main.dart                  # Entry point & Initializations
├── shared/                    # Shared resources across the app
│   ├── config/                # Environment config (.env loader)
│   ├── styles/                # AppColors, Themes
│   └── utils/                 # Constants, Strings
└── modules/                   # Feature modules
    └── smart_chat/            # Main Chat Feature
        ├── models/            # Data models (ChatMessage)
        ├── services/          # API calls (GeminiService)
        ├── controllers/       # State Management (ChatController)
        └── ui/                # UI Layer
            ├── chat_screen.dart
            └── widgets/       # Reusable widgets (Bubbles, Input)
            
---

## 🚀 Getting Started

Follow these steps to set up and run the project locally.

1️⃣ Clone the repository  
git clone https://github.com/YOUR-USERNAME/gemini-chat.git  
cd gemini-chat  

2️⃣ Install dependencies  
flutter pub get  

3️⃣ Setup Environment Variables  

For security reasons, the API key is not included in the source code.

Create a file named `.env` in the root directory of the project and add your Gemini API key:

GEMINI_API_KEY=AIzaSy...YourKeyHere  

4️⃣ Run the App  

Android Emulator / iOS Simulator (debug mode with hot reload):  
flutter run  

Physical iOS Device:  
flutter run --release  

---

## 📦 Assets & Build

The project includes:  
- Custom App Icon (flutter_launcher_icons)  
- Native Splash Screen (flutter_native_splash)  
- Adaptive UI for multiple screen sizes  

Regenerate assets:  
flutter pub run flutter_launcher_icons  
flutter pub run flutter_native_splash:create  

---

## 📄 License

This project is provided for educational purposes as part of AI Frameworks Training.
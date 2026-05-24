# 🎵 Lyrics Finder App

> A Flutter mobile application to find song lyrics instantly — just enter the artist name and song title.

![Platform](https://img.shields.io/badge/Platform-Android%20%7C%20iOS-green)
![Language](https://img.shields.io/badge/Language-Dart-blue)
![Framework](https://img.shields.io/badge/Framework-Flutter-02569B)
![API](https://img.shields.io/badge/API-lyrics.ovh-purple)
![Status](https://img.shields.io/badge/Status-Completed-brightgreen)

---

## 📖 Overview

**Lyrics Finder** is a simple and elegant Flutter mobile application that fetches song lyrics in real time using the [lyrics.ovh](https://lyrics.ovh/) public API. Enter the artist's name and the song title, tap **Search**, and the full lyrics are displayed instantly on screen.

---

## ✨ Features

| Feature | Description |
|---|---|
| 🔍 **Search Lyrics** | Fetch lyrics by entering an artist name and song title |
| 🎤 **Live API Fetch** | Lyrics retrieved in real time from the lyrics.ovh API |
| 📜 **Full Lyrics Display** | Complete song lyrics displayed with styled typography |
| ❌ **Empty State Handling** | Displays "No lyrics found" when a result isn't available |
| 🎨 **Custom UI** | Gradient input panel, background image, and Google Fonts styling |

---

## 📱 Screen

### Home Screen (`Homescreen.dart`)
- App bar with a music note icon and title
- Headline text — *"Get Your Lyrics Now"*
- Gradient input panel with two text fields:
  - Artist name
  - Song title
- **Search** button triggers the API call
- Lyrics section below displays results or a "No lyrics found" message

---

## 🏗️ Project Structure

```
lib/
├── main.dart              # App entry point
├── Homescreen.dart        # Main screen — search input and lyrics display
└── utils/
    └── style.dart         # Shared padding and border radius styles
```

---

## 🌐 API

This app uses the free [lyrics.ovh](https://lyrics.ovh/) public API — no API key required.

**Endpoint:**
```
GET https://api.lyrics.ovh/v1/{artist}/{title}
```

**Example:**
```
GET https://api.lyrics.ovh/v1/Adele/Hello
```

**Response:**
```json
{
  "lyrics": "Hello, it's me\nI was wondering if after all these years..."
}
```

---

## 🧩 Key Dependencies

| Package | Purpose |
|---|---|
| [`http`](https://pub.dev/packages/http) | HTTP GET requests to the lyrics.ovh API |
| [`google_fonts`](https://pub.dev/packages/google_fonts) | Custom fonts (Abhaya Libre, Rozha One, Cherry Swash) |

Add these to your `pubspec.yaml`:

```yaml
dependencies:
  flutter:
    sdk: flutter
  http: ^1.2.0
  google_fonts: ^6.2.1
```

---

## 🚀 Getting Started

### Prerequisites
- Flutter SDK installed ([Install Flutter](https://docs.flutter.dev/get-started/install))
- Android Studio or VS Code with Flutter/Dart plugins
- A connected device or emulator

### Setup

1. **Clone the repository**
   ```bash
   git clone https://github.com/your-username/lyrics-finder-app.git
   cd lyrics-finder-app
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Add assets** — place your background image in the `assets/` folder and declare it in `pubspec.yaml`:
   ```yaml
   flutter:
     assets:
       - assets/OIP.jpeg
   ```

4. **Run the app**
   ```bash
   flutter run
   ```

---

## 🖼️ Preview

![Lyrics Finder UI](https://github.com/user-attachments/assets/80020124-a758-4d0a-b64b-3cf95d5f5abc)

---

## 📄 License

This project is open source and available under the [MIT License](LICENSE).

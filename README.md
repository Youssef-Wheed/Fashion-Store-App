<div align="center">

# Fashion Store

**A modern, high-fidelity e-commerce Flutter application for a premium fashion shopping experience.**

[![Flutter](https://img.shields.io/badge/Flutter-%5E3.13.2-02569B?logo=flutter&logoColor=white)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-3.x-0175C2?logo=dart&logoColor=white)](https://dart.dev)
[![Platform](https://img.shields.io/badge/Platform-Android%20%7C%20iOS-lightgrey)](#)
[![License](https://img.shields.io/badge/License-Unlicensed-red)](#license)

</div>

---

Fashion Store is a polished Flutter UI/UX case study built around smooth motion design, rich media, and an interactive product details experience — including a persistent, draggable bottom sheet with a live-shrinking product image.

## Table of Contents

- [Features](#features)
- [Screenshots](#screenshots)
- [Tech Stack & Dependencies](#tech-stack--dependencies)
- [Project Structure](#project-structure)
- [Getting Started](#getting-started)
- [App Icon](#app-icon)
- [Known Limitations & Roadmap](#known-limitations--roadmap)
- [License](#license)

---

## Features

| | |
|---|---|
| **Splash Screen** | Engaging entry point with a custom logo reveal animation. |
| **Home Screen** | Immersive auto-playing video background with horizontal category navigation. |
| **Categories Grid** | Clean, responsive product grid with a functional sort and filter bar. |
| **Product Details** | Persistent draggable bottom sheet with an image that shrinks smoothly as it expands. |
| **Rich Product Info** | Descriptions, brand info, colour/size selectors, and "You might also like" recommendations. |
| **Back Navigation** | Fully integrated back arrow in a custom app bar for a consistent flow. |
| **Performance Optimized** | Image caching and targeted widget rebuilds for a smooth 60fps experience. |

---

## Screenshots

<div align="center">

| Splash Screen | Home Screen | Categories |
| :---: | :---: | :---: |
| <img width="270" alt="Splash Screen" src="https://github.com/user-attachments/assets/881fe19e-d9a6-4191-bd8a-3b0e38f4a967"> | <img width="270" alt="Home Screen" src="https://github.com/user-attachments/assets/7037a23f-bdec-4f78-808f-dd9baaa97d9f"> | <img width="270" alt="Categories" src="https://github.com/user-attachments/assets/e719fde0-98c0-4e95-9c6a-6b4ffcfb6906"> |

| Product Details — Collapsed | Product Details — Expanded |
| :---: | :---: |
| <img width="270" alt="Product Details Collapsed" src="https://github.com/user-attachments/assets/45ad0a4c-6578-4510-9341-04f4aafa0f14"> | <img width="270" alt="Product Details Expanded" src="https://github.com/user-attachments/assets/ed4cf667-46f6-4658-a215-ed05223fce02"> |

</div>

---

## Tech Stack & Dependencies

Built with **Flutter**, using a lightweight, dependency-conscious stack:

| Package | Purpose |
| :--- | :--- |
| [`flutter_svg`](https://pub.dev/packages/flutter_svg) | Renders scalable vector icons and logos. |
| [`video_player`](https://pub.dev/packages/video_player) | Powers the auto-playing promotional video on the Home screen. |
| [`google_fonts`](https://pub.dev/packages/google_fonts) | Provides the app's typography (Inter). |
| [`gap`](https://pub.dev/packages/gap) | Consistent, readable spacing between UI elements. |
| [`cupertino_icons`](https://pub.dev/packages/cupertino_icons) | Standard iOS-style iconography. |
| [`flutter_launcher_icons`](https://pub.dev/packages/flutter_launcher_icons) *(dev)* | Generates Android/iOS launcher icons from a single source image. |

---

## Project Structure

```
lib/
├── Pages/      # Screen-level widgets — Splash, Home, Categories, ProductDetails
├── Widgets/    # Reusable UI components — CustomText, CustomAppbar, CustomProductItem, ...
├── Models/     # Data models — ProductModel, CategoryModel
└── data/       # Mock/catalog data sources

assets/         # Images, SVGs, video, and app icon source
```

---

## Getting Started

### Prerequisites

- Flutter SDK `^3.13.2`
- Dart SDK (bundled with the matching Flutter version)
- Android Studio or VS Code with the Flutter/Dart extensions

### Installation

```bash
# 1. Clone the repository
git clone https://github.com/your-username/fashion_store_app.git
cd fashion_store_app

# 2. Install dependencies
flutter pub get

# 3. Run the app
flutter run
```

---

## App Icon

To update the launcher icon, replace the source image at `assets/icon/icon.png`, then regenerate platform icons:

```bash
dart run flutter_launcher_icons
```

Configuration lives in the `flutter_launcher_icons:` section of `pubspec.yaml`.

---

## Known Limitations & Roadmap

- **Static data** — products and categories are mocked in `lib/data/`; no backend/API integration yet.
- **No cart or checkout** — the "ADD TO BAG" button is currently visual only.
- **No state management library** — the app relies on `setState`; consider Provider, Bloc, or Riverpod as it grows.
- **No automated tests** — unit, widget, and integration tests are not yet implemented.

---

## License

No license has been added yet. *(e.g. MIT, Apache 2.0 — add one before publishing publicly.)*

---

<div align="center">
<sub>Built as a high-fidelity Flutter UI/UX learning project.</sub>
</div>

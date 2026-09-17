# 👗 Fashion Store App

A modern and stylish e-commerce Flutter application designed for a premium fashion shopping experience. The app features smooth animations, rich media integration, and a unique draggable product details interface.

---

## ✨ Features

*   **🚀 Splash Screen**: Engaging entry point with a custom logo reveal animation.
*   **🏠 Home Screen**: Features an immersive auto-playing video background and a horizontal category navigation bar.
*   **🛍️ Categories Grid**: A clean, responsive grid of products with a functional sort and filter bar.
*   **📄 Product Details**: 
    *   **Persistent Draggable Bottom Sheet**: Smoothly drag the sheet up to reveal more information.
    *   **Interactive Image Scaling**: The product image dynamically shrinks as the sheet expands to stay visible.
    *   **Rich Product Info**: Displays detailed descriptions, brand info, color/size selectors, and "You might also like" recommendations.
*   **⬅️ Back Navigation**: Fully integrated back arrow in a custom app bar for a consistent user flow.
*   **⚡ Performance Optimized**: Uses image caching and targeted widget rebuilds for a butter-smooth 60fps experience.

---

## 📸 Screenshots

| Splash Screen | Home Screen | Categories |
| :---: | :---: | :---: |
| ![Splash](screenshots/splash.png) | ![Home](screenshots/home.png) | ![Categories](screenshots/categories.png) |

| Details (Collapsed) | Details (Expanded) |
| :---: | :---: |
| ![Details Collapsed](screenshots/details_collapsed.png) | ![Details Expanded](screenshots/details_expanded.png) |

*(Note: Replace these placeholders with actual screenshots from your device/emulator)*

---

## 🛠️ Tech Stack & Dependencies

The app is built using **Flutter** and leverages the following packages:

| Package | Purpose |
| :--- | :--- |
| `flutter_svg` | Renders high-quality scalable vector graphics for icons and logos. |
| `video_player` | Handles the auto-playing promotional video on the Home screen. |
| `google_fonts` | Provides premium typography (Inter) throughout the application. |
| `gap` | Ensures consistent and readable spacing between UI components. |
| `cupertino_icons` | Used for standard iOS-style iconography. |
| `flutter_launcher_icons` | (Dev) Automates the generation of app icons for Android and iOS. |

---

## 📂 Project Structure

*   **`lib/Pages/`**: Contains the main screen implementations (Splash, Home, Categories, ProductDetails).
*   **`lib/Widgets/`**: Reusable UI components like CustomText, CustomAppbar, and CustomProductItem.
*   **`lib/Models/`**: Defines the data structures (ProductModel, CategoryModel) used in the app.
*   **`lib/data/`**: Holds the mock data and catalog definitions.
*   **`assets/`**: Contains all images, SVGs, and video files used in the application.

---

## 🚀 Getting Started

### Prerequisites

*   Flutter SDK: `^3.13.2`
*   Dart SDK: Matching Flutter version
*   Android Studio / VS Code with Flutter extensions

### Installation

1.  **Clone the repository:**
    ```bash
    git clone https://github.com/your-username/fashion_store_app.git
    cd fashion_store_app
    ```

2.  **Install dependencies:**
    ```bash
    flutter pub get
    ```

3.  **Run the application:**
    ```bash
    flutter run
    ```

---

## 🎨 App Icon

To update the application icon, replace the source image at `assets/icon/icon.png` and run the following command to regenerate the platform-specific icons:

```bash
dart run flutter_launcher_icons
```

---

## 📝 Known Limitations & TODO

*   **Static Data**: All product and category data is currently mocked in `lib/data/`. Future versions should integrate with a REST API or Firebase.
*   **Cart & Checkout**: The "ADD TO BAG" button is currently purely visual; no cart logic or payment gateway is implemented.
*   **State Management**: The app uses basic `setState`. For larger scale, consider implementing Provider, Bloc, or Riverpod.
*   **Testing**: Unit, widget, and integration tests are not yet implemented.

---

## ⚖️ License

[Add your license here (e.g., MIT, Apache 2.0)]

---
*Developed as a high-fidelity Flutter UI/UX learning project.*

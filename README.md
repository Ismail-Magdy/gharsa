# Gharsa 🌿

<img width="1412" height="667" alt="image" src="https://github.com/user-attachments/assets/7b9464b1-74c6-4cce-a528-7c4e9d44b355" />

---

**Gharsa** is a modern, Flutter Based Mobile Application Designed To Simplify Healthy Living. It Offers a Seamless and Inspiring Shopping Experience For Fresh Groceries, Organic Produce, and Natural Foods. With a Clean, Minimalist Interface, Gharsa Empowers Users To Effortlessly Discover Nutritious Options and Build Better Eating Habits.

---

## Tech Stack

- **Framework:** Flutter (Dart 3+)
- **Architecture:** Clean Architecture (Presentation → Domain ← Data)
- **State Management:** flutter_bloc (Cubit)
- **Dependency Injection:** get_it
- **Networking:** Dio
- **Local Storage:** SharedPreferences, FlutterSecureStorage
- **Responsive Design:** flutter_screenutil

## Architecture Overview

The project follows Clean Architecture with three distinct layers:

- **Presentation** — UI, Cubits, Widgets (depends on Domain)
- **Domain** — Entities, Repository contracts, Use Cases (no dependencies)
- **Data** — Models, Data Sources, Repository implementations (depends on Domain)

Dependencies point inward only: `presentation → domain ← data`

Shared code used across features lives in `core/`.

## Getting Started

1. Clone the repository:

   ```bash
   git clone https://github.com/Ismail-Magdy/gharsa/
   cd gharsa
   ```

2. Create a `.env` file in the project root (see `.env.example`):

   ```
   BASE_URL=https://agricommerce.runasp.net/api/
   ```

3. Install dependencies:

   ```bash
   flutter pub get
   ```

4. Run the app:
   ```bash
   flutter run
   ```

## Features

- [ ] Onboarding
- [ ] Authentication (Login, Signup, OTP)
- [ ] Home & Discovery
- [ ] Categories & Best Sellers
- [ ] Search
- [ ] Product Details
- [ ] Favorites (Wishlist)
- [ ] Cart & Orders
- [ ] User Profile & Settings

## API

- **Base URL:** Configured via `.env`
- **Auth:** Bearer token (JWT), 30-day lifetime
- **Endpoints:** Account, Product, Category, Order

## Folder Structure

```
lib/
├── main.dart
├── gharsa.dart
├── core/
│   ├── di/
│   │   └── dependency_injection.dart
│   ├── helpers/
│   │   ├── abstracts/
│   │   │   └── use_case.dart
│   │   ├── constants/
│   │   │   ├── app_constants.dart
│   │   │   ├── app_assets.dart
│   │   │   ├── app_regex.dart
│   │   │   └── storage_keys.dart
│   │   ├── extensions/
│   │   │   ├── context_extension.dart
│   │   │   ├── navigation_extension.dart
│   │   │   └── string_extension.dart
│   │   ├── shared_reference_helpers/
│   │   │   ├── shared_pref_helper.dart
│   │   │   └── secure_storage_helper.dart
│   │   └── spacing.dart
│   ├── networking/
│   │   ├── interceptors/
│   │   │   └── auth_interceptor.dart
│   │   ├── api_constants.dart
│   │   ├── api_error_handler.dart
│   │   ├── api_result.dart
│   │   ├── dio_factory.dart
│   │   ├── failure.dart
│   │   └── network_info.dart
│   ├── routing/
│   │   ├── app_router.dart
│   │   └── routes.dart
│   ├── theming/
│   │   ├── app_colors.dart
│   │   ├── app_fonts.dart
│   │   └── font_weight_helper.dart
│   └── widgets/
│       ├── custom_button.dart
│       └── custom_text_field.dart
└── features/
    └── {feature_name}/
        ├── data/
        │   ├── models/
        │   ├── data_sources/
        │   └── repositories/
        ├── domain/
        │   ├── entities/
        │   ├── repositories/
        │   └── use_cases/
        └── presentation/
            ├── cubit/
            ├── screens/
            └── widgets/
```

🚧 Active Development: This project is currently in the making. More features and technical documentation will be added as we progress

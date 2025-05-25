# 🍽️ Flutter Recipes App (with BLoC)

### Overview 👀

**Flutter Recipes App** is a cooking recipe app made with Flutter and BLoC for managing app state. It follows the design from the Figma file and lets users easily browse recipes, like their favorites, upload new recipes, and manage them all in a simple and smooth way.

---

### 🎨 Figma Design

Please refer to the design mockup here:
[🔗 Figma Design - Recipes App](https://www.figma.com/design/NLdRsBpwJgHfSmXJq2i4a1/Recipes-App-%28Community%29?node-id=156-0&p=f&t=R5WBS1mIYbJyNTdW-0)

---

### Output 📱

Check out the output demo or screenshots here:
[📱 Output Demo Link](https://drive.google.com/file/d/17VJ2IrNaZooZ5F-2JS57nEfZhR1tU6VP/view?usp=sharing)

---

### Features ⭐️

- 🍳 Browse recipes with detailed info and photos.
- ❤️ Like and manage your favorite recipes.
- 🔄 Smooth onboarding experience for new users.
- 👤 Profile management with saved recipes and likes.
- 📤 Upload your own recipes with photos and details.
- 📱 Clean and responsive UI following the Figma design.

---

### Tech Stack 💻

- **Flutter**
- **Dart**
- **BLoC** for state management

---

### Installation 🛠️

1. Clone the repository:

```bash
git clone https://github.com/lamyaalsuhaibani/recipes-app.git
```

2. Navigate to the project folder:

```bash
cd recipes-app
```

3. Fetch dependencies:

```bash
flutter pub get
```

4. Run the app:

```bash
flutter run
```

---

### Folder Structure 🔨

```
lib
├── extensions
│   └── screens
│       └── get_size_screen.dart
├── features
│   ├── auth
│   │   ├── screens
│   │   │   ├── login_screen.dart
│   │   │   └── signup_screen.dart
│   │   └── widget
│   │       ├── buttom_text.dart
│   │       └── title_widget.dart
│   ├── home
│   │   ├── bloc
│   │   │   ├── liked_bloc.dart
│   │   │   ├── liked_event.dart
│   │   │   └── liked_state.dart
│   │   ├── models
│   │   │   └── recipe_data.dart
│   │   ├── screens
│   │   │   └── home_screen.dart
│   │   └── widget
│   │       └── search_bar_widget.dart
│   ├── navigation
│   │   ├── bloc
│   │   │   ├── navigation_bloc.dart
│   │   │   ├── navigation_event.dart
│   │   │   └── navigation_state.dart
│   │   └── screen
│   │       └── navigation_bar_screen.dart
│   ├── notification
│   │   └── screen
│   │       └── notification_screen.dart
│   ├── onboarding_screens.dart
│   ├── profile
│   │   ├── screens
│   │   │   ├── liked_screen.dart
│   │   │   ├── profile_screen.dart
│   │   │   └── recipes_screen.dart
│   │   └── widget
│   │       └── bottom_bar_widget.dart
│   ├── upload
│   │   ├── bloc
│   │   │   ├── uplaod_bloc.dart
│   │   │   ├── uplaod_event.dart
│   │   │   └── uplaod_state.dart
│   │   ├── models
│   │   │   └── upload_model.dart
│   │   ├── screens
│   │   │   ├── upload_screen.dart
│   │   │   └── uploud_form_screen.dart
│   │   └── widgets
│   │       ├── cover_photo_widget.dart
│   │       ├── food_details_widget.dart
│   │       ├── show_upload_success_dialog.dart
│   │       └── tab_bar_widget.dart
│   └── widgets
│       ├── buttom_widget.dart
│       └── text_field_widget.dart
├── main.dart
└── style
    ├── style_color.dart
    ├── style_size.dart
    └── theme.dart
```

---

### How to Use 📲

1. Open the app and sign up or log in.
2. Explore the home screen to browse recipes.
3. Like recipes to save them to your profile.
4. Use the navigation bar to switch between home, profile, notifications, and upload screens.
5. Upload your own recipes using the upload form.

---

### Author 👩‍💻

**Lamya Alsuhaibani**

[🌐 Portfolio Website](https://picayune-mouth-ade.notion.site/Lamya-Alsuhaibani-310c29eda5ba40638fa895968d3f630d)
[💼 LinkedIn](https://www.linkedin.com/in/lamya-a-alsuhaibani/)


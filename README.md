#  Recipes App:

An application designed to provide cooking recipes in an organized and user-friendly manner. It allows users to browse a wide variety of recipes, with detailed information for each one such as ingredients, preparation time, and cooking method. The app relies on data loading and state management to ensure a smooth and interactive experience.

---

Here’s the English translation of your requirements:

---
# App Description:

 # SignInScreen:
 
* A page that displays the user login interface.
* Contains fields to enter email or phone number and password.
* A login button that sends the login data to the Bloc for authentication.
* On successful login, navigates to the HomeScreen.
* On failed login, shows an error message.
* A button to navigate to the SignUpScreen.
* Also contains a "Forgot Password?" link (currently without functionality).

 # SignUpScreen
   A registration screen that allows the user to create a new account in the app by entering information such as name, email, and password.

Here’s the English translation:

---

# HomeScreen Page
Uses a BottomNavigationBar with 5 items.
When tapping Upload or Profile (items 1 and 4), it opens the UploadStep and MyProfile pages respectively via Navigator.push.

There is a horizontal list display of cards showing images, texts, and favorite buttons.
When tapping the heart icon on a card, the item is added to or removed from the likedItems collection.


 # MyProfile Page:
* A user profile page that displays:

* The user’s photo and name.
* The number of recipes they have added, the number of followers, and the number they are following.
* A bottom navigation bar that allows navigation to other pages such as Home or Upload pages.
* Sections for "Recipes" and "Liked," showing recipe cards with images, titles, and cooking durations.

**Purpose:**
Used to display the user’s information and their recipes in an attractive and organized way.

---

# UploadStep Page:
A dedicated page for uploading a new food recipe, containing:

* A field to enter the food name.
* A field for the description.
* A button to pick an image from the gallery.
* Upon completion, a dialog appears confirming the successful upload with an image and a message.

**Purpose:**
Enables the user to add a new recipe with an image and description.

Here’s the English translation:

---

 # OnboardingScreen
   A welcome screen that displays a collection of circular food images artistically arranged in the background.

---

Here’s the English translation for the app features:

---

# App Features:

- Use of BLoC Pattern: Separates app logic from the user interface to enhance maintainability and future development.
- Easy Recipe Creation:  Upload new recipes with an image and detailed description.
- Comprehensive and Organized Browsing:  Display all recipes on the home page in a convenient and fast manner.
- Advanced Interaction: Like recipes and save them in a dedicated favorites page.
- Easy Favorites Management: Ability to remove recipes from favorites, giving the user full control.

----

lib/
├── screens/
│   ├── home_screen.dart        
│   ├── sign_in_screen.dart     
│   ├── sign_up_screen.dart    
│   ├── upload_screen.dart      
│   ├── profile_screen.dart      
│   └── recipes_screen.dart      
│
└── bloc/
    ├── sign_in_bloc.dart        
    ├── sign_in_event.dart       
    ├── sign_in_state.dart     
    ├── sign_up_bloc.dart        
    ├── sign_up_event.dart       
    └── sign_up_state.dart     

-----
# screenshots:      

![Screenshot 1](assets/screenshots/screenshot/Screenshot1.jpg)
![Screenshot 2](assets/screenshots/screenshot/Screenshot2.jpg)
![Screenshot 3](assets/screenshots/screenshot/Screenshot3.jpg)
![Screenshot 4](assets/screenshots/screenshot/Screenshot4.jpg)
![Screenshot 5](assets/screenshots/screenshot/Screenshot5.jpg)
![Screenshot 6](assets/screenshots/screenshot/Screenshot6.jpg)
![Screenshot 7](assets/screenshots/screenshot/Screenshot7.jpg)
![Screenshot 8](assets/screenshots/screenshot/Screenshot8.jpg)
![Screenshot 9](assets/screenshots/screenshot/Screenshot9.jpg)
![Screenshot 10](assets/screenshots/screenshot/Screenshot10.jpg)
![Screenshot 11](assets/screenshots/screenshot/Screenshot11.jpg)
![Screenshot 12](assets/screenshots/screenshot/Screenshot12.jpg)
![Screenshot 13](assets/screenshots/screenshot/Screenshot13.jpg)
![Screenshot 14](assets/screenshots/screenshot/Screenshot14.jpg)
![Screenshot 15](assets/screenshots/screenshot/Screenshot15.jpg)

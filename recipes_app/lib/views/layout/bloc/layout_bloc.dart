import 'dart:async';

import 'package:awesome_bottom_bar/tab_item.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes_app/Theme/app_colors.dart';
import 'package:recipes_app/models/food_model.dart';
import 'package:recipes_app/models/user_model.dart';

import 'package:recipes_app/style/my_style.dart';
import 'package:recipes_app/views/home/home_view.dart';
import 'package:recipes_app/views/profile/profile_view.dart';
import 'package:recipes_app/views/upload/upload_view.dart';
import 'package:recipes_app/widgets/upload/dialog_widget.dart';

part 'layout_event.dart';
part 'layout_state.dart';

class LayoutBloc extends Bloc<LayoutEvent, LayoutState> {
  int visit = 0;
  Color colorSelect = AppColors.success;
  double sliderValue = 0;
  String foodName = "";
  String foodDescription = "";
  List<FoodModel> favoriteFoods = [];
  List<FoodModel> myRecipes = [];

  // sample
  List<FoodModel> foods = [
    FoodModel(
      image: "assets/images/foods/food1.png",
      name: 'Pancake',
      description: '',
      duration: 60,
      creator: users[0],
      isFavorite: false,
    ),
    FoodModel(
      image: "assets/images/foods/food2.png",
      name: 'Salad',
      description: '',
      duration: 60,
      creator: users[1],
      isFavorite: false,
    ),
    FoodModel(
      image: "assets/images/foods/food3.png",
      name: '...',
      description: '',
      duration: 60,
      creator: users[2],
      isFavorite: false,
    ),
    FoodModel(
      image: "assets/images/foods/food4.png",
      name: '...',
      description: '',
      duration: 60,
      creator: users[3],
      isFavorite: false,
    ),
  ];

  // app bars
  List<PreferredSizeWidget?> appBars = [
    null,
    AppBar(
      leadingWidth: 100,
      leading: TextButton(
        onPressed: () {},
        child: Text("Cancel", style: TextStyle(color: AppColors.accent)),
      ),
      actions: [
        Text("1/2", style: TextStyle(color: AppColors.textHint)),
        StyleApp.sizeW16,
      ],
    ),

    null,
    null,
    AppBar(leading: null, actions: [Icon(Icons.share), StyleApp.sizeW16]),
  ];
  List<TabItem> items = [
    TabItem(icon: Icons.home, title: 'Home'),
    TabItem(icon: Icons.edit, title: 'Upload'),
    TabItem(icon: Icons.qr_code_scanner, title: 'Scan'),
    TabItem(icon: Icons.notifications_outlined, title: 'Notification'),
    TabItem(icon: Icons.person, title: 'Profile'),
  ];
  List<Widget> views = [
    HomeView(),
    UploadView(),
    HomeView(),
    HomeView(),
    ProfileView(),
  ];

  LayoutBloc() : super(LayoutInitial()) {
    on<LayoutEvent>((event, emit) {});
    on<ChangePage>(changePage);
    on<ChangeSlider>(changeSlider);
    on<ChangeFavorite>(changeFavorite);
    on<CreateRecipe>(createRecipe);
  }

  void showUploadDialog(BuildContext contextUploadView) {
    showDialog(
      context: contextUploadView,
      builder: (BuildContext context) {
        return DialogWidget();
      },
    );
  }

  FutureOr<void> changePage(ChangePage event, Emitter<LayoutState> emit) {
    visit = event.index;
    print("${event.index} --#-- index$visit");

    emit(ChangePageSuccessful());
  }

  FutureOr<void> changeSlider(ChangeSlider event, Emitter<LayoutState> emit) {
    sliderValue = event.value;
    emit(ChangeSliderSuccessful());
  }

  FutureOr<void> changeFavorite(
    ChangeFavorite event,
    Emitter<LayoutState> emit,
  ) {
    FoodModel food = foods[event.indexFood];
    food.isFavorite = !food.isFavorite;
    if (food.isFavorite) {
      favoriteFoods.add(food);
    } else {
      favoriteFoods.remove(food);
    }
    print(event.indexFood);
    emit(ChangeFavoriteSuccessful());
  }

  FutureOr<void> createRecipe(CreateRecipe event, Emitter<LayoutState> emit) {
    FoodModel newRecipe = FoodModel(
      creator: users[0],
      isFavorite: false,
      image: "assets/images/foods/food3.png",
      name: foodName,
      description: foodDescription,
      duration: sliderValue,
    );
    myRecipes.add(newRecipe);
    print("add  $sliderValue");

    emit(CreateRecipeSuccessful());
  }
}

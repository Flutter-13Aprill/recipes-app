import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';
import 'package:project5/models/recpies_model.dart';

part 'likes_event.dart';
part 'likes_state.dart';

class LikesBloc extends Bloc<LikesEvent, LikesState> {
  List<Widget> list = [];
  List<RecpiesModel> recpiesModel = [
    RecpiesModel(
      id: Random().nextInt(1999).toString(),
      setName: 'Calum Lewis',
      setProfilePicture: 'assets/images/profile1.png',
      setFoodImage: 'assets/images/pancake.png',
      setFoodName: 'Pancake',
      setTimer: '>60 Minutes',
      isLike: false,
    ),
    RecpiesModel(
      id: Random().nextInt(1999).toString(),
      setName: 'Eilif Sonas',
      setProfilePicture: 'assets/images/profile2.png',
      setFoodImage: 'assets/images/salad.png',
      setFoodName: 'Salad',
      setTimer: '>60 Minutes',
      isLike: false,
    ),
    RecpiesModel(
      id: Random().nextInt(1999).toString(),
      setName: 'Elena Shelby',
      setProfilePicture: 'assets/images/profile3.png',
      setFoodImage: 'assets/images/crepe.png',
      setFoodName: 'Crepe',
      setTimer: '>60 Minutes',
      isLike: false,
    ),
    RecpiesModel(
      id: Random().nextInt(1999).toString(),
      setName: 'John Priyadi',
      setProfilePicture: 'assets/images/profile4.png',
      setFoodImage: 'assets/images/fruits.png',
      setFoodName: 'Fruits',
      setTimer: '>60 Minutes',
      isLike: false,
    ),
  ];
  bool isClicked = false;
  List<RecpiesModel> liked = [];

  LikesBloc() : super(LikesInitial()) {
    on<FavoriteEvent>(addFavorite);
    on<RemoveEvent>(removeMethod);
  }

  FutureOr<void> addFavorite(FavoriteEvent event, Emitter<LikesState> emit) {
    liked.add(event.liked);

    emit(SuccessState());
  }

  FutureOr<void> removeMethod(RemoveEvent event, Emitter<LikesState> emit) {
     final index = liked.indexWhere(
      (element) => element.id == event.deleteId,
    );

    // print(event.deleteId);
    // print(liked[0].id);
    //     print(liked[1].id);

    // print('current is: $index');
    // print(event.deleteId);
    // print(liked[index].id);
    // if (index != -1) {
    print(event.deleteId);
    print(liked[index].setFoodName);
    print(liked[index].id);
    if(index !=-1){
    liked.removeAt(index);
    }
    // }

    print('yes or no iam i');

    print(liked);
    emit(SuccessState());
  }
}

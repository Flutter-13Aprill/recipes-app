import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';
import 'package:project5/screens/recipe/bloc/recpie_bloc.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
      List<Widget> saved = RecpieBloc().list;

  ProfileBloc() : super(ProfileInitial()) {

    on<ProfileEvent>(createList);
  }

  FutureOr<void> createList(ProfileEvent event, Emitter<ProfileState> emit) {
      print(saved);
    emit(ProfileInitial());
  }
}

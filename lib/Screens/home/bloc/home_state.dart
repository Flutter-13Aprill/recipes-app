part of 'home_bloc.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

final class CategorySelected extends HomeState {}

final class RecipeLiked extends HomeState {}

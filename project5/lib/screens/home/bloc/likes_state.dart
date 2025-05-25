part of 'likes_bloc.dart';

@immutable
sealed class LikesState {}

final class LikesInitial extends LikesState {}

final class SuccessState extends LikesState {}


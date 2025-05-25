part of 'like_bloc.dart';

@immutable
sealed class LikeState {}

class LikeInitial extends LikeState {}
class LikedState extends LikeState {}
class NotLikedState extends LikeState {}

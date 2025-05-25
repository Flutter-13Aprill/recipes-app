part of 'like_bloc.dart';

@immutable
sealed class LikeEvent {}

class IsLikeEvent extends LikeEvent {
final String imagepath;


IsLikeEvent(this.imagepath);
}

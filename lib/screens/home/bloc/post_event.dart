part of 'post_bloc.dart';

@immutable
sealed class PostEvent {}

class InitialPostEvent extends PostEvent{}

class LikedPostEvent extends PostEvent{
  final PostModel post;

  LikedPostEvent({required this.post});
}

class DeletePostFromLikedPostsEvent extends PostEvent {
  final PostModel post;

  DeletePostFromLikedPostsEvent({required this.post});
}

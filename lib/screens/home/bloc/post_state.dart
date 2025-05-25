part of 'post_bloc.dart';

@immutable
sealed class PostState {}

final class PostInitial extends PostState{
  final List<PostModel> posts;

  PostInitial({required this.posts});
}

final class LikedPostedState extends PostState{

  final List<PostModel> likePosts;

  LikedPostedState({required this.likePosts});
}


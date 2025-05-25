part of 'likes_bloc.dart';

@immutable
sealed class LikesEvent {}


final class FavoriteEvent extends LikesEvent{

    final RecpiesModel liked;
  FavoriteEvent({ required this.liked});

}
final class RemoveEvent extends LikesEvent{

    // final String deleteId;
        final String deleteId;

  RemoveEvent({ required this.deleteId,});

}
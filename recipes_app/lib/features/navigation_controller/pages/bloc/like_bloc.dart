import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:recipes_app/core/text/liked_post.dart';

part 'like_event.dart';
part 'like_state.dart';

class LikeBloc extends Bloc<LikeEvent, LikeState> {
  LikeBloc() : super(LikeInitial()) {
    on<LikeEvent>((event, emit) {
      
    });
    on<IsLikeEvent>((event, emit) {
  final exists = likedPosts.any((paths) =>
      paths == event.imagepath);

  if (exists) {
    
    emit(LikedState());
  } else {
    
    emit(NotLikedState());
  }
});

  }
}

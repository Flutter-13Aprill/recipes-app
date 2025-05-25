import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:re/models/post_model.dart';


part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {

  List<PostModel> posts = [
    PostModel(authorName: 'Calum Lewis', recipeName: 'Pancake', recipeDuration: '>60 mins', recipeCategory: 'Food', authorImage: 'assets/home/avatars/p1.png', recipeImage: 'assets/home/recipes_images/r1.png'),
    PostModel(authorName: 'Eilif Sonas',recipeName: 'Salad',recipeDuration: '>60 mins',recipeCategory: 'Food',authorImage: 'assets/home/avatars/p2.png',recipeImage: 'assets/home/recipes_images/r2.png'),
    PostModel(authorName: 'John Priyadi',recipeName: 'Salad',recipeDuration: '>60 mins',recipeCategory: 'Food',authorImage: 'assets/home/avatars/p3.png',recipeImage: 'assets/home/recipes_images/r3.png'),
    PostModel(authorName: 'Elena Shelby',recipeName: 'Salad',recipeDuration: '>60 mins',recipeCategory: 'Food',authorImage: 'assets/home/avatars/p4.png',recipeImage: 'assets/home/recipes_images/r4.png',)
  ];

  List<PostModel> likedPosts = [];

  PostBloc() : super(PostInitial(posts: [] )) {
    on<PostEvent>((event, emit) {
      // TODO: implement event handler
      
    });

    on<InitialPostEvent>(initialPosts);
    on<LikedPostEvent>(addPostToLikedPosts);
    on<DeletePostFromLikedPostsEvent>(deletePostFromLikedPosts);
  }

  FutureOr<void> initialPosts(InitialPostEvent event, Emitter<PostState> emit) {
    
    emit(PostInitial(posts: posts));
  }

  FutureOr<void> addPostToLikedPosts(LikedPostEvent event, Emitter<PostState> emit) {
    final post = event.post; 
    post.isLikePost = true;
    likedPosts.add(post);
    emit(LikedPostedState(likePosts: likedPosts));
  }

  FutureOr<void> deletePostFromLikedPosts(DeletePostFromLikedPostsEvent event, Emitter<PostState> emit) {
    final post = likedPosts.firstWhere((element) => event.post.id == element.id,);
    post.isLikePost = false;
    final index = likedPosts.indexOf(post);

    likedPosts.removeAt(index);
    emit(LikedPostedState(likePosts: likedPosts));
  }
}

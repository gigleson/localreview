import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:localreview/core/common/snackbar/my_snackbar.dart';

import 'package:localreview/features/post/domain/entity/post_entity.dart';
import 'package:localreview/features/post/domain/use_case/AddCommentUseCase.dart';
import 'package:localreview/features/post/domain/use_case/AddPostUseCase.dart';
import 'package:localreview/features/post/domain/use_case/BookmarkPostUseCase.dart';
import 'package:localreview/features/post/domain/use_case/DeletePostUseCase.dart';
import 'package:localreview/features/post/domain/use_case/DislikePostUseCase.dart';
import 'package:localreview/features/post/domain/use_case/GetAllPostsUseCase.dart';
import 'package:localreview/features/post/domain/use_case/GetCommentsUseCase.dart';
import 'package:localreview/features/post/domain/use_case/GetUserPostsUseCase.dart';
import 'package:localreview/features/post/domain/use_case/LikePostUseCase.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final AddPostUseCase addPostUseCase;
  final GetAllPostsUseCase getAllPostsUseCase;
  final GetUserPostsUseCase getUserPostsUseCase;
  final LikePostUseCase likePostUseCase;
  final DislikePostUseCase dislikePostUseCase;
  final AddCommentUseCase addCommentUseCase;
  final GetCommentsUseCase getCommentsUseCase;
  final DeletePostUseCase deletePostUseCase;
  final BookmarkPostUseCase bookmarkPostUseCase;

  PostBloc({
    required this.addPostUseCase,
    required this.getAllPostsUseCase,
    required this.getUserPostsUseCase,
    required this.likePostUseCase,
    required this.dislikePostUseCase,
    required this.addCommentUseCase,
    required this.getCommentsUseCase,
    required this.deletePostUseCase,
    required this.bookmarkPostUseCase,
  }) : super(PostState.initial()) {
    on<AddPostEvent>(_onAddPost);
    // on<GetAllPostsEvent>(_onGetAllPosts);
  //   on<GetUserPostsEvent>(_onGetUserPosts);
  //   on<LikePostEvent>(_onLikePost);
  //   on<DislikePostEvent>(_onDislikePost);
  //   on<AddCommentEvent>(_onAddComment);
  //   on<GetCommentsEvent>(_onGetComments);
  //   on<DeletePostEvent>(_onDeletePost);
  //   on<BookmarkPostEvent>(_onBookmarkPost);
  }

  Future<void> _onAddPost(AddPostEvent event, Emitter<PostState> emit) async {
    emit(state.copyWith(isLoading: true));

    final result = await addPostUseCase.call(AddPostParams(post: event.post));
   result.fold(
      (failure) {
        emit(state.copyWith(isLoading: false, isSuccess: false));
        showMySnackBar(
          context: event.context,
          message: "Registration Failed: ${failure.message}",
        );
      },
      (_) {
        emit(state.copyWith(isLoading: false, isSuccess: true));
        showMySnackBar(
          context: event.context,
          message: "post sucessful Successful",
        );
      },
    );
  }

  // Future<void> _onGetAllPosts(GetAllPostsEvent event, Emitter<PostState> emit) async {
  //   emit(state.copyWith(isLoading: true));

  //   final result = await getAllPostsUseCase.call();
  //    result.fold(
  //     (failure) {
  //       emit(state.copyWith(isLoading: false, isSuccess: false));
  //       showMySnackBar(
  //         context: event.context,
  //         message: "Registration Failed: ${failure.message}",
  //       );
  //     },
  //     (_) {
  //       emit(state.copyWith(isLoading: false, isSuccess: true));
  //       showMySnackBar(
  //         context: event.context,
  //         message: "Registration Successful",
  //       );
  //     },
  //   );
  // }

//   Future<void> _onGetUserPosts(GetUserPostsEvent event, Emitter<PostState> emit) async {
//     emit(state.copyWith(isLoading: true));

//     final result = await getUserPostsUseCase.call();
//     result.fold(
//       (failure) => emit(PostError(failure.message)),
//       (posts) => emit(UserPostsLoaded(posts)),
//     );
//   }

//   Future<void> _onLikePost(LikePostEvent event, Emitter<PostState> emit) async {
//     final result = await likePostUseCase.call(LikePostParams(postId: event.postId));
//     result.fold(
//       (failure) => emit(PostError(failure.message)),
//       (_) => emit(PostLiked()),
//     );
//   }

//   Future<void> _onDislikePost(DislikePostEvent event, Emitter<PostState> emit) async {
//     final result = await dislikePostUseCase.call(DislikePostParams(postId: event.postId));
//     result.fold(
//       (failure) => emit(PostError(failure.message)),
//       (_) => emit(PostDisliked()),
//     );
//   }

//   Future<void> _onAddComment(AddCommentEvent event, Emitter<PostState> emit) async {
//     final result = await addCommentUseCase.call(AddCommentParams(postId: event.postId, comment: event.comment));
//     result.fold(
//       (failure) => emit(PostError(failure.message)),
//       (_) => emit(CommentAdded()),
//     );
//   }

//   Future<void> _onGetComments(GetCommentsEvent event, Emitter<PostState> emit) async {
//     final result = await getCommentsUseCase.call(GetCommentsParams(postId: event.postId));
//     result.fold(
//       (failure) => emit(PostError(failure.message)),
//       (comments) => emit(CommentsLoaded(comments)),
//     );
//   }

//   Future<void> _onDeletePost(DeletePostEvent event, Emitter<PostState> emit) async {
//     final result = await deletePostUseCase.call(DeletePostParams(postId: event.postId));
//     result.fold(
//       (failure) => emit(PostError(failure.message)),
//       (_) => emit(PostDeleted()),
//     );
//   }

//   Future<void> _onBookmarkPost(BookmarkPostEvent event, Emitter<PostState> emit) async {
//     final result = await bookmarkPostUseCase.call(BookmarkPostParams(postId: event.postId));
//     result.fold(
//       (failure) => emit(PostError(failure.message)),
//       (_) => emit(PostBookmarked()),
//     );
  // }
}

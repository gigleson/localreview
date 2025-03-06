part of 'post_bloc.dart';

abstract class PostEvent extends Equatable {
  const PostEvent();

  @override
  List<Object> get props => [];
}

class AddPostEvent extends PostEvent {
  final BuildContext context;
  final PostEntity post;
  const AddPostEvent(this.post,this.context);
  
  @override
  List<Object> get props => [post];
}

class GetAllPostsEvent extends PostEvent {}

class GetUserPostsEvent extends PostEvent {
  final String userId;
  const GetUserPostsEvent(this.userId);
  
  @override
  List<Object> get props => [userId];
}

class LikePostEvent extends PostEvent {
  final String postId;
  const LikePostEvent(this.postId);
  
  @override
  List<Object> get props => [postId];
}

class DislikePostEvent extends PostEvent {
  final String postId;
  const DislikePostEvent(this.postId);
  
  @override
  List<Object> get props => [postId];
}

class AddCommentEvent extends PostEvent {
  final String postId;
  final String comment;
  const AddCommentEvent(this.postId, this.comment);
  
  @override
  List<Object> get props => [postId, comment];
}

class GetCommentsEvent extends PostEvent {
  final String postId;
  const GetCommentsEvent(this.postId);
  
  @override
  List<Object> get props => [postId];
}

class DeletePostEvent extends PostEvent {
  final String postId;
  const DeletePostEvent(this.postId);
  
  @override
  List<Object> get props => [postId];
}

class BookmarkPostEvent extends PostEvent {
  final String postId;
  const BookmarkPostEvent(this.postId);
  
  @override
  List<Object> get props => [postId];
}

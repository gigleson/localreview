import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:localreview/app/usecase/usecase.dart';
import 'package:localreview/core/error/failure.dart';
import 'package:localreview/features/post/domain/repository/post_repository.dart';

class BookmarkPostUseCase implements UsecaseWithParams<void, BookmarkPostParams> {
  final IPostRepository repository;

  BookmarkPostUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(BookmarkPostParams params) {
    return repository.bookmarkPost(params.postId);
  }
}

class BookmarkPostParams extends Equatable {
  final String postId;

  const BookmarkPostParams({required this.postId});

  @override
  List<Object> get props => [postId];
}

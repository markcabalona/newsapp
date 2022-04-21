import 'package:dartz/dartz.dart';

import 'package:newsapp/core/errors/failures.dart';
import 'package:newsapp/core/usecases/usecase.dart';
import 'package:newsapp/features/news/domain/entities/news.dart';
import 'package:newsapp/features/news/domain/repositories/news_repository.dart';

class BookMarkNews implements UseCase<void,News> {
  final NewsRepository repository;
  BookMarkNews({
    required this.repository,
  });
  @override
  Future<Either<Failure, void>> call(News newsToBookMark) {
    return repository.bookMarkNews(newsToBookMark);
  }
  
}

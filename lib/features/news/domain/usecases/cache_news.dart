import 'package:dartz/dartz.dart';
import 'package:newsapp/core/errors/failures.dart';
import 'package:newsapp/core/usecases/usecase.dart';
import 'package:newsapp/features/news/domain/entities/news.dart';
import 'package:newsapp/features/news/domain/repositories/news_repository.dart';

class CacheNews implements UseCase<void, List<News>> {
  final NewsRepository repository;
  CacheNews({
    required this.repository,
  });

  @override
  Future<Either<Failure, void>> call(newsToCache) {
    return repository.cacheNews(newsToCache);
  }
}

import 'package:dartz/dartz.dart';
import 'package:newsapp/core/errors/failures.dart';
import 'package:newsapp/core/usecases/usecase_params.dart';
import 'package:newsapp/features/news/domain/entities/news.dart';

abstract class NewsRepository {
  Future<Either<Failure, List<News>>> fetchNews(FetchNewsParams params);
  Future<Either<Failure, List<News>>> searchNews(SearchNewsParams params);
  Future<Either<Failure, void>> cacheNews(List<News> newsToCache);
  Future<Either<Failure,void>> bookMarkNews(News newsToBookMark);
}

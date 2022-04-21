import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';

import 'package:newsapp/core/errors/exceptions.dart';
import 'package:newsapp/core/errors/failures.dart';
import 'package:newsapp/core/usecases/usecase_params.dart';
import 'package:newsapp/features/news/data/datasources/news_local_datasource.dart';
import 'package:newsapp/features/news/data/datasources/news_remote_datasource.dart';
import 'package:newsapp/features/news/domain/entities/news.dart';
import 'package:newsapp/features/news/domain/repositories/news_repository.dart';

class NewsRepositoryImpl implements NewsRepository {
  final NewsRemoteDataSource remoteDataSource;
  final NewsLocalDataSource localDataSource;
  final Connectivity connectivity;
  NewsRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.connectivity,
  });

  @override
  Future<Either<Failure, List<News>>> fetchNews(FetchNewsParams params) async {
    try {
      return Right(
        await connectivity.checkConnectivity() == ConnectivityResult.none
            ? await localDataSource.fetchNews(params)
            : await remoteDataSource.fetchNews(params),
      );
    } on ServerException {
      return const Left(
        ServerFailure(
          message: "Error occured while fetching news from server.",
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<News>>> searchNews(
      SearchNewsParams params) async {
    try {
      return Right(
        await connectivity.checkConnectivity() == ConnectivityResult.none
            ? await localDataSource.searchNews(params)
            : await remoteDataSource.searchNews(params),
      );
    } on ServerException {
      return const Left(
        ServerFailure(
          message: "Error occured while searching news from server.",
        ),
      );
    }
  }

  @override
  Future<Either<Failure, void>> cacheNews(List<News> newsToCache) async {
    try {
      return Right(
        await localDataSource.cacheNews(newsToCache),
      );
    } on ServerException {
      return const Left(
        ServerFailure(
          message: "Error occured while caching news to local storage.",
        ),
      );
    }
  }

  @override
  Future<Either<Failure, void>> bookMarkNews(News newsToBookMark) async {
    try {
      return Right(
        await localDataSource.bookMarkNews(newsToBookMark),
      );
    } on ServerException {
      return const Left(
        ServerFailure(
          message: "Error occured while saving news to bookmarks.",
        ),
      );
    }
  }
}

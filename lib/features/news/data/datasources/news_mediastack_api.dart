import 'package:newsapp/core/errors/exceptions.dart';
import 'package:newsapp/core/usecases/usecase_params.dart';
import 'package:newsapp/features/news/data/datasources/news_remote_datasource.dart';
import 'package:newsapp/features/news/domain/entities/news.dart';

class MediaStackApi implements NewsRemoteDataSource {
  @override
  Future<List<News>> fetchNews(FetchNewsParams params) {
    // TODO: implement fetchNews
    throw ServerException();
  }

  @override
  Future<List<News>> searchNews(SearchNewsParams params) {
    // TODO: implement searchNews
    throw ServerException();
  }
}

import 'package:newsapp/core/usecases/usecase_params.dart';
import 'package:newsapp/features/news/data/datasources/news_local_datasource.dart';
import 'package:newsapp/features/news/domain/entities/news.dart';

class NewsDriftDb implements NewsLocalDataSource {
  const NewsDriftDb();
  @override
  Future<void> bookMarkNews(News newsToBookMark) {
    // TODO: implement bookMarkNews
    throw UnimplementedError();
  }

  @override
  Future<void> cacheNews(List<News> newsToCache) {
    // TODO: implement cacheNews
    throw UnimplementedError();
  }

  @override
  Future<List<News>> fetchNews(FetchNewsParams params) {
    // TODO: implement fetchNews
    throw UnimplementedError();
  }

  @override
  Future<List<News>> searchNews(SearchNewsParams params) {
    // TODO: implement searchNews
    throw UnimplementedError();
  }
  // TODO: Implement Local Database - Use Drift
}

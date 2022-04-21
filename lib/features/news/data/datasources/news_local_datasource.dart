import 'package:newsapp/core/usecases/usecase_params.dart';
import 'package:newsapp/features/news/domain/entities/news.dart';

abstract class NewsLocalDataSource {
  Future<List<News>> fetchNews(FetchNewsParams params);
  Future<List<News>> searchNews(SearchNewsParams params);
  Future<void> cacheNews(List<News> newsToCache);
  Future<void> bookMarkNews(News newsToBookMark);
}

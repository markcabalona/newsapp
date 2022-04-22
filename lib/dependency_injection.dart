import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:newsapp/features/news/data/datasources/news_drift_db.dart';
import 'package:newsapp/features/news/data/datasources/news_local_datasource.dart';
import 'package:newsapp/features/news/data/datasources/news_mediastack_api.dart';
import 'package:newsapp/features/news/data/datasources/news_remote_datasource.dart';
import 'package:newsapp/features/news/data/repositories/news_repository_impl.dart';
import 'package:newsapp/features/news/domain/repositories/news_repository.dart';
import 'package:newsapp/features/news/domain/usecases/bookmark_news.dart';
import 'package:newsapp/features/news/domain/usecases/cache_news.dart';
import 'package:newsapp/features/news/domain/usecases/fetch_news.dart';
import 'package:newsapp/features/news/domain/usecases/search_news.dart';
import 'package:newsapp/features/news/presentation/bloc/news_bloc.dart';

final sl = GetIt.instance;

void init() {
  // BloC
  sl.registerFactory(() => NewsBloc(
        fetchNews: sl<FetchNews>(),
        searchNews: sl<SearchNews>(),
        cacheNews: sl<CacheNews>(),
        bookMarkNews: sl<BookMarkNews>(),
      ));

  // Usecases
  sl.registerLazySingleton<FetchNews>(
      () => FetchNews(repository: sl<NewsRepository>()));
  sl.registerLazySingleton<SearchNews>(
      () => SearchNews(repository: sl<NewsRepository>()));
  sl.registerLazySingleton<CacheNews>(
      () => CacheNews(repository: sl<NewsRepository>()));
  sl.registerLazySingleton<BookMarkNews>(
      () => BookMarkNews(repository: sl<NewsRepository>()));

  // Repository
  sl.registerLazySingleton<NewsRepository>(
    () => NewsRepositoryImpl(
      remoteDataSource: sl<MediaStackApi>(),
      localDataSource: sl<NewsDriftDb>(),
      connectivity: sl<Connectivity>(),
    ),
  );

  // Datasources
  sl.registerLazySingleton<MediaStackApi>(() => const MediaStackApi());
  sl.registerLazySingleton<NewsDriftDb>(() => const NewsDriftDb());
  // Connectivity
  sl.registerLazySingleton<Connectivity>(() => Connectivity());
}

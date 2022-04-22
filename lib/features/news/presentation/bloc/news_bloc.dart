import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:newsapp/core/errors/failures.dart';
import 'package:newsapp/core/usecases/usecase_params.dart';
import 'package:newsapp/features/news/domain/entities/news.dart';

import 'package:newsapp/features/news/domain/usecases/bookmark_news.dart';
import 'package:newsapp/features/news/domain/usecases/cache_news.dart';
import 'package:newsapp/features/news/domain/usecases/fetch_news.dart';
import 'package:newsapp/features/news/domain/usecases/search_news.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final FetchNews fetchNews;
  final SearchNews searchNews;
  final CacheNews cacheNews;
  final BookMarkNews bookMarkNews;

  NewsBloc({
    required this.fetchNews,
    required this.searchNews,
    required this.cacheNews,
    required this.bookMarkNews,
  }) : super(const Loading()) {
    on<FetchNewsEvent>((event, emit) async {
      emit(const Loading());
      final response = await fetchNews(event.params);
      response.fold(
        (_failure) => emit(Error(message: _failure.message)),
        (_newsList) => emit(
          NewsLoaded(
            category: state is NewsLoaded
                ? (state as NewsLoaded).category
                : Categories.general,
            news: _newsList,
          ),
        ),
      );
    });
    on<SearchNewsEvent>((event, emit) {
      // TODO: implement search news event handler
    });
  }
}

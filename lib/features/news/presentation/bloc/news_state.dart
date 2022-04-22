part of 'news_bloc.dart';

abstract class NewsState extends Equatable {
  const NewsState();

  @override
  List<Object> get props => [];
}

class Loading extends NewsState {
  const Loading();
}

class NewsLoaded extends NewsState {
  final Categories category;
  final List<News> news;
  const NewsLoaded({
    required this.category,
    required this.news,
  });

  @override
  List<Object> get props => super.props..addAll([category, news]);
}

class BookMarkedNewsLoaded extends NewsState {
  final List<News> bookMarkedNews;
  const BookMarkedNewsLoaded({
    required this.bookMarkedNews,
  });

  @override
  List<Object> get props => super.props..addAll([bookMarkedNews]);
}

class Error extends NewsState {
  final String message;
  const Error({
    required this.message,
  });
  @override
  List<Object> get props => super.props..addAll([message]);
}

part of 'news_bloc.dart';

abstract class NewsEvent extends Equatable {
  const NewsEvent();

  @override
  List<Object> get props => [];
}

class FetchNewsEvent extends NewsEvent {
  final FetchNewsParams params;
  const FetchNewsEvent({
    required this.params,
  });

  @override
  List<Object> get props => super.props..addAll([params]);
}

class SearchNewsEvent extends NewsEvent {
  final SearchNewsParams params;
  const SearchNewsEvent({
    required this.params,
  });

  @override
  List<Object> get props => super.props..addAll([params]);
}

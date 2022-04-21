import 'package:dartz/dartz.dart';
import 'package:newsapp/core/errors/failures.dart';
import 'package:newsapp/core/usecases/usecase.dart';
import 'package:newsapp/core/usecases/usecase_params.dart';
import 'package:newsapp/features/news/domain/entities/news.dart';
import 'package:newsapp/features/news/domain/repositories/news_repository.dart';

class FetchNews implements UseCase<List<News>, FetchNewsParams> {
  final NewsRepository repository;
  FetchNews({
    required this.repository,
  });
  @override
  Future<Either<Failure, List<News>>> call(params) {
    return repository.fetchNews(params);
  }
}

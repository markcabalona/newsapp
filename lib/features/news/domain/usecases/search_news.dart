import 'package:dartz/dartz.dart';

import 'package:newsapp/core/errors/failures/failure.dart';
import 'package:newsapp/core/usecases/usecase.dart';
import 'package:newsapp/core/usecases/usecase_params.dart';
import 'package:newsapp/features/news/domain/entities/news.dart';
import 'package:newsapp/features/news/domain/repositories/news_repository.dart';

class SearchNews implements UseCase<List<News>, SearchNewsParams> {
  final NewsRepository repository;
  SearchNews({
    required this.repository,
  });

  @override
  Future<Either<Failure, List<News>>> call(params) {
    return repository.searchNews(params);
  }
}



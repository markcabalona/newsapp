import 'package:dartz/dartz.dart';
import 'package:newsapp/core/errors/failures.dart';

abstract class UseCase<ReturnType, Params> {
  Future<Either<Failure, ReturnType>> call(Params params);
}

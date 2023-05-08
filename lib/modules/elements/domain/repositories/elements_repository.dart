import 'package:app_challenge/core/error/failure_error_handler.dart';
import 'package:app_challenge/modules/elements/domain/dtos/elements_dto.dart';
import 'package:app_challenge/modules/elements/domain/dtos/results_dto.dart';
import 'package:fpdart/fpdart.dart';

abstract class ElementsRepository {
  Future<Either<Failure, ResultsDto>> loadElementSelected(int idElement);

  Future<Either<Failure, ElementsDto>> loadElements();
}

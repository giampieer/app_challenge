import 'package:app_challenge/core/error/failure_error_handler.dart';
import 'package:app_challenge/core/network/api_network.dart';
import 'package:app_challenge/modules/elements/data/model/elements_model.dart';
import 'package:app_challenge/modules/elements/data/model/results_model.dart';
import 'package:fpdart/fpdart.dart';

abstract class ContentRemoteDataSource {
  Future<Either<Failure, ElementsModel>> loadListElementsRemote();

  Future<Either<Failure, ResultsModel>> loadElementSelectedRemote(
      int idElement);
}

class ContentRemoteDataSourceImpl implements ContentRemoteDataSource {
  @override
  Future<Either<Failure, ElementsModel>> loadListElementsRemote() async {
    final response =
        await ApiNetwork.instance.getApi(urlParams: '/api/character');
    return response.fold((l) {
      return Left(Failure('Error: loadListElementsRemote', 1));
    }, (r) {
      return Right(ElementsModel.fromJson(r.data));
    });
  }

  @override
  Future<Either<Failure, ResultsModel>> loadElementSelectedRemote(
      int idElement) async {
    final response = await ApiNetwork.instance
        .getApi(urlParams: '/api/character/$idElement');
    return response.fold((l) {
      return Left(Failure('Error: loadElementSelectedRemote', 1));
    }, (r) {
      return Right(ResultsModel.fromJson(r.data));
    });
  }
}

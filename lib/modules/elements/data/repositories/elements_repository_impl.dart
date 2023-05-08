import 'package:app_challenge/core/error/failure_error_handler.dart';
import 'package:app_challenge/modules/elements/data/datasources/content_remote_datasources.dart';
import 'package:app_challenge/modules/elements/domain/dtos/elements_dto.dart';
import 'package:app_challenge/modules/elements/domain/dtos/info_dto.dart';
import 'package:app_challenge/modules/elements/domain/dtos/origin_dto.dart';
import 'package:app_challenge/modules/elements/domain/dtos/results_dto.dart';
import 'package:app_challenge/modules/elements/domain/repositories/elements_repository.dart';
import 'package:fpdart/src/either.dart';

class ElementsRepositoryImpl implements ElementsRepository {
  final ContentRemoteDataSource contentRemoteDataSource;

  ElementsRepositoryImpl({required this.contentRemoteDataSource});

  @override
  Future<Either<Failure, ResultsDto>> loadElementSelected(int idElement) async {
    try {
      final response =
          await contentRemoteDataSource.loadElementSelectedRemote(idElement);
      return response.fold((l) {
        return Left(Failure('Error: loadElementSelected', 1));
      }, (r) async {
        return Right(ResultsDto(
            id: r.id,
            name: r.name,
            status: r.status,
            species: r.species,
            type: r.type,
            gender: r.gender,
            origin: OriginDto(name: r.origin?.name, url: r.origin?.url),
            location: OriginDto(name: r.origin?.name, url: r.origin?.url),
            image: r.image,
            episode: r.episode ?? [],
            url: r.url,
            created: r.created));
      });
    } catch (e) {
      return Left(Failure('Error: loadElementSelected', 1));
    }
  }

  @override
  Future<Either<Failure, ElementsDto>> loadElements() async {
    try {
      final response = await contentRemoteDataSource.loadListElementsRemote();
      return response.fold((l) {
        return Left(Failure('Error: loadElements', 1));
      }, (r) async {
        return Right(ElementsDto(
            info: InfoDto(
                count: r.info?.count, pages: r.info?.pages, next: r.info?.next),
            results: r.results
                ?.map((e) => ResultsDto(
                    id: e.id,
                    name: e.name,
                    status: e.status,
                    species: e.species,
                    type: e.type,
                    gender: e.gender,
                    origin: OriginDto(name: e.origin?.name, url: e.origin?.url),
                    location:
                        OriginDto(name: e.origin?.name, url: e.origin?.url),
                    image: e.image,
                    episode: e.episode ?? [],
                    url: e.url,
                    created: e.created))
                .toList()));
      });
    } catch (e) {
      return Left(Failure('Error: loadElements', 1));
    }
  }
}

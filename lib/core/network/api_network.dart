import 'package:app_challenge/core/error/failure_error_handler.dart';
import 'package:app_challenge/core/utils/console_output_custom.dart';
import 'package:app_challenge/core/utils/constants.dart';
import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:logger/logger.dart';

class ApiNetwork {
  ApiNetwork._();

  static ApiNetwork instance = ApiNetwork._();
  static Dio? dioInstance;

  final loggerData = Logger(output: ConsoleOutputCustom());

  Future initConnectionDio() async {
    dioInstance = Dio();
  }

  Future<Either<Failure, Response>> getApi({required String urlParams}) async {
    try {
      final response =
          await dioInstance!.get('${Constants.urlBase}/$urlParams');
      loggerData.i(
          'URL_GET: ${Constants.urlBase}/$urlParams \nHEADERS: ${null} \nRESPONSE: $response');
      return Right(response);
    } on DioError catch (e) {
      loggerData.e(
          'URL_GET_ERROR: ${Constants.urlBase}/$urlParams \nHEADERS: ${null} \nRESPONSE: ${e.response}');
      return Left(Failure('Error: getApi', e.response?.statusCode ?? 0));
    }
  }
}

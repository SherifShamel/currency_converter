import 'package:currency_converter/core/failure/failure.dart';
import 'package:currency_converter/core/failure/failures.dart';
import 'package:currency_converter/data/converting_data_source/converting_data_source.dart';
import 'package:currency_converter/domain/repository/converting_repository/converting_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class ConvertingRepositoryImp implements ConvertingRepository {
  final ConvertingDataSource _convertingDataSource;

  ConvertingRepositoryImp(this._convertingDataSource);

  @override
  Future<Either<Failure, bool>> convert(
      String from, String to, String amount) async {
    try {
      final response = await _convertingDataSource.convert(from, to, amount);

      if (response.statusCode == 200) {
        return Right(true);
      } else {
        return Left(
          ServerFailure(
            statusCode: response.statusCode.toString(),
            message: response.data['error']['info'],
          ),
        );
      }
    } on DioException catch (e) {
      return Left(
        ServerFailure(
          statusCode: e.response?.statusCode.toString() ?? 'Unexpected Error',
          message: e.error.toString(),
        ),
      );
    }
  }
}

import 'package:currency_converter/domain/repository/converting_repository/converting_repository.dart';
import 'package:dartz/dartz.dart';

import '../../core/failure/failure.dart';

class ConvertingUseCase {
  final ConvertingRepository _convertingRepository;

  ConvertingUseCase(this._convertingRepository);

  Future<Either<Failure,num>> execute(String from, to, amount) async {
    return await _convertingRepository.convert(from, to, amount);
  }
}

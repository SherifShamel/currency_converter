import 'package:dartz/dartz.dart';

import '../../../core/failure/failure.dart';

abstract class ConvertingRepository {
  Future<Either<Failure, bool>> convert(String from, String to, String amount);
}

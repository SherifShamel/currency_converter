import 'package:dartz/dartz.dart';

import '../../../core/failure/failure.dart';

abstract class ConvertingRepository {
  Future<Either<Failure, num>> convert(String from, String to, String amount);
}

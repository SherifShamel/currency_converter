import 'package:dio/dio.dart';

abstract class ConvertingDataSource {
  Future<Response> convert(String from, String to,String amount);
}

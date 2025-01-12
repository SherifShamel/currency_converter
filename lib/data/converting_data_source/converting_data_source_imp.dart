import 'package:currency_converter/data/converting_data_source/converting_data_source.dart';
import 'package:dio/dio.dart';

class ConvertingDataSourceImp extends ConvertingDataSource {
  final Dio _dio;

  ConvertingDataSourceImp(this._dio);

  @override
  Future<Response> convert(String from, String to, String amount) async {
    return await _dio.get(
      options: Options(headers: {
        'X-RapidAPI-Key': '086dda1a6amsh77c2f8ae9835524p1737e9jsne77a35f11c28'
      }),
      '/convert',
      queryParameters: {
        'from': from,
        'to': to,
        'amount': amount,
      },
    );
  }
}

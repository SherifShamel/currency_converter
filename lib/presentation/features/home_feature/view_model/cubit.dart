import 'package:currency_converter/core/failure/failures.dart';
import 'package:currency_converter/data/converting_data_source/converting_data_source.dart';
import 'package:currency_converter/data/converting_data_source/converting_data_source_imp.dart';
import 'package:currency_converter/data/repository_imp/converting_repository_imp.dart';
import 'package:currency_converter/data/web_services/web_services.dart';
import 'package:currency_converter/domain/converting_use_case/converting_use_case.dart';
import 'package:currency_converter/domain/repository/converting_repository/converting_repository.dart';
import 'package:currency_converter/presentation/features/home_feature/view_model/states.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class ConvertingCubit extends Cubit<ConvertingStates> {
  final WebServices _services = WebServices();

  ConvertingCubit() : super(ConvertingInitialState());

  static ConvertingCubit get(context) => BlocProvider.of(context);

  TextEditingController fromController = TextEditingController();
  TextEditingController toController = TextEditingController();
  TextEditingController amountController = TextEditingController();

  late ConvertingDataSource _convertingDataSource;
  late ConvertingRepository _convertingRepository;
  late ConvertingUseCase _convertingUseCase;

  Future<bool> convert() async {
    _convertingDataSource = ConvertingDataSourceImp(_services.freeDio);
    _convertingRepository = ConvertingRepositoryImp(_convertingDataSource);
    _convertingUseCase = ConvertingUseCase(_convertingRepository);

    final result = await _convertingUseCase.execute(
        fromController.text, toController.text, amountController.text);

    return result.fold(
      (fail) {
        var error = fail as ServerFailure;

        emit(
          ConvertingErrorState(error.toString()),
        );
        return Future.value(false);
      },
      (data) {
        emit(ConvertingSuccessState());
        return Future.value(true);
      },
    );
  }
}

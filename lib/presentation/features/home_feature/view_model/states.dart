abstract class ConvertingStates{}

class ConvertingInitialState extends ConvertingStates{}
class ConvertingSuccessState extends ConvertingStates{
// final String currency;
// ConvertingSuccessState({required this.currency});
}
class ConvertingErrorState extends ConvertingStates{
  final String errorMsg;
  ConvertingErrorState(this.errorMsg);
}
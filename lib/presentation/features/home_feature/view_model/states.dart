abstract class ConvertingStates{}

class ConvertingInitialState extends ConvertingStates{}
class ConvertingSuccessState extends ConvertingStates{
final String? currency;
ConvertingSuccessState({ this.currency = '0.00'});
}
class ConvertingErrorState extends ConvertingStates{
  final String errorMsg;
  ConvertingErrorState(this.errorMsg);
}
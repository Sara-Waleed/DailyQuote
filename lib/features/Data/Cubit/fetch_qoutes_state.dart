part of 'fetch_qoutes_cubit.dart';

@immutable
abstract class FetchQuotesState {}

class FetchQuotesInitial extends FetchQuotesState {}
class FetchQuotesLoading extends FetchQuotesState {}
class FetchQuotesSuccess extends FetchQuotesState {

  final List<Quote> quotes;
  FetchQuotesSuccess(this.quotes);

}
class FetchQuotesFailure extends FetchQuotesState {
  final String message;
  FetchQuotesFailure(this.message);
}

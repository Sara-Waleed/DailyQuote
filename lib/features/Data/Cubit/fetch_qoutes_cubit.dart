import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import '../../../core/Services/Api_Request.dart';
import '../models/Qoute_Model.dart';
part 'fetch_qoutes_state.dart';


class FetchQuotesCubit extends Cubit<FetchQuotesState> {
  FetchQuotesCubit() : super(FetchQuotesInitial());

 void getQuotes() async {
    emit(FetchQuotesLoading());
    print("cubit loading");
    try {
      final List<Quote> quotes = await fetchAllQuotes();
      emit(FetchQuotesSuccess(quotes));
      print("$quotes");
    } catch (e) {
      emit(FetchQuotesFailure(e.toString()));
    }
  }

}

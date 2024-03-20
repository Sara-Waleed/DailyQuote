import 'package:dailyqoute/features/Presentatrion/View/Shared_Widgets/Qoute_Item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/Services/Api_Request.dart';
import '../../../Data/Cubit/fetch_qoutes_cubit.dart';
import '../../../Data/models/Qoute_Model.dart';
import 'FavoritePage.dart';


class QuoteListScreen extends StatefulWidget {
  @override
  _QuoteListScreenState createState() => _QuoteListScreenState();
}

class _QuoteListScreenState extends State<QuoteListScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<FetchQuotesCubit, FetchQuotesState>(
        builder: (context, state) {
          if (state is FetchQuotesLoading) {
            return Center(child: CircularProgressIndicator());
          }
          else if (state is FetchQuotesFailure) {
            return Center(child: Text(state.message));
          }
          else if( state is FetchQuotesSuccess){
            return PageView.builder(
              itemCount:state.quotes.length,
              itemBuilder: (context, index) => QouteItem(
                Author: state.quotes[index].author,
                Content: state.quotes[index].content,

              ),

            );
          }
          else{
            return Center(child: Container(child: Text("Continu...."),));
          }
        }
),
    );
  }


}




// import 'package:dailyqoute/core/Services/Api_Request.dart';
// import 'package:dailyqoute/features/Presentatrion/View/Shared_Widgets/Qoute_Item.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../../../Data/Cubit/fetch_qoutes_cubit.dart';
// import '../../../Data/models/Qoute_Model.dart';
//
//
//
// class QuoteListScreen extends StatefulWidget {
//   @override
//   _QuoteListScreenState createState() => _QuoteListScreenState();
// }
//
// class _QuoteListScreenState extends State<QuoteListScreen> {
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body:  FutureBuilder<List<Quote>>(
//         future: fetchAllQuotes(), // Use the future function to fetch quotes
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text(snapshot.error.toString()));
//           } else if (snapshot.hasData) {
//             // Use the fetched quotes to build the UI
//             return PageView.builder(
//               scrollDirection: Axis.vertical,
//               itemCount: snapshot.data!.length,
//               itemBuilder: (context, index) => QouteItem(
//                 Author: snapshot.data![index].author,
//                 Content: snapshot.data![index].content,
//               ),
//             );
//           } else {
//             return Center(child: Text("Continue..."));
//           }
//         },
//       ),
//     );
//   }
//
//
// }
//
//
//
// // BlocBuilder<FetchQuotesCubit, FetchQuotesState>(
// // builder: (context, state) {
// // if (state is FetchQuotesFailure) {
// // return Center(child: Text(state.message));
// // }
// // else if (state is FetchQuotesSuccess) {
// // return PageView.builder(
// // itemCount:state.quotes.length,
// // itemBuilder: (context, index) => QouteItem(
// // Author: state.quotes[index].author,
// // Content: state.quotes[index].content,
// //
// // ),
// //
// // );
// // }
// // else {
// // return Center(child: CircularProgressIndicator());
// //
// // }
// //
// // }
// // ),
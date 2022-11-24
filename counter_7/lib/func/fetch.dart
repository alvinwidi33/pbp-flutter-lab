import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:counter_7/model/watchlist.dart';

List<MyWatchList> futureWatchList = [];

Future<List<MyWatchList>> fetchMyWatchList() async {
  var url =
  Uri.parse('https://tugas2-pbp-apin.herokuapp.com/mywatchlist/json/');
  var response = await http.get(
    url,
  );

  // melakukan decode response menjadi bentuk json
  var data = jsonDecode(utf8.decode(response.bodyBytes));
  List<MyWatchList> listMyWatchList = [];
  for (var d in data) {
    if (d != null) {
      listMyWatchList.add(MyWatchList.fromJson(d));
      futureWatchList.add(MyWatchList.fromJson(d));
    }
  }
  return listMyWatchList;
}
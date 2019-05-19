import 'dart:async';
import 'package:http/http.dart' show Client;
import 'dart:convert';
import '../models/item_model.dart';

class MovieApiProvider {
  Client _client = Client();
  final _apiKey = '802b2c4b88ea1183e50e6b285a27696e';

  Future<ItemModel> fetchMovieList(int page) async {
    var url = "http://api.themoviedb.org/3/movie/popular?api_key=$_apiKey&page=$page";
    print(url);
    final response = await _client
        .get(url);
    print(response.body.toString());
    if(response.statusCode == 200) {
      return ItemModel.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to load post");
    }
  }
}
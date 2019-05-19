import 'dart:async';
import 'movies_api_provider.dart';
import '../models/item_model.dart';

class Repository {
  final moviesProvider = MovieApiProvider();

  Future<ItemModel> fetchAllMovies(int page) =>
      moviesProvider.fetchMovieList(page);
}

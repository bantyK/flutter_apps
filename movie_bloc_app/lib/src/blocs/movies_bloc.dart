import '../resources/repository.dart';
import 'package:rxdart/rxdart.dart';
import '../models/item_model.dart';

class MoviesBloc {
  final _repository = Repository();
  final _movieFetcher = PublishSubject<ItemModel>();

  Observable<ItemModel> get allMovies => _movieFetcher.stream;

  fetchAllMovies(int page) async {
    ItemModel itemModel = await _repository.fetchAllMovies(page);
    _movieFetcher.sink.add(itemModel);
  }

  dispose() {
    _movieFetcher.close();
  }
}

final bloc = MoviesBloc();
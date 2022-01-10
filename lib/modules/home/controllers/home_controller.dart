import 'package:movieapi/modules/home/presenter/models/movie.dart';
import 'package:movieapi/modules/home/repository/movie_repository.dart';

class HomeController {
  final MovieRepository repository;

  HomeController(this.repository);

  Future<List<Movie>> getMoviesLocal() => repository.getMoviesLocal();

  Future<List<Movie>> getMoviesRest() async => await repository.getMoviesRest();
}

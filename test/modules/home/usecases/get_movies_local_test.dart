import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movieapi/modules/home/controllers/home_controller.dart';
import 'package:movieapi/modules/home/presenter/models/movie.dart';
import 'package:movieapi/modules/home/repository/movie_repository.dart';

class MovieRepositoryMock extends Mock implements MovieRepository {}

void main() {
  final repository = MovieRepositoryMock();
  test('Should return a Movies list from local JSON', () async {
    final controller = HomeController(repository);
    when(() => repository.getMoviesLocal()).thenAnswer((_) async => <Movie>[]);

    final result = await controller.getMoviesLocal();

    expect(result, isA<List<Movie>>());
  });

  test('Should return a Movies list from Rest API', () async {
    final controller = HomeController(repository);
    when(() => repository.getMoviesRest()).thenAnswer((_) async => <Movie>[]);

    final result = await controller.getMoviesRest();

    expect(result, isA<List<Movie>>());
  });
}

import 'package:dio/dio.dart';
import 'package:movieapi/modules/home/presenter/models/movie.dart';
import 'dart:async';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

abstract class MovieRepository {
  Future<List<Movie>> getMoviesRest();
  Future<List<Movie>> getMoviesLocal();
}

class MovieRepositoryImpl implements MovieRepository {
  final Dio client;

  MovieRepositoryImpl(this.client);

  @override
  Future<List<Movie>> getMoviesRest() async {
    const path =
        "https://my-json-server.typicode.com/ericqueirozc/fteamtraineeapi/movies";

    final response = await client.get(path);
    List<Movie> movies = [];

    if (response.statusCode == 200) {
      for (var movie in response.data) {
        final jsonMovie = Movie.fromJson(movie);
        movies.add(jsonMovie);
      }
    }
    try {
      return movies;
    } on DioError catch (e) {
      throw e.message;
    }
  }

  Future<String> _loadMovieLocalJson() async {
    const path = 'lib/local/movies.json';
    return await rootBundle.loadString(path);
  }

  @override
  Future<List<Movie>> getMoviesLocal() async {
    final file = await _loadMovieLocalJson();
    final response = json.decode(file);

    List<Movie> movies = [];

    for (var movie in response) {
      final jsonMovie = Movie.fromJson(movie);
      movies.add(jsonMovie);
    }

    return movies;
  }
}

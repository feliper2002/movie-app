import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:movieapi/modules/home/controllers/home_controller.dart';
import 'package:movieapi/modules/home/presenter/rest.page.dart';
import 'package:movieapi/modules/home/repository/movie_repository.dart';

import 'presenter/home.page.dart';

class HomeModule extends Module {
  @override
  List<Bind> get binds => [
        Bind((i) => Dio()),
        Bind((i) => MovieRepositoryImpl(i.get())),
        Bind((i) => HomeController(i.get())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const HomePage()),
        ChildRoute('/rest', child: (context, args) => const RestPage()),
      ];
}

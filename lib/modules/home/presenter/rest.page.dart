import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:movieapi/modules/home/controllers/home_controller.dart';
import 'package:movieapi/modules/home/presenter/home.page.dart';

class RestPage extends StatefulWidget {
  const RestPage({Key? key}) : super(key: key);

  @override
  State<RestPage> createState() => _RestPageState();
}

class _RestPageState extends State<RestPage> {
  final controller = Modular.get<HomeController>();

  @override
  Widget build(BuildContext context) {
    return HomePage(
      function: controller.getMoviesRest(),
      title: 'Rest API',
      icon: null,
    );
  }
}

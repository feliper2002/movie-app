import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:movieapi/modules/home/controllers/home_controller.dart';
import 'package:movieapi/modules/home/presenter/models/movie.dart';

class HomePage extends StatefulWidget {
  final Future<List<Movie>>? function;
  final String title;
  final Widget? icon;
  const HomePage({
    Key? key,
    this.function,
    this.title = "Local JSON",
    this.icon = const Icon(
      Icons.network_wifi,
    ),
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = Modular.get<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movies - ${widget.title}'),
        actions: [
          IconButton(
            icon: widget.icon ?? Container(),
            onPressed: () async {
              Modular.to.pushNamed('/rest');
            },
          ),
        ],
      ),
      body: Column(
        children: [
          FutureBuilder<List<Movie>>(
            future: widget.function ?? controller.getMoviesLocal(),
            builder: (_, AsyncSnapshot<List<Movie>> snapshot) {
              if (snapshot.hasData) {
                return SizedBox(
                  height: 400,
                  child: ListView.separated(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (_, index) {
                      final movie = snapshot.data![index];
                      return Column(
                        children: [
                          Text(movie.name!),
                          Text("${movie.age}"),
                        ],
                      );
                    },
                    separatorBuilder: (_, index) {
                      return Container(
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        height: 1,
                        color: Colors.black,
                        width: 200,
                      );
                    },
                  ),
                );
              } else if (snapshot.hasError) {
                const Text('Tem erro nessa porra');
              }
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.black,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

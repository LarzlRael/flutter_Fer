import 'package:flutter/material.dart';
import 'package:peliculas/src/modes/pelicula_model.dart';

class MovieHorizontal extends StatelessWidget {
  final List<Pelicula> peliculas;
  final Function siguientePagina;

  MovieHorizontal({@required this.peliculas, @required this.siguientePagina});

  final _pageController = PageController(
    initialPage: 1,
    viewportFraction: 0.3,
  );

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;

    _pageController.addListener(() {
      if (_pageController.position.pixels >=
          _pageController.position.maxScrollExtent - 200) {
        siguientePagina();
      }
    });
    return Container(
      height: _screenSize.height * 0.2,
      child: PageView.builder(
        pageSnapping: false,
        controller: _pageController,
        /* children: _tarjetas(), */
        itemCount: peliculas.length,
        itemBuilder: (context, index) => _tarjeta(context, peliculas[index]),
      ),
    );
  }

  Widget _tarjeta(BuildContext context, Pelicula pelicula) {
    final tarjeta = Container(
      margin: EdgeInsets.only(right: 15.0),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: FadeInImage(
              image: NetworkImage(pelicula.getPosterImg()),
              placeholder: NetworkImage(
                pelicula.getPosterImg(),
              ),
              fit: BoxFit.cover,
              height: 160.0,
            ),
          ),
        ],
      ),
    );
    return GestureDetector(
      child: tarjeta,
      onTap: () {
        Navigator.pushNamed(context, 'detalle', arguments: pelicula);
      },
    );
  }

  List<Widget> _tarjetas() {
    return peliculas.map((pelicula) {
      return Container(
        margin: EdgeInsets.only(right: 15.0),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: FadeInImage(
                image: NetworkImage(pelicula.getPosterImg()),
                placeholder: NetworkImage(
                  pelicula.getPosterImg(),
                ),
                fit: BoxFit.cover,
                height: 160.0,
              ),
            ),
          ],
        ),
      );
    }).toList();
  }
}

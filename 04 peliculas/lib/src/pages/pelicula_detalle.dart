import 'package:flutter/material.dart';
import 'package:peliculas/src/modes/pelicula_model.dart';

class PeliculaDetalle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Pelicula pelicula = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _crearAppBar(pelicula),
          SliverList(
            delegate: SliverChildListDelegate([
              SizedBox(height: 10.0),
              _posterTitulo(pelicula, context),
              _descripction(pelicula),
            ]),
          ),
        ],
      ),
    );
  }

  Widget _crearAppBar(Pelicula pelicula) {
    return SliverAppBar(
      elevation: 2.0,
      backgroundColor: Colors.indigoAccent,
      expandedHeight: 200.0,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          pelicula.title,
          style: TextStyle(color: Colors.white, fontSize: 16.0),
        ),
        background: FadeInImage(
          image: NetworkImage(pelicula.getBackGroundImage()),
          placeholder: NetworkImage(
              'https://www.escapeauthority.com/wp-content/uploads/2116/11/No-image-found.jpg'),
          fit: BoxFit.cover,
          fadeInDuration: Duration(microseconds: 150),
        ),
      ),
    );
  }

  _posterTitulo(Pelicula pelicula, BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image(
                image: NetworkImage(pelicula.getPosterImg()),
                height: 150.0,
              ),
            ),
            SizedBox(
              width: 20.0,
            ),
            Flexible(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  pelicula.title,
                  style: Theme.of(context).textTheme.headline5,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(pelicula.originalTitle,
                    style: Theme.of(context).textTheme.subtitle2,
                    overflow: TextOverflow.ellipsis),
                Row(
                  children: [
                    Icon(Icons.star_border),
                    Text(
                      pelicula.voteAverage.toString(),
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                  ],
                )
              ],
            ))
          ],
        ));
  }

  Widget _descripction(Pelicula pelicula) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
      child: Text(
        pelicula.overview,
        textAlign: TextAlign.justify,
      ),
    );
  }
}

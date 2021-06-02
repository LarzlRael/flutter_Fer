import 'package:flutter/material.dart';
import 'package:peliculas/provider/peliculas_provide.dart';
import 'package:peliculas/src/modes/actores_model.dart';
import 'package:peliculas/src/pages/movie_horizonta.dart';

class ActorInfo extends StatelessWidget {
  final SingleActor singleActor;
  final PeliculasProvider provider = PeliculasProvider();
  ActorInfo({@required this.singleActor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Hero(
                  tag: singleActor.id,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: FadeInImage(
                      placeholder: AssetImage('assets/no-image.jpg'),
                      image: NetworkImage(singleActor.getPhoto()),
                      fit: BoxFit.cover,
                      height: 250.0,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      singleActor.name,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      singleActor.birthday,
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      singleActor.placeOfBirth,
                      style: TextStyle(fontSize: 15),
                    ),
                    Text(
                      singleActor.id.toString(),
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              singleActor.biography,
              style: TextStyle(
                fontSize: 16,
                height: 1.5,
              ),
              textAlign: TextAlign.justify,
            ),
            SizedBox(
              height: 15,
            ),
            Text('Peliculas con ${singleActor.name}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(
              height: 15,
            ),
            FutureBuilder(
              future: provider.getFilmsByActor(singleActor.id.toString()),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return MovieHorizontal(
                      peliculas: snapshot.data, siguientePagina: () {});
                } else {
                  return CircularProgressIndicator();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

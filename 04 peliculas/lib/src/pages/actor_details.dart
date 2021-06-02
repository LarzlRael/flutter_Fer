import 'package:flutter/material.dart';
import 'package:peliculas/provider/peliculas_provide.dart';
import 'package:peliculas/src/modes/actores_model.dart';
import 'package:peliculas/src/pages/widgets/actor_info.dart';

class ActorDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ScreenArguments screenArguments =
        ModalRoute.of(context).settings.arguments;
    final PeliculasProvider peliP = PeliculasProvider();
    peliP.getFilmsByActor(screenArguments.idActor);
    return Scaffold(
      appBar: AppBar(
        title: Text(screenArguments.actorName),
        backgroundColor: Colors.indigoAccent,
      ),
      body: FutureBuilder(
        future: peliP.getActorInfo(screenArguments.idActor),
        builder: (BuildContext context, AsyncSnapshot<SingleActor> snapshot) {
          if (snapshot.hasData) {
            return ActorInfo(singleActor: snapshot.data);
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

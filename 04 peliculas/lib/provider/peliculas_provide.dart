import 'dart:async';
import 'dart:convert';

/* import 'package:dio/dio.dart'; */
import 'package:peliculas/src/modes/actores_model.dart';
import 'package:peliculas/src/modes/pelicula_model.dart';
import 'package:http/http.dart' as http;

class PeliculasProvider {
  String _apiKey = '7135ebe6b690f38898f6ff3f63d33ff3';
  String _url = 'api.themoviedb.org';
  String _language = 'es-ES';

  int _popularesPage = 0;
  bool _cargando = false;

  List<Pelicula> _populares = [];

  /* Create our stream */

  final _popularesStreamController =
      StreamController<List<Pelicula>>.broadcast();

  Function(List<Pelicula>) get popularesSink =>
      _popularesStreamController.sink.add;

  Stream<List<Pelicula>> get popularesStream =>
      _popularesStreamController.stream;

  //? method to close the stream, it is IMPORTANT!
  void disposeStream() {
    _popularesStreamController?.close();
  }

  Future<List<Pelicula>> _procesarRespuesta(Uri url) async {
    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);

    final peliculas = new Peliculas.fromJsonList(decodedData['results']);

    return peliculas.items;
  }

  Future<List<Pelicula>> getEnCines() async {
    if (_cargando) return [];
    _cargando = true;
    final url = Uri.https(_url, '3/movie/now_playing', {
      'api_key': _apiKey,
      'language': _language,
    });
    _cargando = false;

    return await _procesarRespuesta(url);
  }

  Future<List<Pelicula>> getPopular() async {
    _popularesPage++;
    final url = Uri.https(_url, '3/movie/popular', {
      'api_key': _apiKey,
      'language': _language,
      'page': _popularesPage.toString()
    });

    final resp = await _procesarRespuesta(url);

    _populares.addAll(resp);
    popularesSink(_populares);

    return resp;
  }

  Future<List<Actor>> getCast(String peliId) async {
    final url = Uri.https(_url, '3/movie/$peliId/credits', {
      'api_key': _apiKey,
      'language': _language,
    });

    final resp = await http.get(url);

    final decodedData = json.decode(resp.body);
    final cast = new Cast.fromJsonList(decodedData['cast']);

    return cast.actores;
  }

  Future<List<Pelicula>> buscarPelicula(String query) async {
    final url = Uri.https(_url, '3/search/movie', {
      'api_key': _apiKey,
      'language': _language,
      'query': query,
    });

    return await _procesarRespuesta(url);
  }

//? https://api.themoviedb.org/3/person/5c9938ce9251411067f4f17b/movie_credits?api_key=7135ebe6b690f38898f6ff3f63d33ff3&language=en-US
  Future<SingleActor> getActorInfo(String idActor) async {
    final url = Uri.https(_url, '3/person/$idActor', {
      'api_key': _apiKey,
      'language': _language,
    });

    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);

    return SingleActor.fromJson(decodedData);
  }
  /* /person/{person_id}/combined_credits */

  Future<List<Pelicula>> getFilmsByActor(String personId) async {
    final url = Uri.https(_url, '3/person/$personId/combined_credits', {
      'api_key': _apiKey,
      'language': _language,
    });
    final resp = await http.get(url);

    final decodedData = json.decode(resp.body);

    final peliculas = new Peliculas.fromJsonList(decodedData['cast']);

    return peliculas.items;
  }
}

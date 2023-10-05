import 'dart:convert';

import 'package:flutter/material.dart';
//extanciando la libreria
import 'package:http/http.dart' as http;
import 'package:proyecto_unidad1/models/movie.dart';
import 'package:proyecto_unidad1/models/now_playing_response.dart';
import 'package:proyecto_unidad1/models/popular_response.dart';

//
class MoviesProvider extends ChangeNotifier {
  String _baseUrl = 'api.themoviedb.org';
  String _apiKey = '9dc27117b000e7e5acfb365fa957971a';
  String _languague = 'es-MX';

  List<Movie> onDisplayMovies = [];
  List<Movie> popularMovies = [];
  //contructor
  MoviesProvider() {
    getOnDisplayMovies();
    getPopularMovies();
  }
  //hacer metodo ansincrono
  getOnDisplayMovies() async {
    var url = Uri.https(
        _baseUrl,
        '3/movie/now_playing',
        //Las llaves establecen los parametros que necesitamos
        {'api_key': _apiKey, 'language': _languague, 'page': '1'});
    //mandar llavar la peticion con el verbo get
    final response = await http.get(url);
    //informacion del json
    //decode data recibe la informacion
    final Map<String, dynamic> decodeData = json.decode(response.body);

    final nowPlayingResponse = NowPlayingResponse.fromRawJson(response.body);
    onDisplayMovies = nowPlayingResponse.results;

    //avisarle a los widget que hubo modificacion, se cambio la data por lo tanto se tiene que redibujar.
    //very importante
    notifyListeners();
    print(nowPlayingResponse.results[0].title);
    //print(decodeData);
    //print(response.body);
  }

  getPopularMovies() async {
    var url = Uri.https(_baseUrl, '3/movie/popular',
        {'api_key': _apiKey, 'languaje': _languague, 'page': '1'});
    final response = await http.get(url);
    final popularResponse = PopularResponse.fromRawJson(response.body);
    //destructurar resultado para cambiar pagina y mantener los actuales
    popularMovies = [...popularMovies, ...popularResponse.results];
    notifyListeners();
  }
}

import 'dart:convert';

import 'package:flutter/material.dart';
//extanciando la libreria
import 'package:http/http.dart' as http;

//
class MoviesProvider extends ChangeNotifier {
  String _baseUrl = 'api.themoviedb.org';
  String _apiKey = '9dc27117b000e7e5acfb365fa957971a';
  String _languague = 'es-MX';

  //contructor
  MoviesProvider() {
    getOnDisplayMovies();
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
    print(decodeData);
    print(response.body);
  }
}

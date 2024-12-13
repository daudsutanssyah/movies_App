import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movies_app/config/config.dart';
import 'package:movies_app/models/movie_model.dart';

class MovieServices {
  static Future<List<MovieModel>> getMovielist() async {
    final List<MovieModel> listMovie = []; // Menggunakan final

    try {
      final response = await http.get(Uri.parse(Config.urlAPI)); // Menggunakan final
      if (response.statusCode == 200) {
        final responseBody = json.decode(response.body); // Menggunakan final
        final List listAllMoviesResponse = responseBody['results']; // Menggunakan final

        // Menggunakan map untuk membuat list movie
        listMovie.addAll(listAllMoviesResponse.map((data) => MovieModel.fromJson(data)).toList());
      } else {
        print('Failed to load movies: ${response.statusCode}');
      }
    } catch (e) {
      print('Error occurred while fetching movies: $e');
    }

    return listMovie;
  }
}

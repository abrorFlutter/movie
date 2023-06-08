import 'package:movie/core/base_service.dart';
import 'package:movie/model/movie.dart';
import '../genres.dart';
import '../services/genres_service.dart';

class GenresRepository{

  final BaseService _popularService = GenresService();

  Future<List<Genre>> fetchGenres() async{
    dynamic response = await _popularService.getResponse("");

    final jsonData = response['genres'] as List;

    List<Genre> genres = jsonData.map((e) => Genre.fromJson(e)).toList();
    return genres;
  }
}
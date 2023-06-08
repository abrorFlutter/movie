import 'package:movie/core/base_service.dart';
import 'package:movie/model/movie.dart';
import 'package:movie/model/services/popular_service.dart';

class PopularRepository{

  final BaseService _popularService = PopularService();

  Future<List<Movie>> fetchPopular() async{
    dynamic response = await _popularService.getResponse("/popular");

    final jsonData = response['results'] as List;

  //  final data = response as List;

    List<Movie> movie = jsonData.map((e) => Movie.fromJson(e)).toList();
    return movie;
  }
}
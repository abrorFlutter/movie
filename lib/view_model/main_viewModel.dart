import 'package:flutter/cupertino.dart';
import 'package:movie/core/app_response.dart';
import 'package:movie/model/repositories/now_playing_repository.dart';
import 'package:movie/model/repositories/popular_repository.dart';
import 'package:movie/model/repositories/upComing%20repository.dart';
import '../model/genres.dart';
import '../model/movie.dart';
import '../model/repositories/genres_repository.dart';

class MainViewModel extends ChangeNotifier{

  ApiResponse _apiResponse = ApiResponse.initial("empty");

  List<Movie> _movies = [];
  List<Genre> _genres = [];

  List<Movie> get movies {
    return _movies;
  }

  List<Genre> get genres {
    return _genres;
  }

  ApiResponse get response {
    return _apiResponse;
  }


  Future fetchPopular(int index) async{
    try{
        switch (index) {
          case 0:
            List<Movie> movies = await PopularRepository().fetchPopular();
            _movies = movies;
            break;
          case 1:
            List<Movie> movies = await NowPlayingRepository().fetchNowPlaying();
            _movies = movies;
            break;
          case 2:
            List<Movie> movies = await UpComingRepository().fetchUpComing();
            _movies = movies;
            break;
        }

        _apiResponse = ApiResponse.completed(movies);
   }catch(e) {
     print(e);
     _apiResponse = ApiResponse.error("error");
   }
    notifyListeners();
  }

  Future fetchGenres() async{
    try{
      List<Genre> genres = await GenresRepository().fetchGenres();
      _genres = genres;
    }catch(e) {

    }
  }



}
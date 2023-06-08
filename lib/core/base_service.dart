abstract class BaseService{
  final String apiKey = "?api_key=ab36c0201881a864c3340f3ed542629e";
  final String baseUrl = "https://api.themoviedb.org/3/movie";
  final String genreUrl = "https://api.themoviedb.org/3/genre/movie/list";

  Future<dynamic> getResponse(String url);

}
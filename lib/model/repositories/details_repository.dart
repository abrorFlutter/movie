import 'package:movie/core/base_service.dart';
import 'package:movie/model/details.dart';
import '../services/details_service.dart';

class DetailsRepository{

  final BaseService _genresService = DetailsService();

  Future<Details> fetchDetails(int movieID) async{
    dynamic response = await _genresService.getResponse("/$movieID");

    final jsonData = Details.fromJson(response);

    return jsonData;
  }
}
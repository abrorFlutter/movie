import 'package:flutter/material.dart';
import 'package:movie/model/repositories/details_repository.dart';
import '../core/app_response.dart';
import '../model/details.dart';

class DetailsViewModel extends ChangeNotifier{

  ApiResponse _apiResponse = ApiResponse.initial("empty");
  Details? _details;

  ApiResponse get response {
    return _apiResponse;
  }

  Details? get details {
    return _details;
  }

  Future fetchDetailsId(int movieId) async{
    try{
      Details details = await DetailsRepository().fetchDetails(movieId);
      _details = details;

      _apiResponse = ApiResponse.completed(details);
   }catch(e) {
     print(e);
      _apiResponse = ApiResponse.error(e.toString());
   }
    notifyListeners();
  }

  void clearDetail() {

    ApiResponse _apiResponse = ApiResponse.initial("initial");
    _details = null;
  }

}
import 'dart:convert';
import 'dart:io';

import 'package:movie/core/app_exception.dart';
import 'package:movie/core/base_service.dart';
import 'package:http/http.dart' as http;


class DetailsService extends BaseService{
  dynamic responseJson;

  @override
  Future getResponse(String url) async{

    try{
      final String response = baseUrl + url + apiKey;
      final request = await http.get(Uri.parse(response));
      print("ggsgs --- $response");
      responseJson = returnResponse(request);
    }on SocketException{
      throw Exception("connection error");
    }
    return responseJson;

  }

  dynamic returnResponse(http.Response response) {
    switch(response.statusCode){
      case == 200:
    dynamic responseJson = jsonDecode(response.body);
    return responseJson;
    case == 400:
    throw BadRequestException(response.statusCode.toString());
    case == 401:
    throw UnauthorizedException(response.statusCode.toString());
    case == 404:
    throw NotFoundException(response.statusCode.toString());
    default:
    throw Exception(response.statusCode.toString());
  }
  }

}
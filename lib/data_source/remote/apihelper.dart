import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart ' as httpClient;
import 'package:news_app/data_source/remote/app_exeptions.dart';

class ApiHelper {
  Future<dynamic> getApi({required String url}) async {
    var uri = Uri.parse(url);
    try {
      var response = await httpClient.get(uri);
      return returnDataResponse(response);
    } on SocketException {
      throw FetchDataException(body: 'Internet Error');
    }
  }

  dynamic returnDataResponse(httpClient.Response response) {
    switch (response.statusCode) {
      case 200:
        return jsonDecode(response.body);
      case 400:
        throw BadRequestException(body: response.body);
      case 401:
      case 403:
        throw UnauthorizedException(body: response.body);
      case 500:
      default:
        throw FetchDataException(
            body:
                'Error Occured While Communication With Server With StatusCode : ${response.body}');
    }
  }
}

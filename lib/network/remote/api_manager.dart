import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:newsapi/model/NewsResponse.dart';
import 'package:newsapi/model/SourcesResponse.dart';

import '../../componanets/constants.dart';
import 'end_point.dart'; //i write http to get function inside it

class ApiManager {
  static Future<SourcesResponse> getSources() async {
    Uri URL = Uri.https(
        BASE_URL, //base URL //i write http one time
        endPoint, //endpoint
        {"apiKey": ApiKey});

    Response response = await http.get(URL);
    var jsonResponse = jsonDecode(response.body);
    SourcesResponse sourcesResponse = SourcesResponse.fromJson(jsonResponse);
    return sourcesResponse;
  } //getSource function

  static Future<NewsResponse> getNewsData(String sourceId) async {
    //first we have to make authorization
    Uri URL = Uri.https(
        BASE_URL, "v2/everything", {"apiKey": ApiKey, "sources": sourceId});

    http.Response response = await http.get(URL);
    //i car wirte http.response or just Response but i have to import the package as http
    var json=jsonDecode(response.body);
    NewsResponse newsResponse=NewsResponse.fromJson(json);
    //this line caled calling api
    return newsResponse;

  } //getNewData
} //class

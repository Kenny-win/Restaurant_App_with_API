import 'package:resto_app_with_api/data/model/resto_data_lists.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:resto_app_with_api/data/model/resto_data_search.dart';
import 'package:resto_app_with_api/data/model/resto_detail_lists.dart';

class ApiService {
  static const String _showList = 'list';
  static const String _baseUrl = 'https://restaurant-api.dicoding.dev/';
  static const String _showDetail = 'detail/';
  static const String _showSearch = 'search?q=';

  Future<RestoApi> fetchAllRestoList() async {
    final response = await http.get(Uri.parse(_baseUrl + _showList));

    if (response.statusCode == 200) {
      return RestoApi.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Cannot Load Data');
    }
  }

  Future<RestoDetailApi> fetchAllRestoDetail(String id) async {
    final response = await http.get(Uri.parse(_baseUrl + _showDetail + id));
    if (response.statusCode == 200) {
      return RestoDetailApi.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Cannot Load Data');
    }
  }

  Future<SearchData> fetchSearchData(String query) async {
    final response = await http.get(Uri.parse(_baseUrl + _showSearch + query));
    if (response.statusCode == 200) {
      return SearchData.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Cannot Load Data');
    }
  }
}

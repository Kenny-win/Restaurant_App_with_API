import 'package:flutter/material.dart';
import 'package:resto_app_with_api/data/api/api_service.dart';
import 'package:resto_app_with_api/data/model/resto_data_search.dart';

enum SearchResultState { loading, noData, hasData, error }

class SearchProvider extends ChangeNotifier {
  final ApiService apiService;

  SearchProvider({required this.apiService});

  SearchData? _restoDataSearch;
  SearchResultState? _state;
  String _message = '';

  SearchData? get restoDataSearch => _restoDataSearch;
  SearchResultState? get state => _state;
  String get message => _message;


  Future<dynamic> fetchAllSearchDataResto(String query) async {
    try {
      _state = SearchResultState.loading;
      notifyListeners();
      final restoSearch = await apiService.fetchSearchData(query);
      if (restoSearch.restaurants.isEmpty) {
        _state = SearchResultState.noData;
        notifyListeners();
        return _message = 'Empty Data';
      } else {
        _state = SearchResultState.hasData;
        notifyListeners();
        return _restoDataSearch = restoSearch;
      }
    } catch (e) {
      _state = SearchResultState.error;
      notifyListeners();
      return _message = e.toString();
    }
  }
}
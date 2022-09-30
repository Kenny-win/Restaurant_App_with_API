import 'package:flutter/cupertino.dart';
import 'package:resto_app_with_api/data/api/api_service.dart';
import 'package:resto_app_with_api/data/model/resto_data_lists.dart';

enum ResultState { loading, noData, hasData, error }

class RestoListProvider extends ChangeNotifier {
  final ApiService apiService;

  RestoListProvider({required this.apiService}) {
    fetchAllDataResto();
  }

  late RestoApi _restoApi;
  late ResultState _state;
  String _message = '';

  RestoApi get restoApi => _restoApi;
  ResultState get state => _state;
  String get message => _message;

  Future<dynamic> fetchAllDataResto() async {
    try {
      _state = ResultState.loading;
      notifyListeners();
      final restoData = await apiService.fetchAllRestoList();
      if (restoData.restaurants.isEmpty) {
        _state = ResultState.noData;
        notifyListeners();
        return _message = 'Empty Data';
      } else {
        _state = ResultState.hasData;
        notifyListeners();
        return _restoApi = restoData;
      }
    } catch (e) {
      _state = ResultState.error;
      notifyListeners();
      return _message = 'Koneksi Terputus';
    } 
  }
}

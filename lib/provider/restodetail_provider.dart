import 'package:flutter/material.dart';
import 'package:resto_app_with_api/data/api/api_service.dart';
import 'package:resto_app_with_api/data/model/resto_detail_lists.dart';

enum DetailResultState { loading, noData, hasData, error }

class RestoDetailProvider extends ChangeNotifier {
  final ApiService apiService;

  RestoDetailProvider({required this.apiService});

  RestoDetailApi? _restoDetailApi;
  late DetailResultState _state;
  String _message = '';

  RestoDetailApi? get restoDetailApi => _restoDetailApi;
  DetailResultState get state => _state;
  String get message => _message;


  Future<dynamic> fetchAllDetailDataResto(String id) async {
    try {
      _state = DetailResultState.loading;
      notifyListeners();
      final restoDetail = await apiService.fetchAllRestoDetail(id);
      if (restoDetail.restaurant == {}) {
        _state = DetailResultState.noData;
        notifyListeners();
        return _message = 'Empty Data';
      } else {
        _state = DetailResultState.hasData;
        notifyListeners();
        return _restoDetailApi = restoDetail;
      }
    } catch (e) {
      _state = DetailResultState.error;
      notifyListeners();
      return _message = 'Koneksi Terputus';
    }
  }
}

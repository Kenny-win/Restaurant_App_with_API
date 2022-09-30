import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resto_app_with_api/provider/restodetail_provider.dart';
import 'package:resto_app_with_api/provider/restolist_provider.dart';
import 'package:resto_app_with_api/widget/listview_data.dart';

class ListDataWidget extends StatefulWidget {
  const ListDataWidget({super.key});

  @override
  State<ListDataWidget> createState() => _ListDataWidgetState();
}

class _ListDataWidgetState extends State<ListDataWidget> {
  
  @override
  Widget build(BuildContext context) {
    final restaurantLists = Provider.of<RestoListProvider>(context);
    final restoDetail = Provider.of<RestoDetailProvider>(context);
    
    return Expanded(
      child: Builder(
        builder: (context) {
          if (restaurantLists.state == ResultState.error){
            return Center(
              child: Material(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.wifi_off_rounded, size: 150,),
                    Text(restaurantLists.message,
                      style: const TextStyle(
                        fontSize: 25
                      ),
                    )
                  ],
                ),
              ),
            );
          } 
          else if (restaurantLists.state == ResultState.loading){
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (restaurantLists.state == ResultState.hasData){
            var restoDataLists = restaurantLists.restoApi.restaurants;
            return ListViewCustom(
              listLength: restaurantLists.restoApi.restaurants.length, 
              listData: restoDataLists, 
              provider: restoDetail,
            );
          } else if (restaurantLists.state == ResultState.noData){
            return Center(
              child: Material(
                child: Text(restaurantLists.message),
              ),
            );
          } else{
            return const Center(
              child: Material(
                child: Text(''),
              ),
            );
          }
        },
      ),
    );
  }
}


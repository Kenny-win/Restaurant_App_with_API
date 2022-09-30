import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resto_app_with_api/data/api/api_service.dart';
import 'package:resto_app_with_api/provider/restodetail_provider.dart';
import 'package:resto_app_with_api/provider/restolist_provider.dart';
import 'package:resto_app_with_api/provider/restosearch_provider.dart';
import 'package:resto_app_with_api/ui/resto_detail.dart';
import 'package:resto_app_with_api/ui/resto_list.dart';
import 'package:resto_app_with_api/ui/search_list.dart';
import 'package:resto_app_with_api/ui/splashscreen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<RestoListProvider>(
          create: (context) => RestoListProvider(apiService: ApiService()),
        ),
        ChangeNotifierProvider<RestoDetailProvider>(
          create: (context) => RestoDetailProvider(apiService: ApiService()),
        ),
        ChangeNotifierProvider<SearchProvider>(
          create: (context) => SearchProvider(apiService: ApiService()),
        ),
      ],
      child: const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/':(context) => const SplashScreen(),
        '/restoList':(context) => const RestoList(),
        '/restoDetail':(context) => const RestoDetail(),
        '/search':(context) => const SearchResto(),
      },
    );
  }
}


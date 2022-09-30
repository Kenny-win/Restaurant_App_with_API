import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:resto_app_with_api/provider/restodetail_provider.dart';
import 'package:resto_app_with_api/provider/restosearch_provider.dart';
import 'package:resto_app_with_api/widget/list_data.dart';
import 'package:resto_app_with_api/widget/listview_data.dart';

class SearchResto extends StatefulWidget {
  const SearchResto({super.key});
  
  @override
  State<SearchResto> createState() => _SearchRestoState();
}

class _SearchRestoState extends State<SearchResto> {
  final TextEditingController _searchFieldController =
      TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    final restoSearch = Provider.of<SearchProvider>(context);
    final restoDetail = Provider.of<RestoDetailProvider>(context);
    final double flexWidth = MediaQuery.of(context).size.width;
    final double flexHeight = MediaQuery.of(context).size.height;
    String searchVal = '';

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        title: const Text(
          'Search',
          style: TextStyle(
              fontWeight: FontWeight.w500, color: Colors.black, fontSize: 28),
        ),
        bottom: PreferredSize(
          preferredSize: Size(double.infinity, flexHeight * 0.1),
          child: Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: TextField(
              controller: _searchFieldController,
              decoration: InputDecoration(
                hintText: 'Search name, menu or category of restaurant',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              onChanged: (value) {
                searchVal = value;
                restoSearch.fetchAllSearchDataResto(value);
              },
            ),
          ),
        ),
      ),
      body: Container(
        width: flexWidth,
        height: flexHeight,
        child: Builder(
          builder: (context) {
            if (restoSearch.state == SearchResultState.loading) {
              return SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.search_rounded,
                        size: 200,
                        color: Colors.black.withOpacity(0.5),
                      ),
                      SizedBox(
                        height: flexHeight * 0.01,
                      ),
                      Text(
                        'Finding Restaurants For You\nPlease Wait',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(fontSize: 24),
                      )
                    ]),
              );
            } else if (restoSearch.state == SearchResultState.hasData) {
              final restoDataSearch = restoSearch.restoDataSearch!.restaurants;
              return ListViewCustom(
                listLength: restoDataSearch.length,
                listData: restoDataSearch,
                provider: restoDetail,
              );
            } else if (restoSearch.state == SearchResultState.error) {
              if (searchVal == '') {
                return Column(
                  children: const [
                    ListDataWidget(),
                  ],
                );
              } else {
                return Text(restoSearch.message);
              }
            } else {
              if (restoSearch.state == SearchResultState.noData) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.search_off_rounded,
                      size: 200,
                      color: Colors.black.withOpacity(0.5),
                    ),
                    Text(
                      'Your Restaurant Not Found!',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(fontSize: 24),
                    )
                  ],
                );
              } else {
                return Column(
                  children: const [
                    ListDataWidget(),
                  ],
                );
              }
            }
          },
        ),
      ),
    );
  }
}

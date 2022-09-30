import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:resto_app_with_api/widget/list_data.dart';

class RestoList extends StatefulWidget {
  const RestoList({Key? key}) : super(key: key);

  @override
  State<RestoList> createState() => _RestoListState();
}

class _RestoListState extends State<RestoList> {
  
  @override
  Widget build(BuildContext context) {
    final double flexWidth = MediaQuery.of(context).size.width;
    final double flexHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        body: Container(
          width: flexWidth,
          height: flexHeight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(left: 15, top: 20),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Ken's Resto",
                          style: GoogleFonts.poppins(
                              fontSize: 30, fontWeight: FontWeight.w500),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: IconButton(
                            onPressed: (){
                              Navigator.pushNamed(context, '/search');
                            }, icon: const Icon(Icons.search_rounded,
                              size: 30,
                            ),
                          ),
                        )
                      ],
                    ),
                    Text(
                      "Recommended Restaurant For You !",
                      style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Colors.black.withOpacity(0.5)),
                    ),
                    TweenAnimationBuilder(
                      tween: Tween<double>(begin: 100, end: 0),
                      duration: const Duration(seconds: 2),
                      builder: (context, double value, child) => Divider(
                        indent: value,
                        endIndent: value + 15,
                        thickness: 2,
                        color: Colors.black.withOpacity(0.4),
                      ),
                    ),
                  ],
                ),
              ),
              const ListDataWidget()
            ],
          ),
        ),
      ),
    );
  }
}

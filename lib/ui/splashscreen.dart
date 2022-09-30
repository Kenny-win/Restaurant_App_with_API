import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() { 
    super.initState();
    Timer(const Duration(seconds: 2), ()=>
      Navigator.pushNamedAndRemoveUntil(context, '/restoList', (route) => false)
    );
  }

  @override
  Widget build(BuildContext context) {
    final double flexWidth = MediaQuery.of(context).size.width;
    final double flexHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: flexWidth,
        height: flexHeight,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            TweenAnimationBuilder(
              tween: Tween<double>(
                begin: 0,
                end: 1,
              ),
              duration: const Duration(
                seconds: 1,
              ),
              builder: (context, double value, child) => 
              Opacity(
                opacity: value,
                child: TweenAnimationBuilder(
                  tween: Tween<double>(
                    begin: 50,
                    end: 0,
                  ),
                  duration: const Duration(
                    seconds: 1,
                  ),
                  builder: (context, double value, child) => 
                  Container(
                    margin: EdgeInsets.only(bottom: value),
                    width: flexWidth-200,
                    height: flexHeight-600,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage("assets/images/logo.jpg"),
                        fit: BoxFit.cover
                      )
                    ),
                  ),
                ),
              ),
            ),
            TweenAnimationBuilder(
              tween: Tween<double>(
                begin: 0,
                end: 1,
              ),
              duration: const Duration(
                seconds: 1,
              ),
              builder: (context, double value, child) =>
              Opacity(
                opacity: value,
                child: Text(
                  "Ken's Resto",
                  style: GoogleFonts.tangerine(
                    fontSize: 60,
                    textStyle: Theme.of(context).textTheme.headline3,
                    color: Colors.black,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

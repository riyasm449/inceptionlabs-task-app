import 'package:flutter/material.dart';

import '../utils/commons.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), navigate);
  }

  Future<void> navigate() {
    Navigator.pushReplacementNamed(context, '/login');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),
          Positioned(
              bottom: 0,
              child: Image.asset(
                'assets/images/bg.PNG',
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.fitWidth,
              )),
          Positioned(
            top: 40,
            left: 30,
            child: Container(
              width: 300,
              alignment: Alignment.centerLeft,
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      'Welcome to',
                      style: TextStyle(color: Colors.white, fontSize: 48, fontWeight: FontWeight.w800),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      'Alhaji Suya',
                      style: TextStyle(color: Commons.bgColor, fontSize: 48, fontWeight: FontWeight.w800),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      'Your favorite foods delivered fast at your door.',
                      style: TextStyle(color: Commons.greyAccent2, fontSize: 18, fontWeight: FontWeight.w800),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

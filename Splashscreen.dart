import 'package:flutter/material.dart';
import 'dart:async';
import 'package:shimmer/shimmer.dart';
import 'main.dart';
import 'package:hexcolor/hexcolor.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState(){
    super.initState();

    _mockCheckForSession().then(
            (status) {
          if (status) {
            _navigateToHome();
          }
        }
    );
  }


  Future<bool> _mockCheckForSession() async {
    await Future.delayed(Duration(milliseconds: 9000), () {});

    return true;
  }

  void _navigateToHome(){
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(
            builder: (BuildContext context) => LoginPage()
        )
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Hexcolor('#c3cee0'),
      body: Container(
        child: Column(
         // alignment: Alignment.b,
          children: <Widget>[

            Shimmer.fromColors(
              period: Duration(milliseconds: 2000),
              baseColor: Color(0xff7f00ff),
              highlightColor: Color(0xffe100ff),
              child: Container(
                padding: EdgeInsets.fromLTRB(12.0, 16.0, 10.0, 16.0),


                    child: SafeArea(
                      child: Text(
                        "Patient \t\n   Tracker",

                        style: TextStyle(
                            fontSize: 50.0,
                            fontFamily: 'Pacifico',
                            shadows: <Shadow>[
                              Shadow(
                                  blurRadius: 18.0,
                                  color: Colors.black87,
                                  offset: Offset.fromDirection(120, 12)
                              )
                            ]
                        ),
                      ),
                    ),


              ),

            ),
            SizedBox(height: 95.0),
             Image.asset('assets/salinepic.jpg',height: 280.0),
          ],
        ),
      ),
    );
  }


}


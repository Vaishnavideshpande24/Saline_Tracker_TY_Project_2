import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:salinetracker/Splashscreen.dart';
import 'package:salinetracker/wards.dart';
import 'create_form.dart';

import 'package:hexcolor/hexcolor.dart';
void main() async {
  runApp(MyApp());
}



class MyApp extends StatelessWidget {

  LoginPage _loginPage;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: ThemeData(brightness: Brightness.dark),
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
Widget build(BuildContext context) {
  return FutureBuilder<FirebaseUser>(
    future: FirebaseAuth.instance.currentUser(),
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        FirebaseUser user = snapshot.data;
        return PostHomePage();
      } else {
        return LoginPage();
      }
    },
  );
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}
//    const LoginPage({
//    Key key,
//    @required this.onSubmit,
//
//  }) :super(key:key);
//  final VoidCallback onSubmit;

class _LoginPageState extends State<LoginPage> {

  static final TextEditingController _user=new TextEditingController();
  static final TextEditingController _pass=new TextEditingController();

  String get username=>_user.text;
  String get password=>_user.text;
  bool yess=false;
  bool ok=false;
//
//void onSubmit(){
//  if(username=='Sumit'&&password=='ilovechuhi'){
//    yess==true;
//  }
//
//}
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: CustomPaint(
        painter: BackgroundSignIn(),
        child: SafeArea(
          child: Stack(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35),
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 60.0),
                    _getHeader(),
                    // _getTextFields(),
                    SingleChildScrollView(
                      scrollDirection: Axis.vertical,

                      //flex: 4,
                      child: Column(

                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                              controller: _user,
                              decoration: InputDecoration(labelText: 'Name'),
                              autovalidate: true,
                              validator: (String txt){
                                if (txt=="Nurse"){
                                  Future.delayed(Duration.zero).then((_){
                                    setState((){
                                      yess= true;
                                    });
                                  });
                                } else {
                                  Future.delayed(Duration.zero).then((_){
                                    setState((){
                                      yess = false;
                                    });
                                  });
                                }
                              }
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                              controller: _pass,
                              decoration: InputDecoration(labelText: 'Password'),
                              obscureText: true,
                              autovalidate: true,
                              validator: (String txt){
                                if (txt=="hospital"){
                                  Future.delayed(Duration.zero).then((_){
                                    setState((){
                                      ok= true;
                                    });
                                  });
                                } else {
                                  Future.delayed(Duration.zero).then((_){
                                    setState((){
                                      ok= false;
                                    });
                                  });
                                }
                              }

                          ),
                          SizedBox(
                            height: 25,
                          ),
                          FloatingActionButton(
                            backgroundColor: Colors.white,

                            child: Center(
                              child: Icon(
                                Icons.local_hospital,
                                color: Colors.red,
                                size: 35.0,
                              ),
                            ),
                            onPressed: () {
                              if(yess==true &&ok==true) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => PostHomePage()),
                                );
                              }
                              //yess=!yess;

                            },
                          ),



                        ],
                      ),

                    ),
                    // _getSignIn(),
                    _getBottomRow(context),
                  ],
                ),
              ),
              //_getBackBtn(),
            ],
          ),
        ),
      ),
    );
  }
}

//_getBackBtn() {
//  return Positioned(
//    top: 35,
//    left: 25,
//    child: Icon(
//      Icons.arrow_back_ios,
//      color: Colors.white,
//    ),
//  );
//}

_getBottomRow(context) {
  return Expanded(
    flex: 1,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
//        GestureDetector(
//          onTap: (){
//            Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpPage()));
//          },
//          child: Text(
//            'Sign up',
//            style: TextStyle(
//              fontSize: 15,
//              fontWeight: FontWeight.w500,
//              decoration: TextDecoration.underline,
//            ),
//          ),
//        ),
//        Text(
//          'Forgot Password',
//          style: TextStyle(
//            fontSize: 15,
//            fontWeight: FontWeight.w500,
//            decoration: TextDecoration.underline,
//          ),
//        ),
      ],
    ),
  );
}

//_getSignIn() {
//  return Expanded(
//
//    flex: 1,
//    child: Row(
//      mainAxisAlignment: MainAxisAlignment.center,
//
//      children: <Widget>[
//
//
//           FloatingActionButton(
//            backgroundColor: Colors.white,
//
//            child: Center(
//              child: Icon(
//                Icons.favorite,
//                color: Colors.red,
//                size: 35.0,
//              ),
//            ),
//            onPressed: () {
//
//            },
//          ),
//
//
//
//
//      ],
//    ),
//  );
//}





_getHeader() {
  return Expanded(
    flex: 3,
    child: Container(
      alignment: Alignment.centerLeft,

      child: Center(
          child: Text(
            ' \t Login Here \n \t     ',
            style: TextStyle(color: Colors.white, fontSize: 35,fontWeight: FontWeight.bold),
          ),
        ),


    ),
  );
}

class BackgroundSignIn extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var sw = size.width;
    var sh = size.height;
    var paint = Paint();

    Path mainBackground = Path();
    mainBackground.addRect(Rect.fromLTRB(0, 0, sw, sh));
    paint.color = Colors.grey.shade100;
    canvas.drawPath(mainBackground, paint);

    Path blueWave = Path();
    blueWave.lineTo(sw, 0);
    blueWave.lineTo(sw, sh * 0.5);
    blueWave.quadraticBezierTo(sw * 0.5, sh * 0.45, sw * 0.2, 0);
    blueWave.close();
    paint.color = Colors.lightBlue.shade300;
    canvas.drawPath(blueWave, paint);

    Path greyWave = Path();
    greyWave.lineTo(sw, 0);
    greyWave.lineTo(sw, sh * 0.1);
    greyWave.cubicTo(
        sw * 0.95, sh * 0.15, sw * 0.65, sh * 0.15, sw * 0.6, sh * 0.38);
    greyWave.cubicTo(sw * 0.52, sh * 0.52, sw * 0.05, sh * 0.45, 0, sh * 0.4);
    greyWave.close();
    paint.color = Colors.grey.shade800;
    canvas.drawPath(greyWave, paint);

    Path yellowWave = Path();
    yellowWave.lineTo(sw * 0.7, 0);
    yellowWave.cubicTo(
        sw * 0.6, sh * 0.05, sw * 0.27, sh * 0.01, sw * 0.18, sh * 0.12);
    yellowWave.quadraticBezierTo(sw * 0.12, sh * 0.2, 0, sh * 0.2);
    yellowWave.close();
    paint.color = Colors.orange.shade300;
    canvas.drawPath(yellowWave, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}

class BackgroundSignUp extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var sw = size.width;
    var sh = size.height;
    var paint = Paint();

    Path mainBackground = Path();
    mainBackground.addRect(Rect.fromLTRB(0, 0, sw, sh));
    paint.color = Colors.grey.shade100;
    canvas.drawPath(mainBackground, paint);

    Path blueWave = Path();
    blueWave.lineTo(sw, 0);
    blueWave.lineTo(sw, sh * 0.65);
    blueWave.cubicTo(sw * 0.8, sh * 0.8, sw * 0.55, sh * 0.8, sw * 0.45, sh);
    blueWave.lineTo(0, sh);
    blueWave.close();
    paint.color = Colors.lightBlue.shade300;
    canvas.drawPath(blueWave, paint);

    Path greyWave = Path();
    greyWave.lineTo(sw, 0);
    greyWave.lineTo(sw, sh * 0.3);
    greyWave.cubicTo(sw * 0.65, sh * 0.45, sw * 0.25, sh * 0.35, 0, sh * 0.5);
    greyWave.close();
    paint.color = Colors.blueAccent;
    canvas.drawPath(greyWave, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}



import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:async';

import 'package:salinetracker/wards.dart';


class Contactus extends StatefulWidget {
  @override
  _ContactusState createState() => _ContactusState();
}

class _ContactusState extends State<Contactus> {
//  void customLaunch(command) async {
//    if (await canLaunch(command)) {
//      await launch(command);
//    } else {
//      print(' could not launch $command');
//    }
//  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFEFEFE),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Form(
                child: Column(
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          height: 5,
                          width: double.infinity,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child:  FlatButton(
                                child: new Icon(
                                  Icons.arrow_back_ios,
                                  color: Colors.black,
                                  size: 25.0,
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => PostHomePage(),
                                    ),
                                  );
                                },


                              ),
                              alignment: Alignment.topLeft,
                            ),

                          ],
                        ),

                        Align(
                          alignment: Alignment(1, 0),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(8.0, 8.0, 12.0, 8.0),
                            child: Text(
                              "CONTACT US",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w700,

                              ),
                            ),
                          ),
                        ),

                        SizedBox(height:20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [ Container(

                            child: Image.asset(
                              'assets/photo.jpg',
                              width: 100,
                              height:  100,


                            ),
                            alignment: Alignment.topLeft,
                            //padding: EdgeInsets.only(bottom: Dimensions.boxHeight * 20)
                          ),

                            SizedBox(
                              width: 240.0,

                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Container(

                                  child: TextFormField(

                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Color(0xFFEEEEEE),
                                      prefixIcon: new Icon(Icons.person),
                                      labelText: "Name",
                                      enabledBorder: const OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                                        borderSide: const BorderSide(
                                          color: Color(0xFFEEEEEE),
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(10.0)),

                                      ),

                                    ),


                                  ),
                                ),
                              ),


                            ),

                          ],
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(25.0, 5.0, 10.0, 5.0),
                          child: Container(

                            child: TextFormField(

                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Color(0xFFEEEEEE),
                                prefixIcon: new Icon(Icons.email),
                                labelText: "Email Id",
                                enabledBorder: const OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                                  borderSide: const BorderSide(
                                    color: Color(0xFFEEEEEE),
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(10.0)),

                                ),

                              ),


                            ),
                          ),
                        ),


                        SizedBox(
                          height: 12.0,
                        ),
                        Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(25.0, 5.0, 10.0, 5.0),
                              child: Container(

                                child: TextFormField(
                                  maxLines: 8,
                                  minLines: 4,
                                  textAlign: TextAlign.right,

                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Color(0xFFEEEEEE),
                                    prefixIcon: Padding(
                                      padding: const EdgeInsets.fromLTRB(0.0,0.0, 0.0, 60.0),
                                      child: new Icon(Icons.message),
                                    ),

                                    labelText: "Message",
                                    alignLabelWithHint: true,
                                    enabledBorder: const OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                                      borderSide: const BorderSide(
                                        color: Color(0xFFEEEEEE),
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(10.0)),

                                    ),

                                  ),


                                ),
                              ),
                            ),

                          ],),



                      ],
                    ),

//            SizedBox(
//              height: Dimensions.boxHeight * 10,
//            ),
//            Expanded(
//              child: ClipPath(
//                child: Container(
//                  alignment: Alignment(0, 0.3),
//                  color: Colors.pink[200],
//                  child: Padding(
//                    padding: EdgeInsets.symmetric(horizontal: Dimensions.boxWidth*5),
//                    child: Row(
//                      mainAxisSize: MainAxisSize.max,
//                      crossAxisAlignment: CrossAxisAlignment.center,
//                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                      children: [
//                             IconButton(
//
//                                icon: FaIcon(FontAwesomeIcons.whatsapp),
//
//                    onPressed: (){
//                            FlutterOpenWhatsapp.sendSingleMessage("+919403824587", "Hello");
//                          },
//                             ),
//
//
//
//                        IconButton(
//                          icon: FaIcon(FontAwesomeIcons.twitter),
//                        ),
//                        IconButton(
//                          icon: FaIcon(FontAwesomeIcons.instagram),
//                        ),
//                      ],
//                    ),
//                  ),
//                ),
//              ),
//            )

                  ],
                ),
              ),
              SizedBox(height: 16.0,),
              Center(
                child: Container(
                  height: 40.0,
                  width: 180.0,
                  child: FloatingActionButton(

                    backgroundColor: Colors.blue,
                    onPressed: (){},
                    child: Text('Send Message',style: TextStyle(color: Colors.white),),
                    shape: RoundedRectangleBorder(

                        borderRadius: BorderRadius.all(Radius.circular(15.0))
                    ),
                  ),
                ),
              ),
              SizedBox(height: 55.0,),
              Row(
                mainAxisAlignment:MainAxisAlignment.start,
                children: <Widget>[


                  Padding(
                    padding: const EdgeInsets.fromLTRB(20.0, 8.0, 8.0, 8.0),
                    child: InkWell(
//                      onTap: (){
//                        customLaunch('https://www.whatsapp.com/?lang=en');
//                      },

                      child: CircleAvatar(
                        backgroundColor: Colors.green,
                        //shape: ,
                        child: FaIcon(FontAwesomeIcons.whatsapp,color: Colors.white,),

                      ),
                    ),
                  ),
                  SizedBox(width: 70.0,),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20.0, 8.0, 8.0, 8.0),
                    child: CircleAvatar(
                      backgroundColor: Colors.blue,
                      //shape: ,
                      child: FaIcon(FontAwesomeIcons.facebook,color: Colors.white,),

                    ),
                  ),

                  SizedBox(width: 70.0,),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20.0, 8.0, 8.0, 8.0),
                    child: CircleAvatar(
                      backgroundColor: Colors.purpleAccent,
                      //shape: ,
                      child: FaIcon(FontAwesomeIcons.instagram,color: Colors.white,),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),

    );
  }


}


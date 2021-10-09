import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Search.dart';


class HospitalDetails extends StatelessWidget {

  final String title;
  final String Address;
  final String Contact;
  final String City;
  final String details;
  final String  img;
  HospitalDetails({this.title,this.Address,this.Contact,this.City,this.details,this.img});
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(title,
            style: TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),
          ),
        ),
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios,color: Colors.black,size: 25.0,),
          onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Search(),
              ),
            );
          },
        ),

      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: <Widget>[
              SizedBox(height: 25,),
              Align(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(18.0, 8.0, 1.0, 8.0),
                  child: Text(title+","+" "+Address+","+" "+City,
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,

                    ),
                  ),
                ),
                alignment: Alignment.topLeft,
              ),
              //  SizedBox(height: 10,),
              Image.network(img,height: 350,width: 350,),
              //SizedBox(height: 1,),
              Align
                (
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(18.0, 8.0, 1.0, 8.0),
                  child: Text('Details - '+details,
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                alignment: Alignment.topLeft,
              ),
              SizedBox(height: 20,),

              Align
                (
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(18.0, 8.0, 1.0, 8.0),
                  child: Text('Doctor Contact Number :-',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                alignment: Alignment.topLeft,
              ),
              SizedBox(height: 5.0,),
              Align(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(18.0, 0.0, 1.0, 8.0),
                  child: Text("+91"+" "+Contact,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                      color: Colors.blue,
                    ),
                  ),
                ),
                alignment: Alignment.topLeft,
              ),
            ],
          ),
        ),
      ),
    );

  }
}

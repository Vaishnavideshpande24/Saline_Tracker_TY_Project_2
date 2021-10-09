import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Details.dart';




class PatientDetails extends StatelessWidget {

  final String title;
  final String history;
  final String covid;
  final String ally;
  final String vacc;
  final String doses;
  final String addr;
  final String contact;

  PatientDetails({this.title,this.history,this.covid,this.ally,this.vacc,this.doses,this.addr,this.contact});
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Name :-  "+title,
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
               builder: (context) => TasksPage(),
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
                  child: Text(title,
                    style: TextStyle(
                      fontSize: 25.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,

                    ),
                  ),
                ),
                alignment: Alignment.topLeft,
              ),
              SizedBox(height: 15),

              //SizedBox(height: 1,),
              Align
                (
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(18.0, 8.0, 1.0, 8.0),
                  child: Text('Medical History :- '+history,
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.black,

                    ),
                  ),
                ),

                alignment: Alignment.topLeft,
              ),
              SizedBox(height: 15,),

              Align
                (
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(18.0, 8.0, 1.0, 8.0),
                  child: Text('Covid Status :-'+" "+covid,
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.black,
                    ),
                  ),
                ),

                alignment: Alignment.topLeft,
              ),
              SizedBox(height:15.0),
              Align(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(18.0, 0.0, 1.0, 8.0),
                  child: Text('Allergies :-'+"  "+ally,
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.black,
                    ),
                  ),
                ),
                alignment: Alignment.topLeft,
              ),
              SizedBox(height: 15.0,),
              Align(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(18.0, 0.0, 1.0, 8.0),
                  child: Text('Vaccine Type :-'+" "+vacc,
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.black,
                    ),
                  ),
                ),
                alignment: Alignment.topLeft,
              ),
              SizedBox(height: 15,),
              Align(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(18.0, 0.0, 1.0, 8.0),
                  child: Text("Doses Completed :- "+" "+doses,
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.black,
                    ),
                  ),
                ),
                alignment: Alignment.topLeft,
              ),
              SizedBox(height: 15.0,),
              Align(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(18.0, 0.0, 1.0, 8.0),
                  child: Text("Address :-"+" "+addr,
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.black,
                    ),
                  ),
                ),
                alignment: Alignment.topLeft,
              ),
              SizedBox(height: 15.0,),
              Align(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(18.0, 0.0, 1.0, 8.0),
                  child: Text("Contact No. :- "+"+91"+" "+contact,
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

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:salinetracker/Saline.dart';
import 'package:salinetracker/wards.dart';
import 'PatientDetails.dart';
import 'Posts.dart';
import 'parameters.dart';


class TasksPage extends StatefulWidget {
  final String uid;

  TasksPage({Key key, @required this.uid}) : super(key: key);

  @override
  _TasksPageState createState() => _TasksPageState(uid);
}

class _TasksPageState extends State<TasksPage> {
  final String uid;
  _TasksPageState(this.uid);

  var taskcollections = Firestore.instance.collection('tasks');
  String task;  //name
  String history; //Medicalhistory
  String covidstat;  //Covid Status
  String allergy; //Allergy
  String vaccine; //Vaccine
  String dose; //Vaccine dose no.
  String address;
  String phone;

  void showdialog(bool isUpdate, DocumentSnapshot ds) {
    GlobalKey<FormState> formkey = GlobalKey<FormState>();

    showDialog(
        context: context,
        builder: (context) {
          return SafeArea(
            child: Scaffold(

              body:Padding(
                padding: const EdgeInsets.all(10.0),
                child: SingleChildScrollView(
                  child: Form(
                    key: formkey,
                    autovalidate: true,
                   child: Column(
                     children: <Widget>[
                       SizedBox(height: 30,),
                     TextFormField(
                     autofocus: true,
                     decoration: InputDecoration(
                       border: OutlineInputBorder(),
                       labelText: "Patient Name",
                     ),
                     validator: (_val) {
                       if (_val.isEmpty) {
                         return "Can't Be Empty";
                       } else {
                         return null;
                       }
                     },
                     onChanged: (_val) {
                       task = _val;
                     },
                   ),
                    SizedBox(height: 15.0),
                    TextFormField(
                      autofocus: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Medical history",
                      ),
                      validator: (_val1) {
                        if (_val1.isEmpty) {
                          return "Can't Be Empty";
                        } else {
                          return null;
                        }
                      },
                      onChanged: (_val1) {
                        history = _val1;
                      },

                  ),
                       SizedBox(height: 15.0),
                       TextFormField(
                         autofocus: true,
                         decoration: InputDecoration(
                           border: OutlineInputBorder(),
                           labelText: "Covid-19 Status",
                         ),
                         validator: (_val2) {
                           if (_val2.isEmpty) {
                             return "Can't Be Empty";
                           } else {
                             return null;
                           }
                         },
                         onChanged: (_val2) {
                           covidstat = _val2;
                         },

                       ),
                       SizedBox(height: 15.0),
                       TextFormField(
                         autofocus: true,
                         decoration: InputDecoration(
                           border: OutlineInputBorder(),
                           labelText: "Covid-19 Vaccine Type",
                         ),
                         validator: (_val3) {
                           if (_val3.isEmpty) {
                             return "Can't Be Empty";
                           } else {
                             return null;
                           }
                         },
                         onChanged: (_val3) {
                           vaccine = _val3;
                         },

                       ),
                       SizedBox(height: 15.0),
                       TextFormField(
                         autofocus: true,
                         decoration: InputDecoration(
                           border: OutlineInputBorder(),
                           labelText: "Vaccine Doses",
                         ),
                         validator: (_val4) {
                           if (_val4.isEmpty) {
                             return "Can't Be Empty";
                           } else {
                             return null;
                           }
                         },
                         onChanged: (_val4) {
                           dose= _val4;
                         },

                       ),
                       SizedBox(height: 15.0),
                       TextFormField(
                         autofocus: true,
                         decoration: InputDecoration(
                           border: OutlineInputBorder(),
                           labelText: "Allergies",
                         ),
                         validator: (_val5) {
                           if (_val5.isEmpty) {
                             return "Can't Be Empty";
                           } else {
                             return null;
                           }
                         },
                         onChanged: (_val5) {
                           allergy= _val5;
                         },

                       ),
                       SizedBox(height: 15.0),
                       TextFormField(
                         autofocus: true,
                         decoration: InputDecoration(
                           border: OutlineInputBorder(),
                           labelText: "Address of Patient",
                         ),
                         validator: (_val6) {
                           if (_val6.isEmpty) {
                             return "Can't Be Empty";
                           } else {
                             return null;
                           }
                         },
                         onChanged: (_val6) {
                           address= _val6;
                         },

                       ),
                       SizedBox(height: 15.0),
                       TextFormField(
                         autofocus: true,
                         decoration: InputDecoration(
                           border: OutlineInputBorder(),
                           labelText: "Contact Number",
                         ),
                         validator: (_val6) {
                           if (_val6.isEmpty) {
                             return "Can't Be Empty";
                           } else {
                             return null;
                           }
                         },
                         onChanged: (_val6) {
                           phone= _val6;
                         },

                       ),



                       SizedBox(height: 25.0,),
                       RaisedButton(
                         color: Colors.purple,
                         onPressed: () {
                           if (formkey.currentState.validate()) {
                             formkey.currentState.save();
                             if (isUpdate) {
                               taskcollections
                                   .document(uid)
                                   .collection('task')
                                   .document(ds.documentID)
                                   .updateData({
                               //  'task': task,
                                 'history':history,
                                 'covidstatus':covidstat,
                                 'allergy':allergy,
                                 'vaccine':vaccine,
                                 'dose':dose,
                                 'address':address,
                                 'phone':phone,
                                 'time': DateTime.now(),
                               });
                             } else {
                               //  insert
                               taskcollections.document(uid).collection('task').add({
                                 'task': task,
                                 'history':history,
                                 'covidstatus':covidstat,
                                 'allergy':allergy,
                                 'vaccine':vaccine,
                                 'dose':dose,
                                 'address':address,
                                 'phone':phone,
                                 'time': DateTime.now(),
                               });
                             }
                             Navigator.pop(context);
                           }
                         },
                         child: Text(
                           "Add",
                           style: TextStyle(
                             fontFamily: "tepeno",
                             color: Colors.white,
                           ),
                         ),
                       ),
                    ],
                   ),
                  ),
                ),
              ),

            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => showdialog(false, null),
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1.0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios,color: Colors.black,),
          onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PostHomePage(),
              ),
            );
          },
        ),

        title: Text(
         'Room no-'+" "+'$uid'+":"+"  "+'patients',
          style: TextStyle(
            fontFamily: "Pacifico",
            color: Colors.black,

          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.remove_red_eye,color: Colors.black,size: 25.0,),
            splashColor: Colors.transparent,
            highlightColor: Colors.black,
             onPressed: (){
               Navigator.push(
                 context,
                 MaterialPageRoute(
                   builder: (context) => Salinestat(uid:uid),
                 ),


               );
             },
          ),
        ],

      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: taskcollections
            .document(uid)
            .collection('task')
            .orderBy('time')
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.documents.length,
              itemBuilder: (context, index) {
                DocumentSnapshot ds = snapshot.data.documents[index];
                DocumentSnapshot ds1 = snapshot.data.documents[index];
                DocumentSnapshot ds2 = snapshot.data.documents[index];
                DocumentSnapshot ds3 = snapshot.data.documents[index];
                DocumentSnapshot ds4 = snapshot.data.documents[index];
                DocumentSnapshot ds5 = snapshot.data.documents[index];
                DocumentSnapshot ds6 = snapshot.data.documents[index];
                DocumentSnapshot ds7 = snapshot.data.documents[index];


                return InkWell(
                  onTap: (){},
                  child: Container(

                    decoration: BoxDecoration(
                      color: Colors.purpleAccent,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    margin: EdgeInsets.all(8.0),
                    child: ListTile(
                      title: Column(
                        children: <Widget>[
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'Name:'+'   '+"  "+ds['task'].toString().toUpperCase(),
                              style: TextStyle(

                                fontSize: 20.0,
                                color: Colors.white,
                              ),
                            ),
                          ),

                          SizedBox(height: 8.0),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              'Covid-19 status:'+'  '+"  "+ds2['covidstatus'],
                              style: TextStyle(

                                fontSize: 20.0,
                                color: Colors.white,
                              ),
                            ),
                          ),




                        ],
                      ),

                      onLongPress: () {
                        // delete
//                        taskcollections
//                            .document(uid)
//                            .collection('task')
//                            .document(ds.documentID)
//                            .delete();
                        showdialog(true, ds);
                      },
                      onTap: () {
                        // == Update
                        //showdialog(true, ds);
                        Navigator.of(context).push(MaterialPageRoute(builder:(context)=>PatientDetails(
                          title:ds['task'],
                          history: ds1['history'],
                          covid: ds2['covidstatus'],
                          ally:ds3['allergy'] ,
                          vacc: ds4['vaccine'],
                          doses: ds5['dose'],
                          addr:ds6['address'],
                          contact:ds7['phone'],
                        )));
                      },
                    ),
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return CircularProgressIndicator();
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}

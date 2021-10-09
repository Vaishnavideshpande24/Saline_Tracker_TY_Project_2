import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:salinetracker/Details.dart';

class Salinestat extends StatefulWidget {
  final String uid;

  Salinestat({Key key, @required this.uid}) : super(key: key);

  @override
  _SalinestatState createState() => _SalinestatState(uid);
}

class _SalinestatState extends State<Salinestat> {

  final String uid;
  _SalinestatState(this.uid);

  var taskcollections = Firestore.instance.collection('tasks');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios,color: Colors.black,),
          onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => TasksPage(uid: uid),
              ),


            );
          },
        ),
        title: Text('Health Status',
        style: TextStyle(
            color: Colors.black,
          fontSize: 25.0,
        ),
        ),
      ),

      body: StreamBuilder(
        stream: taskcollections
            .document(uid)
        .collection('task')
        //.orderBy('time')
        .snapshots(),
       builder: (context, snapshot)  {
       if (snapshot.hasData) {
         return GridView.builder(
           gridDelegate:
           SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
           itemCount: snapshot.data.documents.length,
           itemBuilder: (context, index) {
             DocumentSnapshot ds = snapshot.data.documents[index];
             DocumentSnapshot ds1 = snapshot.data.documents[index];
             DocumentSnapshot ds2=snapshot.data.documents[index];
             return
                Padding(
                 padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 8.0),
                 child: Center(
                     child: RaisedButton(
                       shape: RoundedRectangleBorder(
                           borderRadius: BorderRadius.circular(10)),

                       color: Colors.purple,
                       disabledColor: Colors.purple,

                       onPressed: (){
                         showDialog(
                           context: context,
                           builder: (context) {
                             return Dialog(
                               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                               elevation: 16,
                               child: Container(
                                 height: 350.0,
                                 width: 250.0,
                                 child: ListView(
                                   children: <Widget>[
                                     SizedBox(height: 25),
                                     Padding(
                                       padding: const EdgeInsets.all(8.0),
                                       child: Center(
                                         child: Text('See Realtime Parameters',
                                         style: TextStyle(
                                           fontWeight: FontWeight.bold,
                                           fontSize: 20.0,
                                           fontFamily: 'Pacifico',
                                           color: Colors.black,

                                         ),
                                         ),
                                       ),
                                     ),
                                     SizedBox(height: 25),

                                     Align(
                                       alignment: Alignment.center,
                                       child: Text(
                                   "Saline status :"+"  "+ds1["salinelevel"].toString(),
                                         style: TextStyle(fontSize: 24, color: Colors.blue, fontWeight: FontWeight.bold),
                                       ),
                                     ),
                                     SizedBox(height: 25),
                                     Align(
                                       alignment: Alignment.center,
                                       child: Text(
                                         "SpO2 status :"+"  "+ds2["spo2"].toString(),
                                         style: TextStyle(fontSize: 24, color: Colors.blue, fontWeight: FontWeight.bold),
                                       ),

                                     ),
                                     SizedBox(height: 20,),
                                     Center(
                                         child: Builder(
                                             builder: (context) {
                                               // any logic needed...
                                               var myInt = int.parse(ds2['spo2']);
                                               bool _whateverLogicNeeded() {
                                                 if(myInt<=95){
                                                   return true;
                                                 }
                                                 else{
                                                   return false;
                                                 }

                                               }
                                               final condition = _whateverLogicNeeded();

                                               return condition
                                                   ? Center(child: Text('SP O2 level low',
                                                   style: TextStyle(
                                                     color: Colors.red,
                                                     fontWeight: FontWeight.bold,
                                                     fontSize: 24.0,
                                                   ),
                                               ))
                                                   : Center(child: Text('SP O2 level is normal',
                                                 style: TextStyle(
                                                   color: Colors.green,
                                                   fontSize: 24.0,
                                                 ),
                                               ));
                                             }
                                         )
                                     ),
                                     SizedBox(height: 25),
                                     Align(
                                       alignment: Alignment.center,
                                       child: Text(
                                         "Temperature :"+"98.4 F",
                                         style: TextStyle(fontSize: 24, color: Colors.blue, fontWeight: FontWeight.bold),
                                       ),
                                     ),

                                     SizedBox(height: 2),


                                   ],
                                 ),
                               ),
                             );
                           },
                         );
                       },


                       child: Text(
                         ds['task'].toString(),
                         style: TextStyle(
                           color: Colors.white,
                           fontWeight: FontWeight.bold,
                           fontSize: 20.0
                         ),
                       ),
                     ),

                 ),
               );

           },
         );
        }
       return
       Center(child: Text("Loading"));


      },
    ),);
      }


}




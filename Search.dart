
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Book.dart';
import 'Datacontroller.dart';


class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final TextEditingController searchController = TextEditingController();
  QuerySnapshot snapshotData;
  bool isExcecuted = false;
  @override
  Widget build(BuildContext context) {
    Widget searchedData() {
      return ListView.builder(
        itemCount: snapshotData.documents.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder:(context)=>HospitalDetails(
                title:snapshotData.documents[index]['Name'],
                Address: snapshotData.documents[index]['Address'],
                Contact: snapshotData.documents[index]['Phone no.'],
                City:snapshotData.documents[index]['Subject'] ,
                details: snapshotData.documents[index]['DetailAdrs'],
                img: snapshotData.documents[index]['Image'],
              )));
            },
            child: ListTile(

              title: Text(
                snapshotData.documents[index]['Name'],
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 22.0),
              ),
              subtitle: Text(

                snapshotData.documents[index]['Address']+", "+snapshotData.documents[index]['Subject'],
                style: TextStyle(
                    color: Colors.grey[600],
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0),
              ),
              trailing: Container(
                padding: EdgeInsets.only(top: 8.0),
                child:Text( "- "+snapshotData.documents[index]['Phone no.'],
                  style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0),
                ),
              ),
            ),
          );
        },
      );
    }

    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.clear),
          onPressed: () {
            setState(() {
              isExcecuted = false;
            });
          }),
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios,color: Colors.black,size: 25.0,),
          onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(
                //builder: (context) => TasksPage(),
              ),
            );
          },
        ),
        actions: [
          GetBuilder<DataController>(
            init: DataController(),
            builder: (val) {
              return IconButton(
                  icon: Icon(Icons.search,color: Colors.black,size: 25.0,),
                  onPressed: () {
                    val.queryData(searchController.text).then((value) {
                      snapshotData = value;
                      setState(() {
                        isExcecuted = true;
                      });
                    });
                  });
            },
          )
        ],
        title: TextField(
          style: TextStyle(color: Colors.black,fontWeight:FontWeight.bold,fontSize: 20),
          decoration: InputDecoration(
              hintText: 'Search Content',
              hintStyle: TextStyle(color: Colors.black,fontWeight:FontWeight.bold,fontSize: 20)),
          controller: searchController,
        ),
        backgroundColor: Colors.white,
      ),
      body: isExcecuted
          ? searchedData()
          : Container(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text('Search any content on which you wish to enrich knowledge',
                style: TextStyle(color: Colors.black, fontSize: 20.0)),
          ),
        ),
      ),
    );
  }
}
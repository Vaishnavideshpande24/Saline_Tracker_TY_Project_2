import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:salinetracker/wards.dart';





class UploadPhotoPage extends StatefulWidget {
  @override
  _UploadPhotoPageState createState() => _UploadPhotoPageState();
}

class _UploadPhotoPageState extends State<UploadPhotoPage> {

  File sampleImage;
  //Hospital name
  String _myValue;
  // Room number
  String _myValue1;
  // Capacity
  String _myValue2;
  // Active patients
  String _myValue3;
  String url;

  //for form
  final formKey=new GlobalKey<FormState>();

//function to get image
  Future getImage() async{
    var  tempImage =await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      sampleImage=tempImage;
    });
  }

  //Button
  bool validateAndSave(){
    final form=formKey.currentState;

    if(form.validate()){
      form.save();
      return true;
    }
    else{
      return false;
    }
  }

  void uploadStatusImage() async{
    if(validateAndSave()){
      final StorageReference postImageRef= FirebaseStorage.instance.ref().child("Post Images") ;
      var timeKey=new DateTime.now();

      final StorageUploadTask uploadTask=postImageRef.child(timeKey.toString() + ".jpg").putFile(sampleImage);

      var Imageurl= await(await uploadTask.onComplete).ref.getDownloadURL();

      url=Imageurl.toString();

      print("Image Url ="+ url);

      goToHomePage();
      saveToDatabase(url);

    }
  }
//Realtime database
  void saveToDatabase(url){

    var dbTimeKey = new DateTime.now();
    var formatDate=new DateFormat('MMM d, yyyy');
    var formatTime=new DateFormat('EEEE, hh:mm aaa');

    String date=formatDate.format(dbTimeKey);
    String time=formatTime.format(dbTimeKey);

    DatabaseReference ref =FirebaseDatabase.instance.reference();
    var data=
    {
      "image":url,
      "name":_myValue,
      "wardnum":_myValue1,
      "capacity":_myValue2,
      "active":_myValue3,
      "date":date,
      "time":time,
    };
    ref.child("Posts").push().set(data);

  }

  void goToHomePage(){
    Navigator.push(context,
        MaterialPageRoute(builder: (context)
        {
          return new PostHomePage();
        }
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(

      appBar: new AppBar(
        title: Center(child: new Text('Create Vitual Room')),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: new Center(
          child: sampleImage ==null ? Text('Please Submit Image of ward to register'):enableUpload(),

        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: getImage,
        tooltip: 'Add Image',
        child: new Icon(Icons.add_a_photo),
      ),
    );
  }
  Widget enableUpload(){
    return SingleChildScrollView(
      child: Container(
        child: new Form(
          key: formKey,

          child: Column(
            children: <Widget>[
              Image.file(sampleImage,height: 200.0,width: 400.0),
              SizedBox(height: 10.0),
              Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 10.0, 10.0, 10.0),
                child: TextFormField(
                  decoration: InputDecoration(labelText:'Name of hospital'),
                  validator: (value){
                    return value.isEmpty?'Hospital Name required':null;
                  },
                  onSaved: (value){
                    return _myValue=value;
                  },
                ),
              ),
              SizedBox(height: 5.0),
              Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 10.0, 10.0, 10.0),
                child: TextFormField(
                  decoration: InputDecoration(labelText:'Ward Number'),
                  validator: (value){
                    return value.isEmpty?'Ward number required':null;
                  },
                  onSaved: (value){
                    return _myValue1=value;
                  },
                ),
              ),
              SizedBox(height: 5.0),
              Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 10.0, 10.0, 10.0),
                child: TextFormField(
                  decoration: InputDecoration(labelText:'Capacity of ward'),
                  validator: (value){
                    return value.isEmpty?'Capacity required':null;
                  },
                  onSaved: (value){
                    return _myValue2=value;
                  },
                ),
              ),
              SizedBox(height: 5.0),
              Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 10.0, 10.0, 10.0),
                child: TextFormField(
                  decoration: InputDecoration(labelText:'Active patients'),
                  validator: (value){
                    return value.isEmpty?'Active patients required':null;
                  },
                  onSaved: (value){
                    return _myValue3=value;
                  },
                ),
              ),

              SizedBox(height: 25.0),
              RaisedButton(

                child: Text('Create'),
                color: Colors.blue,
                disabledColor: Colors.blue,
                onPressed: uploadStatusImage,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

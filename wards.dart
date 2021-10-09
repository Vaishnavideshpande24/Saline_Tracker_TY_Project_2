import 'package:flutter/material.dart';
import 'package:salinetracker/Details.dart';
import 'package:salinetracker/Qrcode.dart';
import 'package:salinetracker/Search.dart';
import 'Contactus.dart';
import 'CreateQRcode.dart';
import 'create_form.dart';
import 'Posts.dart';
import 'package:firebase_database/firebase_database.dart';
import 'main.dart';



class PostHomePage extends StatefulWidget {
  final String uid;
  PostHomePage({Key key, @required this.uid}) : super(key: key);

  @override
  _PostHomePageState createState() => _PostHomePageState(uid);
}

class _PostHomePageState extends State<PostHomePage> {
  final String uid;
  _PostHomePageState(this.uid);

  List<Posts> postsList = [];


  @override
  void initState() {
    super.initState();
    DatabaseReference postsRef = FirebaseDatabase.instance.reference().child(
        "Posts");
    postsRef.once().then((DataSnapshot snap) {
      // data retrieve from keys generated
      var KEYS = snap.value.keys;
      var DATA = snap.value;

      postsList.clear();

      for (var individualKey in KEYS) {
        Posts posts = new Posts
          (
          DATA[individualKey]['image'],
          DATA[individualKey]['date'],
          DATA[individualKey]['time'],
          DATA[individualKey]['name'],
          DATA[individualKey]['wardnum'],
          DATA[individualKey]['capacity'],
          DATA[individualKey]['active'],
        );

        postsList.add(posts);
      }
      setState(() {
        print('Length : $postsList.length');
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title:  Padding(
            padding: const EdgeInsets.fromLTRB(30, 5.0, 20.0, 5.0),
            child: new Text('Hospital',style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
            ),),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.power_settings_new,color: Colors.white,size: 28.0,),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginPage(),
                  ),
                );
              }
            )
          ],
        ),
        drawer: Drawer(child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            new Container(
                height: 280.0,

                child: new DrawerHeader(

                    child: Padding(
                      padding: const EdgeInsets.all(32.0),
                      child: FlatButton(
                        onPressed: () {

                        },
                        child: new Icon(
                          Icons.account_box,
                          color: Colors.white,
                          size: 150.0,
                        ),
                        shape: new CircleBorder(),
                        color: Colors.blue,
                      ),
                    )
                ),
                color: Colors.blue),
            SizedBox(height: 4.0),
            ListTile(
              leading: Icon(Icons.home, color: Colors.black, size: 25.0,),
              title: Text('Home',
                style: TextStyle(
                  fontSize: 18.0,
                ),

              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PostHomePage(),
                  ),
                );
              },
            ),
            SizedBox(height: 6.0),


            ListTile(
              leading: Icon(Icons.contact_mail, color: Colors.black, size: 25.0,),
              title: Text('Contact us',
                style: TextStyle(
                  fontSize: 18.0,
                ),),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Contactus(),
                  ),
                );
              },
            ),


            SizedBox(height: 6.0),
            ListTile(
              leading: Icon(
                Icons.add_circle, color: Colors.black, size: 25.0,),
              title: Text('Create Virtual Wards',
                style: TextStyle(
                  fontSize: 18.0,
                ),),

              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UploadPhotoPage(),
                  ),
                );
              },
            ),
            SizedBox(height: 6.0),
            ListTile(
              leading: Icon(
                Icons.book, color: Colors.black, size: 25.0,),
              title: Text('Info Pool',
                style: TextStyle(
                  fontSize: 18.0,
                ),),

              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Search(),
                  ),
                );
              },
            ),
            SizedBox(height: 6.0),
            ListTile(
              leading: Icon(
                Icons.create, color: Colors.black, size: 25.0,),
              title: Text('Create QR Code',
                style: TextStyle(
                  fontSize: 18.0,
                ),),

              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => QRCreatePage(),
                  ),
                );
              },
            ),
            SizedBox(height: 6.0),
            ListTile(
              leading: Icon(
                Icons.scanner, color: Colors.black, size: 25.0,),
              title: Text('Scan QR Code',
                style: TextStyle(
                  fontSize: 18.0,
                ),),

              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => QRScanPage(),
                  ),
                );
              },
            ),

            SizedBox(height: 6.0),
            ListTile(
              leading: Icon(Icons.info, color: Colors.black, size: 25.0,),
              title: Text('About Us',
                style: TextStyle(
                  fontSize: 18.0,
                ),),

            ),
          ],
        ),
        ),
        body: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 5.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text('Wards', style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                )),
              ),
            ),


            SizedBox(height: 25),
            Expanded(
              child: Container(

                child: postsList.length == 0
                    ? Center(child: new Text("No wards available please add one !!"))
                    : new ListView.builder
                  (
                    itemCount: postsList.length,
                    itemBuilder: (_, index) {
                      return GestureDetector(
                        onTap: () {
                          if (postsList.any((item) => item.isSelected)) {
                            setState(() {
                              postsList[index].isSelected =
                              !postsList[index].isSelected;
                            });
                          }
                        },
                        onLongPress: () {
                          setState(() {
                            postsList[index].isSelected = true;
                          });
                        },

                        child: Container(
                            color: postsList[index].isSelected ?
                            Colors.lightBlueAccent : Colors.white,
                            child: PostsUI(
                                postsList[index].image, postsList[index].date,
                                postsList[index].time,postsList[index].name,postsList[index].wardnum
                                ,postsList[index].capacity,postsList[index].active)),


                      );
                    }
                ),
              ),
            ),

          ],
        ),

      ),
    );
  }

  Widget PostsUI(String image, String date, String time,String name,String wardnum,String capacity,String active) {
    return new Card(

      elevation: 10.0,
      margin: EdgeInsets.all(10.0),

      child: InkWell(
        onTap: () {
            Route route=MaterialPageRoute(builder: (c)=>TasksPage(uid: wardnum,));
            Navigator.pushReplacement(context, route);
        },
        child: new Container
          (
          height: 280,
          width: 280,
          padding: EdgeInsets.all(10.0),

          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: <Widget>
            [
              new Row
                (
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: <Widget>[
                  new Text
                    (
                    "Room-"+"  "+wardnum,
                    style: Theme
                        .of(context)
                        .textTheme
                        .title,

                    textScaleFactor: 1.5,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(width: 10.0,),
                  new Text
                    (
                    "Capacity-"+" "+capacity,
                    style: Theme
                        .of(context)
                        .textTheme
                        .subtitle,
                    textAlign: TextAlign.center,
                  ),

                ],
              ),
              SizedBox(height: 10.0,),
              Center(child: new Image.network(image, fit: BoxFit.cover,height: 200,width: 300,)),

            ],
          ),

        ),
      ),
    );
  }
}

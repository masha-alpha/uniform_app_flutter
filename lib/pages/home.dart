import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';

import 'package:flutter_application_commerce/components/horizontal_listview.dart';
import 'package:flutter_application_commerce/components/products.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'start.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late User user;
  bool isloggedin = false;

  checkAuthentification() async {
    _auth.authStateChanges().listen((user) {
      if (user == null) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Start()));
      }
    });
  }

  getUser() async {
    User? firebaseUser = _auth.currentUser;
    await firebaseUser?.reload();
    firebaseUser = _auth.currentUser;

    if (firebaseUser != null) {
      setState(() {
        user = firebaseUser!;
        isloggedin = true;
      });
    }
  }

  signOut() async {
    _auth.signOut();

    final googleSignIn = GoogleSignIn();
    await googleSignIn.signOut();
  }

  @override
  void initState() {
    super.initState();
    checkAuthentification();
    getUser();
  }

  @override
  Widget build(BuildContext context) {
    Widget image_carousel = Container(
      height: 200,
      child: Carousel(
        boxFit: BoxFit.cover,
        images: [
          AssetImage('images/images7.jpg'),
          AssetImage('images/images8.jpg'),
          AssetImage('images/images9.jpg'),
          AssetImage('images/images10.jpg')
        ],
        autoplay: false,
        animationCurve: Curves.fastOutSlowIn,
        animationDuration: Duration(milliseconds: 1000),
        dotSize: 4.0,
        indicatorBgPadding: 4.0,
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Uniform Shop'),
        backgroundColor: Colors.amber,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.search, color: Colors.white), onPressed: () {}),
          IconButton(
              icon: Icon(Icons.shopping_cart, color: Colors.white),
              onPressed: () {})
        ],
      ),
      drawer: Drawer(
          child: ListView(children: <Widget>[
        // header
        UserAccountsDrawerHeader(
            accountName: Text(user.displayName!),
            accountEmail: Text(user.email!),
            currentAccountPicture: GestureDetector(
              child: CircleAvatar(
                backgroundColor: Colors.blueGrey,
                backgroundImage: NetworkImage(user.photoURL!),
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.amber,
            )),
        InkWell(
          onTap: () {},
          child: ListTile(
            title: Text('Home Page'),
            leading: Icon(Icons.home, color: Colors.amber),
          ),
        ),

        InkWell(
          onTap: () {},
          child: ListTile(
            title: Text('My Account'),
            leading: Icon(Icons.person, color: Colors.amber),
          ),
        ),

        InkWell(
          onTap: () {},
          child: ListTile(
            title: Text('My Orders'),
            leading: Icon(Icons.shopping_basket, color: Colors.amber),
          ),
        ),

        InkWell(
          onTap: () {},
          child: ListTile(
            title: Text('Favorites'),
            leading: Icon(Icons.favorite, color: Colors.amber),
          ),
        ),

        InkWell(
          onTap: () {},
          child: ListTile(
            title: Text('Categories'),
            leading: Icon(Icons.dashboard, color: Colors.amber),
          ),
        ),

        Divider(),

        InkWell(
          onTap: () {},
          child: ListTile(
            title: Text('Settings'),
            leading: Icon(Icons.settings, color: Colors.grey),
          ),
        ),
        InkWell(
          onTap: () {},
          child: ListTile(
            title: Text('About'),
            leading: Icon(Icons.help, color: Colors.blue),
          ),
        ),
        InkWell(
          onTap: signOut,
          child: ListTile(
            title: Text('Log Out'),
            leading: Icon(Icons.logout_outlined, color: Colors.black),
          ),
        )
      ])),
      body: Container(
        child: !isloggedin
            ? CircularProgressIndicator()
            : ListView(children: <Widget>[
                //image_carousel for displaying the images
                image_carousel,
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Categories'),
                ),

                //horizontal list view begins here
                HorizontalList(),

                //padding widget
                Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text('Recent Products')),

                //grid view
                Container(
                  height: 320.0,
                  child: Products(),
                )
              ]),
      ),
    );
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:qrscanner/adminlist.dart';
import 'package:toast/toast.dart';
import 'constant.dart';
import 'dart:ui';
import 'Qrcode.dart';
import 'NewUser.dart';
final _auth=FirebaseAuth.instance;
class Admin extends StatefulWidget {
  @override
  _AdminState createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  String userid = '', password = '';
  bool showSpinner=false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        resizeToAvoidBottomInset: false,
        backgroundColor: mainColor,
        body: ModalProgressHUD(
          inAsyncCall: showSpinner,
          child: SingleChildScrollView(
            child: Stack(
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(width: 25, height: 10),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            children: <Widget>[
                              SizedBox(width: 20),
                              Padding(
                                padding:
                                const EdgeInsets.only(left: 90, top: 150),
                                child: Text(
                                  'Admin Login',
                                  style: TextStyle(
                                    fontSize:
                                    MediaQuery.of(context).size.height / 30,
                                    //fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 25.0, right: 25.0, top: 40.0),
                      child: Card(
                        color: Color(0xBF0e2441),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                        child: Padding(
                          padding: EdgeInsets.all(20),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "User Id",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                TextFormField(
                                  style: TextStyle(
                                      color: Colors.white
                                  ),
                                  decoration: InputDecoration(
                                    hintText: 'Enter your UserId',
                                    fillColor: Colors.white,
                                  ),
                                  onChanged: (value){
                                    userid=value;
                                  },
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Please enter your UserId';
                                    }
                                    return null;
                                  },
                                  onSaved: (newValue) {
                                    userid = newValue;
                                  },
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  "Password:",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                TextFormField(
                                  obscureText: true,
                                  style: TextStyle(
                                    color: Colors.white
                                  ),
                                  decoration: InputDecoration(
                                    hintText: 'Enter your Password',
                                  ),
                                  onChanged: (value){
                                    password=value;
                                  },
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return "Please enter the Password";
                                    }
                                    return null;
                                  },
                                  onSaved: (newValue) {
                                    password = newValue;
                                  },
                                ),

                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              height:
                              .75 * (MediaQuery.of(context).size.height / 12),
                              width: 6.1 * (MediaQuery.of(context).size.width / 12),
                              //margin: EdgeInsets.only(bottom: 20),
                              child: RaisedButton(
                                elevation: 1.0,
                                color: Color(0xff0e2441),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                  side: BorderSide(color: mainColor),
                                ),
                                onPressed: () {
                                  print('successful');
                                },
                                child: InkWell(
                                  onTap: () async{
                                    setState(() {
                                      showSpinner=true;
                                    });
                                    try {
                                      final user = await _auth.signInWithEmailAndPassword(
                                          email: userid, password: password);
                                      if (user != null) {
                                        Navigator.push(context,MaterialPageRoute(builder: (context)=>AdminList()));
                                      }
                                      setState(() {
                                        showSpinner=false;
                                      });
                                    }
                                    catch (e){
                                      setState(() {

                                        Toast.show("Invalid Email Or Password", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
                                        showSpinner=false;
                                      });
                                      print(e);
                                    }
                                  },
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      'Login',
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'constant.dart';
import 'dart:ui';
import 'Qrcode.dart';
import 'NewUser.dart';

class Admin extends StatefulWidget {
  @override
  _AdminState createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  String userid = '', password = '';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        resizeToAvoidBottomInset: false,
        backgroundColor: mainColor,
        body: SingleChildScrollView(
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

                                decoration: InputDecoration(
                                  hintText: 'Enter your UserId',
                                  fillColor: Colors.white,
                                ),
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
                                decoration: InputDecoration(
                                  hintText: 'Enter your Password',
                                ),
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
                                onTap: () {
                                  print('successful');
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => NewUser()),
                                  );
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
    );
  }
}

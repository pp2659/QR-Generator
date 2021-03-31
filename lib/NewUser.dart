import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'constant.dart';
import 'dart:ui';
import 'package:qrscanner/Admin.dart';
import 'package:qrscanner/Qrcode.dart';

class NewUser extends StatefulWidget {
  @override
  _NewUserState createState() => _NewUserState();
}

class _NewUserState extends State<NewUser> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  String name = '', mobile = '', email = '', age = '', gender = '';
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
                                  const EdgeInsets.only(left: 100, top: 15),
                              child: Text(
                                'New User',
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
                                "Name",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextFormField(

                                decoration: InputDecoration(
                                  hintText: 'Enter your Name',
                                  fillColor: Colors.white,
                                ),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Please enter your Name';
                                  }
                                  return null;
                                },
                                onSaved: (newValue) {
                                  name = newValue;
                                },
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                "Phone Number:",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextFormField(
                                decoration: InputDecoration(
                                  hintText: 'Enter your Phone Number',
                                ),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return "Please enter the Phone Number";
                                  }
                                  return null;
                                },
                                onSaved: (newValue) {
                                  mobile = newValue;
                                },
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Email:",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextFormField(
                                decoration: InputDecoration(
                                  hintText: 'Enter your email',
                                ),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return "Please enter the Email";
                                  }
                                  return null;
                                },
                                onSaved: (newValue) {
                                  email = newValue;
                                },
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Age:",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextFormField(
                                decoration: InputDecoration(
                                  hintText: 'Enter your age',
                                ),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return "Please enter the Age";
                                  }
                                  return null;
                                },
                                onSaved: (newValue) {
                                  age = newValue;
                                },
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Gender:",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextFormField(
                                decoration: InputDecoration(
                                  hintText: 'Enter your gender',
                                ),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return "Please enter the gender";
                                  }
                                  return null;
                                },
                                onSaved: (newValue) {
                                  gender = newValue;
                                },
                              ),
                              SizedBox(
                                height: 20,
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
                            width: 6.1 * (MediaQuery.of(context).size.width / 10),
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
                                    MaterialPageRoute(builder: (context) => Qr()),
                                  );
                                },
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Generate QR Code',
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

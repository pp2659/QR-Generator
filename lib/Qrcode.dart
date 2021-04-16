import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'constant.dart';
import 'dart:ui' as ui;

class Qr extends StatefulWidget {
  String name;
  String age;
  String gender;
  String email;
  Qr(this.name,this.age,this.gender,this.email);



  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _QrState(name,age,gender,email);
  }
}

class _QrState extends State<Qr> {
  String name;
  String age;
  String gender;
  String email;
  String content;
  String urlLink;
  _QrState(this.name, this.age, this.gender,this.email);
  GlobalKey _renderObjectKey = new GlobalKey();
  @override
  Widget build(BuildContext context) {
    final FirebaseAuth auth = FirebaseAuth.instance;
    content = name + " " + age + " " + gender;
    return SafeArea(
      child: Scaffold(

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
                              const EdgeInsets.only(left: 35, top: 150),
                              child: Text(
                                'QR CODE GENETATED',


                                style: TextStyle(
                                  fontSize:
                                  MediaQuery
                                      .of(context)
                                      .size
                                      .height / 30,
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
                          child: Row(
                            children: [
                              RepaintBoundary(
                                key: _renderObjectKey,
                                child: QrImage(
                                  backgroundColor: Colors.white,
                                  data: content,
                                  version: QrVersions.auto,
                                  size: 100.0,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text('YOUR DETAILS',
                                      style: TextStyle(
                                        fontSize: MediaQuery
                                            .of(context)
                                            .size
                                            .height / 45,
                                        //fontWeight: FontWeight.bold,
                                        color: Colors.white,),),
                                    SizedBox(height: 20,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment
                                          .center,
                                      children: <Widget>[

                                      ],
                                    ),
                                  ],
                                ),
                              )

                            ],
                          )
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


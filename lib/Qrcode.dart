import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'constant.dart';
import 'dart:ui';

class Qr extends StatefulWidget {
  @override
  _QrState createState() => _QrState();
}

class _QrState extends State<Qr> {

  @override
  Widget build(BuildContext context) {
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
                        child: Row(
                          children: [
                            Container(height: 100,width: 100, color: Colors.white,),
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                children: [
                                  Text('DOWNLOAD QR',
                                    style: TextStyle(
                                    fontSize: MediaQuery.of(context).size.height / 45,
                                    //fontWeight: FontWeight.bold,
                                    color: Colors.white,),),
                                  SizedBox(height: 20,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                        height:
                                        .75 * (MediaQuery.of(context).size.height / 14),
                                        width: 6.1 * (MediaQuery.of(context).size.width / 22),
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

                                            },
                                            child: Align(
                                              alignment: Alignment.center,
                                              child: Text(
                                                'Link',
                                                style: TextStyle(
                                                    fontSize: 20, color: Colors.white),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
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
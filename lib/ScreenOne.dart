import 'package:flutter/material.dart';
import 'constant.dart';
import 'NewUser.dart';
import 'Admin.dart';


class ScreenOne extends StatefulWidget {
  @override
  _ScreenOneState createState() => _ScreenOneState();
}

class _ScreenOneState extends State<ScreenOne> {
  Widget _title() {
    return Stack(
      children:[
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 70.0),
              child: Container(
                height: 450,
                width: 180,
                color: Color(0xBF0e2441),
              ),
            ),
          ],
        ),
        Row(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 30, top: 100),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  child: Container(
                    child: Text(
                      'ADMIN lOGIN',
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height / 40,

                        color: Colors.white,
                      ),
                    ),

                  ),
                  onTap: () { //TODO
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Admin()),
                    );
                  },
                ),
                SizedBox(height: 10,),
                Text(
                  'EVENTS',
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height / 40,

                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 10,),
                Text(
                  'ABOUT US',
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height / 40,

                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
        Padding(
          padding: const EdgeInsets.only(left: 215.0, top: 30),
          child: Container(
            height: 70,
            width: 120,
            color: Color(0xBF0e2441),

          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 220.0, top: 35),
          child: Text("QR Code",
          style: TextStyle(
            fontSize: MediaQuery.of(context).size.height / 30,
            fontWeight: FontWeight.bold,
            color: Colors.white,),),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 220.0, top: 65),
          child: Text("Generator",
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.height / 30,
             // fontWeight: FontWeight.bold,
              color: Colors.white,),),
        ),
      ]
    );
  }

  Widget _buildButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          height: 1.4 * (MediaQuery.of(context).size.height / 20),
          width: 5 * (MediaQuery.of(context).size.width / 10),
          margin: EdgeInsets.only(top: 50),
          child: RaisedButton(
            elevation: 5.0,
            color: Color(0xBF0e2441),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            onPressed: () { //TODO
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NewUser()),
              );
            },
            child: Text(
              "New User",
              style: TextStyle(
                color: Colors.white,
                letterSpacing: 1.5,
                fontSize: MediaQuery.of(context).size.height / 40,
              ),
            ),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color(0xfff2f3f7),
        body: Stack(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/page1.png'),
                    fit: BoxFit.fill,
                  ),
                  color: mainColor,
                ),
              ),
            ),
            Column(
              children: <Widget>[
                _title(),
                _buildButton(),

                //  _buildSignUpBtn(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
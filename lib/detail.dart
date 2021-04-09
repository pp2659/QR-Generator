import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Detail extends StatefulWidget
{
  String name;
  String age;
  String gender;
  String email;
  String mobile;
  Detail(this.name,this.age,this.gender,this.email,this.mobile);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return StateDetail(name,age,gender,email,mobile);
  }

}

class StateDetail extends State<Detail>{
  String name;
  String age;
  String gender;
  String email;
  String mobile;
  StateDetail(this.name,this.age,this.gender,this.email,this.mobile);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
       appBar: AppBar(
         title: Text(name),
       ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 30,
          ),
           Text('Name: $name'),
          SizedBox(
            height: 10,
          ),
          Text('Age: $age'),
          SizedBox(
            height: 10,
          ),
          Text('Email: $email'),
          SizedBox(
            height: 10,
          ),
          Text('Gender: $gender'),
          SizedBox(
            height: 10,
          ),
          Text('Mobile: $mobile'),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'detail.dart';

class AdminList extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return AdminListState();
  }

}

class AdminListState extends State<AdminList> {
final FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text('Admin Dashboard'),),
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              height: 35,
            ),
            SizedBox(
              height: 20,
            ),
            StreamBuilder(
              stream: FirebaseFirestore.instance.collection('user').snapshots(),
              builder: (context,AsyncSnapshot<QuerySnapshot> snapshot) {
                if(!snapshot.hasData)
                {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  children: snapshot.data.docs.map((document) {
                    return GestureDetector(
                      onTap: (){
                        Navigator.push(context,MaterialPageRoute(builder: (context)=>Detail(document['name'],document['age'],document['gender'],document['email'],document['mobile'])));
                      },
                      child: Card(
                        elevation: 6,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Container(
                          padding: EdgeInsets.all(10),
                          height: 70,
                          child: Text("${document['name']}", style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),),
                        ),
                      ),
                    );
                  }).toList(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';





class profile extends StatefulWidget {
  @override
  State<profile> createState() => _profileState();

}

final FirebaseAuth _auth = FirebaseAuth.instance;
final FirebaseFirestore _firestore = FirebaseFirestore.instance;






class _profileState extends State<profile> {
  final currentUser = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("profile"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: StreamBuilder(
                stream: FirebaseFirestore.instance.collection("eventuser").where("uid",isEqualTo: currentUser!.uid).snapshots(),
                builder: (context,AsyncSnapshot<QuerySnapshot> snapshot)
                {
                  if(snapshot.hasData){

                    return ListView.builder(
                        itemCount: snapshot.data!.docs.length,
                        shrinkWrap: true,
                        itemBuilder: (context,i)
                        {
                          var data = snapshot.data!.docs[i];
                          return Container(
                            color: Colors.green.shade200,
                            margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                           child: Padding(
                             padding: const EdgeInsets.all(20.0),
                             child: Column(
                               crossAxisAlignment: CrossAxisAlignment.start,


                              children: [

                               Text("Email:\n"+data['email'],style: TextStyle( color: Colors.black87, fontSize: 30,fontStyle: FontStyle.italic,fontWeight: FontWeight.bold,


                               ),
                               ),


                                SizedBox(
                                  width: 10,
                                  height: 20,
                                ),

                                Text("Name:\n"+data['name'], style: TextStyle(color: Colors.black87, fontSize: 30,fontStyle: FontStyle.italic,fontWeight: FontWeight.bold),),

                              ],
                             ),
                           ),
                          );







                        });
                  }else{
                    return CircularProgressIndicator();
                  }
                }
            ),
          ),
        ],
      ),
    );
  }


  }







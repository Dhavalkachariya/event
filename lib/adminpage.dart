import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event/adminpanel.dart';
import 'package:event/homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';



class adminpage extends StatefulWidget{
  const adminpage({super.key});

  @override
  State<adminpage>  createState() => _adminpageState();



}


class _adminpageState extends State<adminpage>{

  final adminemailcontroller = TextEditingController();
  TextEditingController adminpasswordcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("admin panel"),
      ),
      body: Container(
        child: Center(
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Admin Login',style: TextStyle(fontSize: 25,color: Colors.blueAccent),),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextFormField(
                  controller: adminemailcontroller,
                    decoration: InputDecoration(
                      labelText: "Email",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.mail),
                    ),

                ),
              ),

              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextFormField(
                  controller: adminpasswordcontroller,
                  decoration: InputDecoration(
                    labelText: "password",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.password),
                  ),

                ),
              ),

              ElevatedButton(
                  onPressed: () async{

                    await FirebaseFirestore.instance.collection('admin').doc('adminLogin').snapshots().forEach((element) {
                      if(element.data()?['admin_email']==adminemailcontroller.text && element.data()?['admin_password']== adminpasswordcontroller.text){
                        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> adminpanel()),(route)=> false);
                      }
                    }).catchError((e){
                      print(e);

                    }
                    );
                    }, child: Text("Login"),
                    ),

              TextButton(
                  onPressed: (){
                    setState(() {
                      Navigator.pop(context);
                    });
                  },
                  child: Text("Not a admin"))




            ],
          ),
        ),
      ),
    );
  }

}
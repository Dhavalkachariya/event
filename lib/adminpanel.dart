import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class adminpanel extends StatefulWidget{
  const adminpanel({super.key});

  @override
  State<adminpanel> createState()=> _adminpanelState();
}

class _adminpanelState extends State<adminpanel>{
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('adminPanel'),
      ),
      // body: StreamBuilder(
      //   stream: FirebaseFirestore.instance.collection('eventuser').snapshots(),
      //     builder: (context,AsyncSnapshot<QuerySnapshot> snapshot){
      //
      //     if (snapshot.hasData) {
      //       return ListView.builder(
      //           itemCount: snapshot.data!.docs.length,
      //           itemBuilder: (context, i){
      //             return Container(
      //               width: 200,height: 100,
      //               color: Colors.green.shade200,
      //               child: Column(
      //                 children: [
      //                   Text("Name:"+snapshot.data!.docs[i]['name']),
      //                   SizedBox(
      //
      //                     height: 10,
      //                   ),
      //                   Text("Email:"+snapshot.data!.docs[i]['email']),
      //                 ],
      //               ),
      //             );
      //           }
      //       );
      //     }
      //
      // }


      body: StreamBuilder(
                stream: FirebaseFirestore.instance.collection("eventuser").snapshots(),
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
                            // width: 150,height: 200,
                            margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                            color: Colors.green.shade200,
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text("Email:"+snapshot.data!.docs[i]['email'],style: TextStyle( color: Colors.black87, fontSize: 30,fontStyle: FontStyle.italic,fontWeight: FontWeight.bold,
                                    shadows: [Shadow(
                                        blurRadius: 10.0,
                                        color: Colors.orange,
                                        offset: Offset(2.0,2.0)
                                    )],

                                  ),
                                  ),

                                  SizedBox(

                                    height: 20,
                                  ),

                                  Text("Name:"+snapshot.data!.docs[i]['name'], style: TextStyle( shadows: [Shadow(
                                      blurRadius: 10.0,
                                      color: Colors.orange,
                                      offset: Offset(2.0,2.0)
                                  )],color: Colors.black87, fontSize: 30,fontStyle: FontStyle.italic,fontWeight: FontWeight.bold),)
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


      // body: Column(
      //   children: [
      //     StreamBuilder(
      //         stream: FirebaseFirestore.instance.collection("eventuser").snapshots(),
      //         builder: (context,AsyncSnapshot<QuerySnapshot> snapshot)
      //         {
      //           if(snapshot.hasData){
      //
      //             return ListView.builder(
      //                 itemCount: snapshot.data!.docs.length,
      //                 shrinkWrap: true,
      //                 itemBuilder: (context,i)
      //                 {
      //                   var data = snapshot.data!.docs[i];
      //                   return Container(
      //                     // width: 150,height: 200,
      //                     margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
      //                     color: Colors.green.shade200,
      //                     child: Padding(
      //                       padding: const EdgeInsets.all(20.0),
      //                       child: Column(
      //                         crossAxisAlignment: CrossAxisAlignment.center,
      //                         children: [
      //                           Text("Email:"+snapshot.data!.docs[i]['email'],style: TextStyle( color: Colors.black87, fontSize: 30,fontStyle: FontStyle.italic,fontWeight: FontWeight.bold,
      //                             shadows: [Shadow(
      //                                 blurRadius: 10.0,
      //                                 color: Colors.orange,
      //                                 offset: Offset(2.0,2.0)
      //                             )],
      //
      //                           ),
      //                           ),
      //
      //                           SizedBox(
      //
      //                             height: 20,
      //                           ),
      //
      //                           Text("Name:"+snapshot.data!.docs[i]['name'], style: TextStyle( shadows: [Shadow(
      //                               blurRadius: 10.0,
      //                               color: Colors.orange,
      //                               offset: Offset(2.0,2.0)
      //                           )],color: Colors.black87, fontSize: 30,fontStyle: FontStyle.italic,fontWeight: FontWeight.bold),)
      //                         ],
      //                       ),
      //                     ),
      //                   );
      //
      //
      //
      //
      //
      //
      //
      //                 });
      //           }else{
      //             return CircularProgressIndicator();
      //           }
      //         }
      //     ),
      //   ],
      // ),
    );

  }
}
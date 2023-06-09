import 'package:event/images.dart';
import 'package:flutter/material.dart';
import 'bookevent.dart';

class haldi extends StatefulWidget {
  @override
  State<haldi> createState() => _haldiState();
}

class _haldiState extends State<haldi> {
  bool value =  false;

  bool value1 = false;

  bool value2 = false;

  bool value3 = false;

  bool value4 = false;

  bool value5 = false;
  bool value6 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "Haldi",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
          child: Container(
        child: Form(
            child: Column(
          children: <Widget>[

            Container(
              height: 200,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(haldi1), fit: BoxFit.fill)),
            ),
            CheckboxListTile(
              title: Text("Balloon"),
              value: value,
              onChanged: (newValue) {
                setState(() {
                  value = newValue!;
                });
              },
              controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
            ),
            CheckboxListTile(
              title: Text("Props"),
              value: value1,
              onChanged: (newValue) {
                setState(() {
                  value1 = newValue!;
                });
              },
              controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
            ),
            CheckboxListTile(
              title: Text("FLower"),
              value: value2,
              onChanged: (newValue) {
                setState(() {
                  value2 = newValue!;
                });
              },
              controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
            ),
            CheckboxListTile(
              title: Text("Welcome"),
              value: value3,
              onChanged: (newValue) {
                setState(() {
                  value3 = newValue!;
                });
              },
              controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
            ),
            CheckboxListTile(
              title: Text("Flower pots"),
              value: value4,
              onChanged: (newValue) {
                setState(() {
                  value4 = newValue!;
                });
              },
              controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
            ),
            CheckboxListTile(
              title: Text("Sound system"),
              value: value5,
              onChanged: (newValue) {
                setState(() {
                  value5 = newValue!;
                });
              },
              controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
            ),
            CheckboxListTile(
              title: Text("Stage"),
              value: value6,
              onChanged: (newValue) {
                setState(() {
                  value6 = newValue!;
                });
              },
              controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10, top: 40),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              const BoxShadow(
                                  color: Color.fromRGBO(143, 148, 251, .2),
                                  blurRadius: 20.0,
                                  offset: Offset(0, 10))
                            ]),
                        child: Column(
                          children: [
                            Container(
                              // padding: const EdgeInsets.all(8.0),
                              // child: Text(
                              //     " balloon\n props\n Flower \n welcome standee\n flower pots \n sound system \n staje "),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, top: 250, right: 30),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => book(),
                      ));
                },
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: const LinearGradient(colors: [
                        Color.fromARGB(255, 11, 83, 192),
                        Color.fromARGB(115, 93, 198, 219),
                      ])),
                  child: const Center(
                    child: Text(
                      "Book",
                      style: TextStyle(
                          color: Color.fromARGB(255, 230, 225, 223),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),

          ],
        )),
      )),
    );
  }
}

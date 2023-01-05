import 'package:flutter/material.dart';
import 'package:event/images.dart';
import 'package:url_launcher/url_launcher.dart';

class book extends StatefulWidget {
  const book({super.key});

  @override
  State<book> createState() => _bookState();
}

class _bookState extends State<book> {
  @override
  Widget build(BuildContext context) {
    final Uri whatsApp = Uri.parse('https://wa.me/9662013968');
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Book Event"),
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back)),
        ),
        body: Container(
            child: Form(
                child: Column(children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 130, right: 20),
            child: Container(
              height: 400,
              decoration: const BoxDecoration(
                  image: DecorationImage(image: AssetImage(paymentQR))),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 120),
            child: Center(
              child: Container(
                height: 20.0,
                child: Row(
                  children: [
                    const SizedBox(height: 30),
                    Icon(Icons.whatsapp),
                    GestureDetector(
                        onTap: (() async {
                          launchUrl(whatsApp);
                        }),
                        child: (Text("9662013968"))),
                  ],
                ),
              ),
            ),
          ),
        ]))));
  }
}

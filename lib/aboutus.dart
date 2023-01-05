// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:event/homepage.dart';
import 'package:url_launcher/url_launcher.dart';

class about extends StatefulWidget {
  const about({super.key});

  @override
  State<about> createState() => _aboutState();
}

class _aboutState extends State<about> {
  @override
  Widget build(BuildContext context) {
    final Uri whatsApp = Uri.parse('https://wa.me/9662013968');
    final Uri mail = Uri.parse(
        'mailto:connect.eventinfo01@gmail.com?subject=News&body=New%20plugin');
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("About Us"),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back)),
      ),
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Expanded(
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
                    // Icon(Icons.whatsapp),
                    // Text("9662013968"),
                  ],
                ),
              )),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Expanded(
                  child: Container(
                height: 20.0,
                child: Row(
                  children: [
                    const SizedBox(height: 30),
                    Icon(Icons.email),
                    GestureDetector(
                        onTap: (() async {
                          launchUrl(mail);
                        }),
                        child: (Text("connect.eventinfo01@gmail.com"))),
                    // Text("connect.eventinfo01@gmail.com"),
                  ],
                ),
              )),
            )
          ],
        ),
      ),
    );
  }
}

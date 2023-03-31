import 'package:event/Babyshower.dart';
import 'package:event/haldi.dart';
import 'package:event/images.dart';
import 'package:event/birthday.dart';
import 'package:event/wedding.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:event/aboutus.dart';
import 'package:event/profilepage.dart';

class Page2 extends StatefulWidget {
  const Page2({super.key});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  int _selected = 0;
  void changeSelected(int index) {
    setState(() {
      _selected = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("event management"),
      ),
      drawer: Container(
        width: 360,
        child: Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(drawerbackground),
                          fit: BoxFit.cover)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image(
                        image: AssetImage(drawerlogo),
                        height: 70,
                      ),
                      Text(
                        'Dhaval kachariya',
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            'Dhaval@gmail.com',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                          Icon(
                            Icons.arrow_drop_down,
                            color: Colors.white,
                          )
                        ],
                      )
                    ],
                  )),
              ListTile(
                selected: _selected == 0,
                leading: Icon(
                  Icons.home,
                  size: 20,
                ),
                title: Text(
                  'Home',
                  style: TextStyle(
                    fontSize: 23,
                  ),
                ),
                onTap: () {
                  changeSelected(0);
                  setState(() {
                    Navigator.pushNamed(context, 'profile');
                  });
                },
              ),
              const Divider(
                thickness: 3,
                indent: 10,
                endIndent: 10,
              ),
              ListTile(
                selected: _selected == 1,
                leading: Icon(
                  Icons.folder,
                  size: 20,
                ),
                title: Text(
                  'Profile',
                  style: TextStyle(
                    fontSize: 23,
                  ),
                ),
                onTap: () {
                  changeSelected(1);
                  setState(() {
                    Navigator.pushNamed(context, 'profile');
                  });
                },
              ),
              const Divider(
                thickness: 3,
                indent: 10,
                endIndent: 10,
              ),
              ListTile(
                selected: _selected == 2,
                leading: Icon(
                  Icons.event,
                  size: 20,
                ),
                title: Text(
                  'My Event',
                  style: TextStyle(
                    fontSize: 23,
                  ),
                ),
                onTap: () {
                  changeSelected(2);
                },
              ),
              const Divider(
                thickness: 3,
                indent: 10,
                endIndent: 10,
              ),
              ListTile(
                selected: _selected == 3,
                leading: Icon(
                  Icons.policy,
                  size: 20,
                ),
                title: Text(
                  'Term & condition',
                  style: TextStyle(
                    fontSize: 23,
                  ),
                ),
                onTap: () {
                  changeSelected(3);
                },
              ),
              const Divider(
                thickness: 3,
                indent: 10,
                endIndent: 10,
              ),
              ListTile(
                selected: _selected == 4,
                leading: Icon(
                  Icons.settings,
                  size: 20,
                ),
                title: Text(
                  'Setting',
                  style: TextStyle(
                    fontSize: 23,
                  ),
                ),
                onTap: () {
                  changeSelected(4);
                },
              ),
              const Divider(
                thickness: 3,
                indent: 10,
                endIndent: 10,
              ),
              ListTile(
                selected: _selected == 5,
                leading: Icon(
                  Icons.contact_page,
                  size: 20,
                ),
                title: Text(
                  'About us',
                  style: TextStyle(
                    fontSize: 23,
                  ),
                ),
                onTap: () {
                  changeSelected(5);
                  setState(() {
                    Navigator.pushNamed(context, 'about');
                  });
                },
              ),
              const Divider(
                thickness: 3,
                indent: 10,
                endIndent: 10,
              ),
              ListTile(
                selected: _selected == 6,
                leading: Icon(
                  Icons.logout,
                  size: 20,
                ),
                title: Text(
                  'Log Out',
                  style: TextStyle(
                    fontSize: 23,
                  ),
                ),
                onTap: () {
                  changeSelected(6);
                  setState(() {
                    Navigator.pushNamed(context, '/');
                  });
                },
              ),
              const Divider(
                thickness: 3,
                indent: 10,
                endIndent: 10,
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
          height: MediaQuery.of(context).size.height,
          color: Colors.grey.shade300,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Container(
                    height: 20,
                    child: Row(
                      children: [
                        const SizedBox(height: 30),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Image.asset(
                            birthday,
                            height: 120.0,
                          ),
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            textStyle: const TextStyle(fontSize: 20),
                          ),
                          child: const Text("Birthday"),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SubPage(),
                                ));
                          },
                        ),
                        SizedBox(
                          height: 5.0,
                        )
                      ],
                    ),
                    margin: EdgeInsets.only(
                        left: 10.0, top: 10.0, right: 10.0, bottom: 10.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 20,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Image(
                            image: AssetImage(haldi1),
                            fit: BoxFit.fill,
                          ),
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            textStyle: const TextStyle(fontSize: 20),
                          ),
                          child: const Text("Haldi"),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => haldi(),
                                ));
                          },
                        ),
                        SizedBox(
                          height: 5.0,
                        )
                      ],
                    ),
                    margin: EdgeInsets.only(
                        left: 10.0, top: 10.0, right: 10.0, bottom: 10.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 20,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Image(
                            image: AssetImage(wedding),
                            fit: BoxFit.fill,
                          ),
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            textStyle: const TextStyle(fontSize: 20),
                          ),
                          child: const Text("Wedding"),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Wedding(),
                                ));
                          },
                        ),
                        SizedBox(
                          height: 5.0,
                        )
                      ],
                    ),
                    margin: EdgeInsets.only(
                        left: 10.0, top: 10.0, right: 10.0, bottom: 10.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 20,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Image(
                            image: AssetImage(babyshower),
                            fit: BoxFit.fill,
                          ),
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            textStyle: const TextStyle(fontSize: 20),
                          ),
                          child: const Text("Baby Shower"),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Babyshower(),
                                ));
                          },
                        ),
                        SizedBox(
                          height: 5.0,
                        )
                      ],
                    ),
                    margin: EdgeInsets.only(
                        left: 10.0, top: 10.0, right: 10.0, bottom: 10.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(),
                      ],
                    ),
                  ),
                ),
              ]),
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: GNav(
              gap: 8,
              backgroundColor: Colors.black,
              color: Colors.white,
              activeColor: Colors.white,
              tabBackgroundColor: Colors.grey.shade800,
              padding: EdgeInsets.all(16),
              onTabChange: (index) {
                print(index);
              },
              tabs: const [
                GButton(
                  icon: Icons.home,
                  text: 'Home',
                ),
                GButton(
                  icon: Icons.favorite_border,
                  text: 'likes',
                ),
                GButton(
                  icon: Icons.search,
                  text: 'search',
                ),
                GButton(
                  icon: Icons.settings,
                  text: 'settings',
                ),
              ]),
        ),
      ),
    );
  }
}

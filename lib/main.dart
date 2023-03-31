
import 'package:event/aboutus.dart';
import 'package:event/bookevent.dart';
import 'package:event/images.dart';
import 'package:event/profilepage.dart';
import 'package:flutter/material.dart';
import 'dbhelper/model.dart';
import 'homepage.dart';
import 'signup.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'comHelper.dart';
import 'package:event/dbhelper/sqfliteDatabase.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const HomePage(),
        'page2': (context) => const Page2(),
        'page3': (context) => const page3(),
        'book': (context) => const book(),
        'about': (context) => const about(),
        'profile': (context) => profile(),


      },
    ));

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  String email = '';
  String password = '';
  GlobalKey<FormState> formkey = GlobalKey<FormState>();


  bool _isObscure = true;

  final emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  // var nameController = new TextEditingController();
  void toggle() {
    setState(() {
      _isObscure = !_isObscure;
    });
  }

  // ignore: non_constant_identifier_names
  var _SqfliteDatabase;

  @override
  void initState() {
    super.initState();
    _SqfliteDatabase = sqfliteDatabase();
  }

  login() async {
    String uid = emailcontroller.text;
    String passwd = passwordcontroller.text;

    if (formkey.currentState!.validate()) {
      await _SqfliteDatabase.getLoginUser(uid, passwd).then((userData) {
        if (userData != null) {

          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (_) => Page2()),
              (Route<dynamic> route) => false);
          alertDialog(context, "login successfull");

        } else {
          alertDialog(context, "Error: User Not Found");
        }
      }).catchError((error) {
        print(error);
        alertDialog(context, "Error: Login Fail");
      });
    }
  }



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
              child: Form(
            key: formkey,
            child: Column(
              children: <Widget>[
                Container(
                  height: 200,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(loginbackground),
                          fit: BoxFit.fill)),
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                          left: 30,
                          width: 80,
                          height: 200,
                          child: Container(
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                              image: AssetImage(loginbackground1),
                            )),
                          )),
                      Positioned(
                          left: 40,
                          width: 80,
                          height: 60,
                          child: Container(
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(loginbackground2))),
                          )),
                      Positioned(
                          right: 40,
                          top: 40,
                          width: 80,
                          height: 150,
                          child: Container(
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(loginbackground3))),
                          )),
                      Positioned(
                          child: Container(
                        margin: const EdgeInsets.only(top: 50),
                        child: const Center(
                          child: Text(
                            "Login",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 40,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      )),
                    ],
                  ),
                ),
                // Image.asset('assets/image/image1.jpg', fit: BoxFit.cover),
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.all(5),
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
                          children: <Widget>[
                            Container(
                              padding: const EdgeInsets.all(8.0),
                              decoration: const BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(color: Colors.grey))),
                              child: TextFormField(
                                  onSaved: (newValue) {
                                    newValue = email;
                                  },
                                  controller: emailcontroller,
                                  decoration: const InputDecoration(
                                    prefixIcon: Icon(Icons.mail),
                                    labelText: 'Email',
                                    hintText: 'Email address for validation',
                                  ),
                                  keyboardType: TextInputType.emailAddress,
                                  autofillHints: [AutofillHints.email],
                                  validator: MultiValidator([
                                    RequiredValidator(errorText: "Required"),
                                    EmailValidator(errorText: "not vallid"),
                                  ])),
                            ),
                            Container(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                  onSaved: (newValue) {
                                    newValue = password;
                                  },
                                  controller: passwordcontroller,
                                  maxLength: 8,
                                  obscureText: _isObscure,
                                  decoration: InputDecoration(
                                    prefixIcon:
                                        const Icon(Icons.password_outlined),
                                    suffixIcon: IconButton(
                                      icon: Icon(_isObscure
                                          ? Icons.visibility
                                          : Icons.visibility_off),
                                      onPressed: () {
                                        setState(() {
                                          toggle();
                                        });
                                      },
                                    ),
                                    labelText: 'password',
                                  ),
                                  validator: MultiValidator([
                                    RequiredValidator(errorText: "Required"),
                                    MinLengthValidator(8,
                                        errorText: "more than 8"),
                                  ])),
                            )
                          ],
                        ),
                      ),
                      Text(email),
                      const SizedBox(
                        height: 30,
                      ),
                      GestureDetector(
                        onTap: () => login(),
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: const LinearGradient(colors: [
                                Color.fromARGB(255, 64, 13, 206),
                                Color.fromRGBO(143, 148, 251, .6),
                              ])),
                          child: const Center(
                            child: Text(
                              "Login",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Text(
                          "OR",
                          style: TextStyle(
                              color: Color.fromARGB(255, 14, 150, 139)),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, 'page3');
                        },
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: const LinearGradient(colors: [
                                Color.fromARGB(255, 139, 79, 10),
                                Color.fromARGB(115, 39, 98, 146),
                              ])),
                          child: const Center(
                            child: Text(
                              "signup",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 230, 225, 223),
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "Forgot Password?",
                        style:
                            TextStyle(color: Color.fromARGB(255, 58, 15, 201)),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ))),
    );
  }
}

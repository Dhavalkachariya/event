import 'package:event/dbhelper/model.dart';
import 'package:event/homepage.dart';
import 'comHelper.dart';
import 'dbhelper/sqfliteDatabase.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'images.dart';

class page3 extends StatefulWidget {
  const page3({super.key});

  @override
  State<page3> createState() => _page3state();
}

class _page3state extends State<page3> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  bool _isObscure = true;

  var nameController = new TextEditingController();
  var emailController = new TextEditingController();
  var passwordController = new TextEditingController();

  void toggle() {
    setState(() {
      _isObscure = !_isObscure;
    });
  }

  validate() {
    if (formkey.currentState!.validate()) {
      setState(() {
        Navigator.pushNamed(context, 'page2');
      });
    }
  }

  var _SqfliteDatabase;

  @override
  void initState() {
    super.initState();
    _SqfliteDatabase = sqfliteDatabase();
  }

  signUp(String name, String email, String password) async {

    String uname = nameController.text;
    String email = emailController.text;
    String passwd =passwordController.text;

    if (formkey.currentState!.validate()) {
      formkey.currentState?.save();

        sqfliteDbmodel uModel = sqfliteDbmodel(uname,email,passwd);
        await _SqfliteDatabase.insertRecord(uModel).then((userData) {
          alertDialog(context, "Successfully Saved");

          Navigator.push(
              context, MaterialPageRoute(builder: (_) => Page2()));
        }).catchError((error) {
          print(error);
          alertDialog(context, "Error: Data Save Fail");
        });
      }
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Signup",
          ),
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back)),
        ),
        body: SingleChildScrollView(
          child: Center(
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
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: TextFormField(
                          controller: emailController,
                          decoration: InputDecoration(
                            labelText: "Email",
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.mail),
                          ),
                          autofillHints: [AutofillHints.email],
                          validator: MultiValidator([
                            RequiredValidator(errorText: "Required"),
                            EmailValidator(errorText: "not vallid"),
                          ])),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: TextFormField(
                        controller: nameController,
                        decoration: InputDecoration(
                          labelText: "FULL NAME",
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.person),
                        ),
                        validator: RequiredValidator(errorText: "Required"),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: TextFormField(
                          controller: passwordController,
                          maxLength: 8,
                          obscureText: _isObscure,
                          decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.password_outlined),
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
                              labelText: "password",
                              border: OutlineInputBorder()),
                          validator: MultiValidator([
                            RequiredValidator(errorText: "Required"),
                            MinLengthValidator(8, errorText: "more than 8"),
                          ])),
                    ),
                    Container(
                      height: 60,
                      width: 300,
                      child: Padding(
                        padding: EdgeInsets.only(top: 20.0),
                        child: ElevatedButton(
                            onPressed: () {
                              signUp(
                                  nameController.text,
                                  emailController.text,
                                  passwordController.text);
                            },
                            child: Text("Sign In")),
                      ),
                    ),
                  ],
                )),
          ),
        ));
  }

//   _insertData(String name, String email, String password) async {
//     if (formkey.currentState!.validate()) {
//       sqfliteDbmodel data =
//           sqfliteDbmodel(name: name, email: email, password: password);
//       var response = await sqfliteDatabase().insertRecord(data);
//
//       if (response != 0) {
//         ScaffoldMessenger.of(context)
//             .showSnackBar(SnackBar(content: Text("sign up successfully.")));
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(content: Text("something wrong while inserting Record.")));
//       }
//       setState(() {
//         Navigator.pushNamed(context, 'page2');
//       });
//     }
//   }
}

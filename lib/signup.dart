import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event/homepage.dart';
import 'comHelper.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'images.dart';
import 'package:firebase_auth/firebase_auth.dart';


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
  var addressController = new TextEditingController();

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


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                            controller: addressController,
                            decoration: InputDecoration(
                              labelText: "Address",
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(Icons.home),
                            ),
                            autofillHints: [AutofillHints.email],
                            validator: MultiValidator([
                              RequiredValidator(errorText: "Required"),

                            ])),
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

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            if (formkey.currentState!.validate()) {

                              FirebaseAuth.instance.createUserWithEmailAndPassword(
                                  email: emailController.text, password: passwordController.text,)
                                  .then((signedInUser){
                                FirebaseFirestore.instance.collection('eventuser')
                                    // .doc(signedInUser.user?.uid)
                                    // .set({"email": signedInUser.user!.email,"uid": signedInUser.user!.uid,"name":signedInUser.user!.displayName})

                                    .add({
                                  'email' : emailController.text,
                                  'name' : nameController.text,
                                  'address' : addressController.text,
                                  'password' : passwordController.text,
                                  "uid": signedInUser.user!.uid,

                                    })
                                    .then((value){
                                  if (signedInUser!= null){
                                    alertDialog(context, "Successfully Saved");

                                    Navigator.push(
                                        context, MaterialPageRoute(builder: (_) => Page2()));
                                  }
                                })
                                    .catchError((e){
                                  print(e);
                                })
                                ;}
                              )
                                  .catchError((e){
                                print(e);
                                alertDialog(context, "email used in another accont");
                              });
                            }


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
                      ),
                    ],
                  )
              ),
            ),
          )),
    );
  }


}

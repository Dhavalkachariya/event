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

  void toggle() {
    setState(() {
      _isObscure = !_isObscure;
    });
  }

  void validate() {
    if (formkey.currentState!.validate()) {
      setState(() {
        Navigator.pushNamed(context, 'page2');
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
                          decoration: InputDecoration(
                            labelText: "Email",
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.mail),
                          ),
                          validator: MultiValidator([
                            RequiredValidator(errorText: "Required"),
                            EmailValidator(errorText: "not vallid"),
                          ])),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: TextFormField(
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
                            onPressed: validate, child: Text("Sign In")),
                      ),
                    ),
                  ],
                )),
          ),
        ));
  }
}

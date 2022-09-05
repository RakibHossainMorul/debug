// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, unused_field, duplicate_ignore

import 'package:debug/DetailScreen.dart';
import 'package:debug/languages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: languages(),
      locale: Locale('bn', 'BD'),
      fallbackLocale: Locale('en', 'US'),
      theme: ThemeData(
        brightness: Brightness.light,
        textTheme:
            GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme.apply()),
        //scaffoldBackgroundColor: Colors.amber,
        floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: Colors.amber,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
            ))),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
          backgroundColor: Colors.amber,
        )),
      ),
      home: FormValidation(),
    );
  }
}

//Define A CLASS

class FormValidation extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Container(
        height: 100,
        width: 100,
        child: FloatingActionButton(
          onPressed: () {
            print(_controller.text);
          },
          child: Icon(
            Icons.abc_outlined,
            size: 50,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 10, top: 20, right: 10),
          child: Column(
            children: [
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _controller,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      keyboardType: TextInputType.text,
                      decoration:
                          InputDecoration(hintText: "Enter Your Nick Name"),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please Write Your Name";
                        } else if (value.length < 4) {
                          return "Please Provide Minimum 5 letter";
                        } else {
                          return null;
                        }
                      },
                    ),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(hintText: "Enter Your Email"),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please Write Your Email";
                        } else if (value.length < 4) {
                          return "Please Provide Valid Email";
                        } else {
                          return null;
                        }
                      },
                    ),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      decoration: InputDecoration(hintText: "Enter Password"),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please Write Your Password";
                        } else if (value.length < 4) {
                          return "Please Provide Minimum 5 letter";
                        } else {
                          return null;
                        }
                      },
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      decoration:
                          InputDecoration(hintText: "Enter Your Phone Number"),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please Write Your Phone Number";
                        } else {
                          return null;
                        }
                      },
                    ),
                    // ignore: prefer_const_constructors
                    SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                        width: 350,
                        child: ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                        builder: (_) => DetailScreen()));
                              }
                            },
                            child: Text("Submit"))),
                  ],
                ),
              ),
              Text(
                'app_name'.tr,
                style: TextStyle(fontSize: 40),
              ),
              Text(
                'app_title'.tr,
                style: TextStyle(fontSize: 40),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  Get.updateLocale(Locale('en', 'US'));
                },
                child: Text("English"),
              ),
              ElevatedButton(
                onPressed: () {
                  Get.updateLocale(Locale('bn', 'BD'));
                },
                child: Text("Bangla"),
              ),
              Card(
                elevation: 8,
                color: Colors.amber,
                child: ListTile(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => DetailScreen(),
                    ),
                  ),
                  leading:
                      // Hero(tag: '1', child: Image.asset("assets/picture.png")),
                      Image.asset("assets/picture.png"),
                  title: Text("Hero Animation"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

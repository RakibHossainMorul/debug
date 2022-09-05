// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        //child: Hero(tag: '1', child: Image.asset("assets/picture.png")),
        child: Image.asset("assets/picture.png"),
      ),
    );
  }
}

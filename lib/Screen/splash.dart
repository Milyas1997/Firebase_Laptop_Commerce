import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:laptop_commerce/Screen/show_data.dart';
import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer( const Duration(seconds: 4), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => FirebaseAuth.instance.currentUser!=null? const ShowData(): const Login(),
                
                ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Image.network(
        'http://media4.s-nbcnews.com/i/streams/2012/December/121208/1C5111051-original.jpeg',
       
        fit: BoxFit.fill,
      ),
    );
  }
}

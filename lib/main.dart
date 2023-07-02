import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smartlock/home/home.dart';
import 'package:flutter_smartlock/navbar/navbar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
          apiKey: "AIzaSyC8evfxnTsV25SvaeAMr6T0rcoAzHJOjZk",
          authDomain: "smart-lock-4ee3f.firebaseapp.com",
          projectId: "smart-lock-4ee3f",
          storageBucket: "smart-lock-4ee3f.appspot.com",
          messagingSenderId: "337708922037",
          appId: "1:337708922037:web:12dbe28e07e5e8be9dfafc")
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SmartLock',
      theme: ThemeData(
       
        primarySwatch: Colors.blue,
      ),
      home:  NavBar(),
    );
  }
}





import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

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
      title: 'Flutter Demo',
      theme: ThemeData(
       
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Smart Lock'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
   
      _counter++;
    });
  }

  Future<void> _openLock() async {
    //final CollectionReference usersCollection = FirebaseFirestore.instance.collection('users');
    final CollectionReference lockCollection = FirebaseFirestore.instance.collection('lock');
    try {
      await lockCollection.doc("XhCV3TOYYNEt8aR3jmzj").update({"lock": true});
      print("Ouvert");
    } catch (error) {
      print("Failed to ouvrir: $error");
    }
  }

  Future<void> _closeLock() async {
    //final CollectionReference usersCollection = FirebaseFirestore.instance.collection('users');
    final CollectionReference lockCollection =
        FirebaseFirestore.instance.collection('lock');
    try {
      await lockCollection.doc("XhCV3TOYYNEt8aR3jmzj").update({"lock": false});
      print("Ferme");
    } catch (error) {
      print("Failed to ferme: $error");
    }
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        
        title: Text(widget.title),
      ),
      body: Center(
        
        child: Column(
         
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(onPressed: _openLock, child: Text(
              "Deverouiller"
            ),
            ),
            SizedBox(height: 20,),
            ElevatedButton(onPressed: _closeLock, child: Text(
              "Fermer"
            ),
            )
          ],
        ),
      ),
     // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

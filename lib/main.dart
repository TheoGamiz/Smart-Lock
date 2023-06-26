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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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

  Future<void> _addUser() async {
    final CollectionReference usersCollection =
        FirebaseFirestore.instance.collection('users');

    try {
      await usersCollection
          .add({"first_name": "John", "last_name": "Doe", "age": 42});
      print("User added");
    } catch (error) {
      print("Failed to add user: $error");
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
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addUser,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:line_icons/line_icons.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

var isOpen = false;

Future<void> _openLock() async {
  //final CollectionReference usersCollection = FirebaseFirestore.instance.collection('users');

  final CollectionReference lockCollection =
      FirebaseFirestore.instance.collection('lock');
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
    print("fermer la porte");
  } catch (error) {
    print("Failed to fermer: $error");
  }
}

Future<void> _newFinger() async {
// Pour un Document

  final CollectionReference lockCollection =
      FirebaseFirestore.instance.collection('lock');
  final DocumentSnapshot lock_id =
      await lockCollection.doc("XhCV3TOYYNEt8aR3jmzj").get();
  var data = lock_id.data() as Map<String, dynamic>;
  var boolLockId = data['lock_id']; // Conversion en Map<String, dynamic>
  print("lock id: ${boolLockId}");

  try {
    await lockCollection
        .doc("XhCV3TOYYNEt8aR3jmzj")
        .update({"newFinger": true});
        
    print("nouveau");
  } catch (error) {
    print("Failed to nouveau: $error");
  }

  try {
    await lockCollection
        .doc("XhCV3TOYYNEt8aR3jmzj")
        .update({"lock_id": boolLockId + 1});

    print("nouveau");
  } catch (error) {
    print("Failed to nouveau: $error");
  }
}

class _HomeState extends State<Home> {
  IconData lockIcon = LineIcons.lock;
  var buttonText = "Ouvrir";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ma maison"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 200,
              height: 200,
              child: Icon(
                lockIcon,
                size: 200,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (isOpen) {
                  _closeLock();
                  setState(() {
                    isOpen = false;
                    lockIcon = LineIcons.lock;
                    buttonText = "Ouvrir";
                  });
                } else {
                  _openLock();
                  setState(() {
                    isOpen = true;
                    lockIcon = LineIcons.lockOpen;
                    buttonText = "Fermer";
                  });
                }
              },
              child: Text(buttonText),
            ),
            SizedBox(
              height: 100,
            ),
            ElevatedButton(
              onPressed: () {
                _newFinger();
              },
              child: Text("Nouveau"),
            )
          ],
        ),
      ),
    );
  }
}

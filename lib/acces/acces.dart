import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Acces extends StatefulWidget {
  const Acces({super.key});

  @override
  State<Acces> createState() => _AccesState();
}

class _AccesState extends State<Acces> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Mes acces")),
    );
  }
}
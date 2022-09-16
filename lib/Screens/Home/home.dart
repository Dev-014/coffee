import 'package:coffee/Services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
 // const Home({Key? key}) : super(key: key);

  final Authenticate _auth =  Authenticate();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[300],
      appBar: AppBar(
        title: const Text('Coffeez'),
        backgroundColor: Colors.brown,
        actions:[
          IconButton(onPressed: ()async{
            return await _auth.signOut1();

          },
              icon: const Icon(Icons.person),)
        ],
      ),
    );
  }
}

import 'package:coffee/Screens/wrapper.dart';
import 'package:coffee/Services/auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:coffee/modal/user1.dart';



void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User1?>.value(
        initialData: null,
        value: Authenticate().user,
        catchError: (_, err) => null,
        child: const MaterialApp(
        home: Wrapper(),
       ));
  }
}

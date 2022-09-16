import 'package:coffee/Screens/Authenticate/register.dart';
import 'package:coffee/Screens/Authenticate/signin.dart';
import 'package:flutter/material.dart';

class Authenticates extends StatefulWidget {
  @override
  State<Authenticates> createState() => _AuthenticatesState();
}

class _AuthenticatesState extends State<Authenticates> {
 // const Authenticates({Key? key}) : super(key: key);
  bool showSignIn = true;

  void toggleView(){
    setState(() => showSignIn = !showSignIn);
  }

  @override
  Widget build(BuildContext context) {
    if(showSignIn==true){
      return  SignIn(toggleView : toggleView);
    }else{
      return  Register(toggleView: toggleView);
    }


  }
}





// class Authenticate extends StatefulWidget {
//
//
//   @override
//   State<Authenticate> createState() => _AuthenticateState();
// }
//
// class _AuthenticateState extends State<Authenticate> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: const Text('authenticate')
//     );
//   }
//}

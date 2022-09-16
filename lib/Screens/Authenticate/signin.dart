import 'package:coffee/Screens/Authenticate/register.dart';
import 'package:coffee/Services/auth.dart';
import 'package:coffee/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:coffee/shared/constant.dart';

class SignIn extends StatefulWidget {
  //const SignIn({Key? key}) : super(key: key);
  final Function toggleView;
   const SignIn({required this.toggleView});


  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  Authenticate auth1 = Authenticate();
  final _formkey = GlobalKey<FormState>();

  //text field state
  String email = '';
  String password = '';
  String erro = '';
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return loading? Loading(): Scaffold(
      backgroundColor: Colors.brown[300],
      appBar: AppBar(
        title: const Text('Coffeez',
        style: TextStyle(
          color: Colors.white
        ),),

        backgroundColor: Colors.brown,
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){
            widget.toggleView();
          }, icon: const Icon(Icons.person_add)),
        ],

      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText:'Email'),
                //key: _formkey,
                validator: (val)=>val!.isEmpty?'Enter the Email':null,
                onChanged: (val){
                  setState(()=>email = val);
                },
              ),
              const SizedBox(height: 20.0),
              TextFormField(decoration: textInputDecoration.copyWith(hintText:'Password'),
               // key: _formkey,
                validator: (val)=>val!.length<6?'Password should be more than 6 char': null,
                obscureText: true,
                onChanged: (val){
                  setState(()=>password=val);
                },
              ),
              const SizedBox(height: 20.0,),

              TextButton(onPressed: ()async{
                if(_formkey.currentState!.validate()){
                setState(()=>loading = true);
                dynamic result = await auth1.signInWithEmailAndPassword(email, password);
                 if(result==null){
                     setState((){
                       erro = 'Could Not LogIn With THis Credential ';
                       loading=false;
                       });
                   }

                print(email);
                print(password);
              }}, child: const Text('SignIn'),
              ),
            ],
          ),
        )

      ),
    );
  }
}


// Container(
//   child: TextButton(onPressed: ()async{
//    dynamic result = await auth1.signInAnon();
//
//    if(result==null){
//      print('Error Signing In');
//      print(result.uid);
//
//    }else{
//      print('You are Signed In ');
//      print(result.uid);
//    }
//   },
//       child: const Text('SignIn Coffeez')),
// ),
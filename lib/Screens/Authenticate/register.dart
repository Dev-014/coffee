import 'package:flutter/material.dart';
import 'package:coffee/Services/auth.dart';
import 'package:coffee/shared/constant.dart';
import 'package:coffee/shared/loading.dart';

class Register extends StatefulWidget {
 // const Register({Key? key}) : super(key: key);
  final Function toggleView;
  const Register({required this.toggleView});


  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {



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
          }, icon: const Icon(Icons.person)),
        ],

      ),
      body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                TextFormField(
                validator: (val)=>val!.isEmpty?'Enter the Email':null,
                  onChanged: (val){
                    setState(()=>email = val);
                  },
                  decoration: textInputDecoration.copyWith(hintText:'Email'),
                ),
                const SizedBox(height: 20.0),
                TextFormField(
                  validator: (val)=>val!.length<6?'Password should be more than 6 char': null,
                  obscureText: true,
                  onChanged: (val){
                    setState(()=>password=val);
                  },
                  decoration: textInputDecoration.copyWith(hintText:'Password'),
                ),
                const SizedBox(height: 20.0,),
                TextButton(onPressed: ()async{
                  if(_formkey.currentState!.validate()){
                    setState(()=>loading = true);
                    dynamic result = await auth1.registerWithEmailAndPassword(email, password);
                    if(result==null){
                      setState((){
                        erro = 'Please enter a valid email';
                            loading=false;
                      });
                    }
                  }
                  print(email);
                  print(password);
                },
                  child: const Text('Register')
                  ,
                ),
                const SizedBox(height: 30.0),
                Text(erro,
                style: const TextStyle(color:Colors.red, fontSize: 14.0),)

              ],
            ),
          )

      ),
    );  }
}

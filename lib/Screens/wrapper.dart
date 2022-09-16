import 'package:coffee/Screens/Home/home.dart';
import 'package:coffee/Services/auth.dart';
import 'package:flutter/material.dart';
import 'package:coffee/Screens/Authenticate/authenticate.dart';
import 'package:provider/provider.dart';
import 'package:coffee/modal/user1.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //return either home or authenticate();
    final user = Provider.of<User1?>(context);
    print(user);

    if(user==null){
        return Authenticates();
      }else{
        return Home();
      }
    }
  }


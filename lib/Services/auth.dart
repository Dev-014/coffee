import 'package:coffee/modal/user1.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';

class Authenticate{

  final FirebaseAuth _auth = FirebaseAuth.instance;

  //Create user object from Firebaseuser

  User1? userFromFirebaseUser(User user){
    return user!= null? User1(uid: user.uid) : null;
  }

  //creating a function to recieve data from stream
  Stream<User1?> get user{
    return _auth.authStateChanges()
        .map((User? user) => userFromFirebaseUser(user!));
  }

  //SIGNIN USING EMAIL AND PASSWORD
  Future signInWithEmailAndPassword(String email, String password)async{
    try{ UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
    User? user = result.user;
    return userFromFirebaseUser(user!);
    }catch(e){
      print(e.toString());
      return null;
    }
  }


  //REGISTER USING EMAIL AND PASSWORD
  Future registerWithEmailAndPassword(String email, String password)async{
    try{ UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
    User? user = result.user;
    return userFromFirebaseUser(user!);
    }catch(e){
      print(e.toString());
      return null;
    }
  }



    //SIGN IN ANONYMOUSLY
  Future signInAnon() async{

    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      //print('$user');
      return userFromFirebaseUser(user!);
      //User? user = FirebaseAuth.instance.currentUser;
    }
    catch(e){
      print(e.toString());
      return null;
    }

}
Future signOut1() async{
    return await _auth.signOut();
}


}
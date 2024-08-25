import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:educational_quiz_game/features/auth/data/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class UserServices {
  static CollectionReference users = FirebaseFirestore.instance.collection('users');
  static FirebaseAuth auth = FirebaseAuth.instance;

  static Future<UserModel?> getUserByName(String name)async{
    try {
      var user = await users.where('userName', isEqualTo: name).get();
      if(user.docs.isNotEmpty){
        return UserModel.fromMap(user.docs.first.data() as Map<String,dynamic>);
      }
      return null;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return null;
    }
  }

  //create account 
  static Future<(User?,String)> createAccount({required UserModel user})async{
    try {
      var result = await auth.createUserWithEmailAndPassword(email: user.email, password: user.password!);
      if(result.user != null){
        user.id = result.user!.uid;
        await users.doc(user.id).set(user.toMap());
        return (result.user,'Account created successfully');
      }
      return (null,'Account creation failed');
    } on FirebaseAuthException catch (e) {
      if (kDebugMode) {
        print(e);
      }
      if(e.code == 'email-already-in-use'){
        return (null,'Email already in use');
      }else if(e.code == 'weak-password'){
        return (null,'Weak password');
      }else if(e.code == 'invalid-email'){
        return (null,'Invalid email');
      }
      return (null,e.message!);
    }
    catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return (null,'Account creation failed');
    }
  }

  //login
  static Future<(UserModel?,String)> login({required String email,required String password})async{
    try {
      var result = await auth.signInWithEmailAndPassword(email: email, password: password);
      if(result.user != null){
        //update user online status
        await users.doc(result.user!.uid).update({'isOnline':true});
        var user = await users.doc(result.user!.uid).get();
        return (UserModel.fromMap(user.data() as Map<String,dynamic>),'Login successful');
      }
      return (null,'Login failed');
    } on FirebaseAuthException catch (e) {
      if (kDebugMode) {
        print(e);
      }
      if(e.code == 'user-not-found'){
        return (null,'User not found');
      }else if(e.code == 'wrong-password'){
        return (null,'Wrong password');
      }else if(e.code == 'invalid-email'){
        return (null,'Invalid email');
      }
      return (null,e.message!);
    }
    catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return (null,'Login failed');
    }
  }

  static Future<UserModel?> getUserById(String s)async {
    try {
      var user = await users.doc(s).get();
      if(user.exists){
        return UserModel.fromMap(user.data() as Map<String,dynamic>);
      }
      return null;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return null;
    }
  }

  
}
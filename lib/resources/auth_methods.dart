import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/resources/storage_methods.dart';



class AuthMethods {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> signUpUser({
    required String email,
    required String password,
    required String username,
    required String bio,
    required Uint8List file,

  }) async {
    String res = "Some error occured";
    try{
      if(email.isNotEmpty || password.isNotEmpty || username.isNotEmpty || bio.isNotEmpty  ){
        // register user
        UserCredential cred = await _auth.createUserWithEmailAndPassword(email: email, password: password);
        print(cred.user!.uid);

       String photoUrl = await StorageMethods().uploadImageToStorage('ProfilePics', file, false);

        // add users to firebase
         await _firestore.collection('users').doc(cred.user!.uid).set({
          'username' : username,
          'uid' : cred.user!.uid,
          'email' : email,
          'bio' : bio,
          'followers' : [],
          'folowing' : [],
           'photoUrl' : photoUrl,
        }
        );
         res = "success";
      }
    }  on FirebaseAuthException catch(err) {
      if(err.code == 'Invaid-email') {
        res ='This Email is bady formatteed';
      } else if(err.code == 'weak-password') {
        res ='Password should be atleast 6 charecters';
      }
    }
    catch(err){
      res = err.toString();
    }
    return res;
  }
}
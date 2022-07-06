import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AppUser extends ChangeNotifier {
  update() {
    notifyListeners();
  }

  String error = "";
  AppUser._() {
    FirebaseAuth.instance.authStateChanges().listen((user) {
      notifyListeners();
    });
  }

  User? get user => FirebaseAuth.instance.currentUser;

  factory AppUser() => AppUser._();

  static AppUser get instance => AppUser();

  final auth.FirebaseAuth _firebaseAuth = auth.FirebaseAuth.instance;

//sign in
  Future<void> signIn({required String email, required String password}) async {
    // print('Email: $email');
    // print('Password: $password');
    //   try {
    //     await FirebaseAuth.instance
    //         .signInWithEmailAndPassword(email: email, password: password);
    //     print('Sign in Succesful');
    //   } on FirebaseAuthException catch (e) {
    //     if (e.code == 'user-not-found') {
    //       throw ('No user found for that email.');
    //     } else if (e.code == 'wrong-password') {
    //       throw ('Kata Laluan Salah');
    //     } else
    //       throw (e.toString());
    //   }
    UserCredential? user;
    try {
      user = await _firebaseAuth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == "invalid-email") {
        error = 'Emel tidak sah. Sila masukkan emel yang sah!';
      } else if (e.code == "user-not-found") {
        error = 'Emel belum didaftar!';
      } else if (e.code == "wrong-password") {
        error = 'Kata laluan salah!';
      } else {
        error = "Sila isi butiran di atas dengan betul";
      }
      log(e.code);
    } catch (e) {
      print(e);
    }
  }

  //sign out
  Future<void> signOut() async {
    return await _firebaseAuth.signOut();
  }

  //sign up
  Future<bool> signUp({
    required String email,
    required String password,
    // required String name,
  }) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      // user!.updateDisplayName(name);
      return true;
    } catch (e) {
      throw (e);
    }
  }
}

getUser() {
  final user = FirebaseAuth.instance.currentUser;
  if (user != null) print(user);
}

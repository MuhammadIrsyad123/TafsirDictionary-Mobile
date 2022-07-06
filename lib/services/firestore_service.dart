import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FireStoreService {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  String error = "";
  Future<void> createUserData(
    String email,
    String name,
    String userid,
    String password,
    String role,
  ) async {
    try {
      await _firebaseFirestore.collection("user").doc(userid).set({
        "useremail": email,
        "username": name,
        "userid": userid,
        "userpassword": password,
        "userrole": role,
      });
    } catch (e) {
      log(e.toString());
      error = e.toString();
    }
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> getdata() async {
    var data = await _firebaseFirestore
        .collection("user")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    return data;
  }

//SOALAN
  Future<void> tanyanSoalan(String soalan, String jawapan, String nama) async {
    await _firebaseFirestore.collection("tanya_soalan").doc().set({
      "kandungansoalan": soalan,
      "jawapan": jawapan,
      "username": nama,
    });
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> getdataSoalan(
      String id) async {
    var data =
        await _firebaseFirestore.collection("tanya_soalan").doc(id).get();
    return data;
  }

  Future<void> updateSoalanData(
    String tanya,
    String id,
  ) async {
    await _firebaseFirestore.collection("tanya_soalan").doc(id).update({
      "kandungansoalan": tanya,
    });
  }
}

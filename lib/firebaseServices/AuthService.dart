import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:driver_app/Models/user.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:firebase_core/firebase_core.dart';

FirebaseApp secondaryApp = Firebase.app('DriverApp');
auth.FirebaseAuth _auth = auth.FirebaseAuth.instanceFor(app: secondaryApp);

class AuthServices {
  auth.User getUser(){
    return _auth.currentUser;
  }
  Future<User> getUserProfile(String uid) async {
    final document =
        await FirebaseFirestore.instance.collection("Drivers").doc(uid).get();
    if (document.exists) {
      return User(
        email: document.data()["email"] ?? "",
        name: document.data()["name"] ?? "",
        phoneNumber: document.data()["phoneNumber"] ?? "",
        city: document.data()["city"] ?? "",
        verify: document.data()["verify"] ?? "",
        profilecomplete: document.data()["profilecomplete"] ?? "",
        profilephoto: document.data()["profilephoto"] ?? "",
        drivinglicense: document.data()["drivinglicense"] ?? "",
        pancard: document.data()["pancard"] ?? "",
        vehicleinsurance: document.data()["vehicleinsurance"] ?? "",
        rc: document.data()["rc"] ?? "",
      );
    } else {
      return null;
    }
  }

  Stream<auth.User> get user {
    return _auth.authStateChanges();
  }

  auth.User getCurrentUser() {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        return user;
      }
      return null;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future registerWithEmailAndPassword({emailid, password}) async {
    try {
      final result = await _auth.createUserWithEmailAndPassword(
          email: emailid, password: password);
      return result;
    } catch (error) {
      throw error;
    }
  }

  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      final result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return result;
    } catch (error) {
      print(error.toString());
      throw error;
    }
  }

  Future resetPassword(String email) async {
    await _auth.sendPasswordResetEmail(email: email);
  }

  Future signOut() async {
    try {
      await _auth.signOut();
    } catch (error) {
      print(error.toString());
    }
  }

  Future deleteUser() async {
    try {
      await _auth.currentUser.delete();
    } catch (error) {
      print(error.toString());
    }
  }
}

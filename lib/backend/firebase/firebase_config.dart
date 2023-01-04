import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyB43R8CiABBjvpIlyEjaDi9HNU6ScwHhbk",
            authDomain: "universalfencingleague.firebaseapp.com",
            projectId: "universalfencingleague",
            storageBucket: "universalfencingleague.appspot.com",
            messagingSenderId: "421599457817",
            appId: "1:421599457817:web:1d194bc62bdc2a0c05f088",
            measurementId: "G-E13GCSSH3Q"));
  } else {
    await Firebase.initializeApp();
  }
}

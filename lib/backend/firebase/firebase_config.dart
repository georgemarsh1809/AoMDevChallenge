import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAWVD2TJDzcrmD7pm_BZFyeBgQSEMgH2nQ",
            authDomain: "a-o-m-founder-family-ap-vwer5u.firebaseapp.com",
            projectId: "a-o-m-founder-family-ap-vwer5u",
            storageBucket: "a-o-m-founder-family-ap-vwer5u.firebasestorage.app",
            messagingSenderId: "165483410935",
            appId: "1:165483410935:web:b9b8488a4b7bd50383eaf2"));
  } else {
    await Firebase.initializeApp();
  }
}

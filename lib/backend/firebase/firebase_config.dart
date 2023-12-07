import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAmjoiNE-c-8UAc72yZgaYiflItfNr9Dl4",
            authDomain: "todolistapp-6193a.firebaseapp.com",
            projectId: "todolistapp-6193a",
            storageBucket: "todolistapp-6193a.appspot.com",
            messagingSenderId: "701136788355",
            appId: "1:701136788355:web:4c3800e45f18fcb5a974b6",
            measurementId: "G-GXYB7WBYCB"));
  } else {
    await Firebase.initializeApp();
  }
}

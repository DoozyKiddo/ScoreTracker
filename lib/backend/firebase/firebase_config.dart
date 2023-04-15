import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAAWFEey9ATrdBX1N4Wk44XMJdrFFxraQ4",
            authDomain: "scoretracker-6851b.firebaseapp.com",
            projectId: "scoretracker-6851b",
            storageBucket: "scoretracker-6851b.appspot.com",
            messagingSenderId: "116814914366",
            appId: "1:116814914366:web:30579ddb7ebd438f9e826f",
            measurementId: "G-S1W83C001P"));
  } else {
    await Firebase.initializeApp();
  }
}

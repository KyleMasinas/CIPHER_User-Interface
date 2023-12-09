import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyD9btLwvGo7ZahRKx71QvXQTFbgFTp3Gs0",
            authDomain: "cipher-9f99c.firebaseapp.com",
            projectId: "cipher-9f99c",
            storageBucket: "cipher-9f99c.appspot.com",
            messagingSenderId: "656684473220",
            appId: "1:656684473220:web:b9b0d2de811345d7489bd1",
            measurementId: "G-ZRWDJ6NKEB"));
  } else {
    await Firebase.initializeApp();
  }
}

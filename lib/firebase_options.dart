
import 'dart:io' show Platform;

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) return web;
    if (Platform.isAndroid) return android;
    if (Platform.isIOS) return ios;
    if (Platform.isMacOS) return macos;
    if (Platform.isWindows) return windows;
    if (Platform.isLinux) return linux;
    throw UnsupportedError('DefaultFirebaseOptions are not supported here.');
  }


  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDhe_28N05RIDywm7xQBo33LcykzlCdLio',
    appId: '1:812197369200:android:60d120df3cdd352efc6bb5',
    messagingSenderId: '812197369200',
    projectId: 'ayyash-textile-shop',
  );


  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDUQN9gmDo2weFEaAxK3MMjEQntsU1xD60',
    appId: '1:812197369200:ios:23421a25475a2256fc6bb5',
    messagingSenderId: '812197369200',
    projectId: 'ayyash-textile-shop',
    iosClientId: '812197369200-vcj3cf2faqc2cohiu6kmrjhi1mql1eq2.apps.googleusercontent.com',
    iosBundleId: 'com.example.textileMobileApp',
  );

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCgh2C9IA-rSiXS6s8mTn_vD1xZTNQTl_Q',
    appId: '1:812197369200:web:f668a42f247f5dbafc6bb5',
    messagingSenderId: '812197369200',
    projectId: 'ayyash-textile-shop',
    authDomain: 'ayyash-textile-shop.firebaseapp.com',
    measurementId: 'G-1JX7QXSEWV',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDUQN9gmDo2weFEaAxK3MMjEQntsU1xD60',
    appId: '1:812197369200:ios:23421a25475a2256fc6bb5',
    messagingSenderId: '812197369200',
    projectId: 'ayyash-textile-shop',
    iosClientId: '812197369200-vcj3cf2faqc2cohiu6kmrjhi1mql1eq2.apps.googleusercontent.com',
    iosBundleId: 'com.example.textileMobileApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCgh2C9IA-rSiXS6s8mTn_vD1xZTNQTl_Q',
    appId: '1:812197369200:web:c743fe65fc78cab7fc6bb5',
    messagingSenderId: '812197369200',
    projectId: 'ayyash-textile-shop',
    authDomain: 'ayyash-textile-shop.firebaseapp.com',
    measurementId: 'G-01ZNF81D7P',
  );

  static const FirebaseOptions linux = FirebaseOptions(
    apiKey: 'REPLACE_ME',
    appId: 'REPLACE_ME',
    messagingSenderId: 'REPLACE_ME',
    projectId: 'REPLACE_ME',
  );
}

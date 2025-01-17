// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyA4YJtnWXSz4u2e1PLHxgGoM4xFdDwwoZQ',
    appId: '1:930712543597:web:7233b909c5d8c4f335ba64',
    messagingSenderId: '930712543597',
    projectId: 'fluttertests-fbb08',
    authDomain: 'fluttertests-fbb08.firebaseapp.com',
    databaseURL: 'https://fluttertests-fbb08-default-rtdb.firebaseio.com',
    storageBucket: 'fluttertests-fbb08.appspot.com',
    measurementId: 'G-8YHDJBD126',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB_RYmhdi_x8wI8UqCd16E30gdSyd13b4M',
    appId: '1:930712543597:android:2c983a59bcd4466035ba64',
    messagingSenderId: '930712543597',
    projectId: 'fluttertests-fbb08',
    databaseURL: 'https://fluttertests-fbb08-default-rtdb.firebaseio.com',
    storageBucket: 'fluttertests-fbb08.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCFqEOQ5RvEUIDGJSx1hsd_D9VNccbLpEA',
    appId: '1:930712543597:ios:1dc96a753126989d35ba64',
    messagingSenderId: '930712543597',
    projectId: 'fluttertests-fbb08',
    databaseURL: 'https://fluttertests-fbb08-default-rtdb.firebaseio.com',
    storageBucket: 'fluttertests-fbb08.appspot.com',
    androidClientId: '930712543597-i8mbkbl9974usqh788f5jngaib45in5i.apps.googleusercontent.com',
    iosClientId: '930712543597-q8nudnt49or4o76lt56rqaav5826a3bj.apps.googleusercontent.com',
    iosBundleId: 'com.ajay.grocerySellerApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCFqEOQ5RvEUIDGJSx1hsd_D9VNccbLpEA',
    appId: '1:930712543597:ios:1dc96a753126989d35ba64',
    messagingSenderId: '930712543597',
    projectId: 'fluttertests-fbb08',
    databaseURL: 'https://fluttertests-fbb08-default-rtdb.firebaseio.com',
    storageBucket: 'fluttertests-fbb08.appspot.com',
    androidClientId: '930712543597-i8mbkbl9974usqh788f5jngaib45in5i.apps.googleusercontent.com',
    iosClientId: '930712543597-q8nudnt49or4o76lt56rqaav5826a3bj.apps.googleusercontent.com',
    iosBundleId: 'com.ajay.grocerySellerApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAFWb5IfoOxBBsxIg-GY4YC3Ra1pe9sUCk',
    appId: '1:930712543597:web:c840a6ee9374dbca35ba64',
    messagingSenderId: '930712543597',
    projectId: 'fluttertests-fbb08',
    authDomain: 'fluttertests-fbb08.firebaseapp.com',
    databaseURL: 'https://fluttertests-fbb08-default-rtdb.firebaseio.com',
    storageBucket: 'fluttertests-fbb08.appspot.com',
    measurementId: 'G-MHTS39G9QJ',
  );
}

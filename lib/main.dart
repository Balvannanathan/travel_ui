import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:nimmy_app/App.dart';
import 'package:nimmy_app/Services/FirebaseAuthService/FirebaseAuthService.dart';
import 'package:nimmy_app/Services/FirebaseAuthService/IFirebaseAuthService.dart';
import 'package:nimmy_app/Services/PlatformLocalStorageService/IPlatformLocalStorageService.dart';
import 'package:nimmy_app/Services/PlatformLocalStorageService/PlatformLocalStorageService.dart';
import 'package:nimmy_app/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  GetIt.instance.registerSingleton<IPlatformLocalStorageService>(
    PlatformLocalStorageService(),
  );

  GetIt.instance.registerSingleton<IFirebaseAuthService>(FirebaseAuthService());

  runApp(const MyApp());
}

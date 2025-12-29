import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:nimmy_app/App.dart';
import 'package:nimmy_app/Services/PlatformLocalStorageService/IPlatformLocalStorageService.dart';
import 'package:nimmy_app/Services/PlatformLocalStorageService/PlatformLocalStorageService.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  GetIt.instance.registerSingleton<IPlatformLocalStorageService>(
    PlatformLocalStorageService(),
  );

  runApp(const MyApp());
}

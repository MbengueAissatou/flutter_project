import 'package:doctorpoint/app.dart';
import 'package:doctorpoint/injection_container.dart' as di;
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Firebase.initializeApp();
  await di.init();
  runApp(const DoctorPointApp());
}

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'app/data/local_storage/storage_helper.dart';
import 'my_app.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  await StorageHelper.initialize();
  runApp(MyApp());
}

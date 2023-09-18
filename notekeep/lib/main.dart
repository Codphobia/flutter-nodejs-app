import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notekeep/controllers/note_controller.dart';
import 'package:notekeep/pages/home_page.dart';

void main() {
  runApp(const MyApp());
  Get.put(NoteController());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Note Keep',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}

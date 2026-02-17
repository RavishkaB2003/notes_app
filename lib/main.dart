import 'package:flutter/material.dart';
import 'package:notes_app/models/notes_database.dart';
import 'package:notes_app/pages/notes_page.dart';

void main() async {

  //INITIALIZE-DATABASE
  WidgetsFlutterBinding.ensureInitialized();
  await NotesDatabase.initializa();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NotesPage(),
    );
  }
}

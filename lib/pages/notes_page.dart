import 'package:flutter/material.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({super.key});

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  //CRUD - Create, Read, Update, Delete

  //create
  void CreateNote() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(content: TextField()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[600],
        title: const Text(
          'Notes',
          style: TextStyle(
            fontSize: 24,
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontFamily: 'Roboto',
          ),
        ),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: CreateNote,
        backgroundColor: Colors.grey[600],
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}

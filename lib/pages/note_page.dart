import 'package:flutter/material.dart';
import 'package:pr6_corpsis/models/note.dart';

class NotePage extends StatelessWidget {
  final Note note;

  const NotePage({required this.note});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(note.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (note.photo_id.isNotEmpty) // Добавляем изображение заметки
              Image.asset(
                note.photo_id,
                fit: BoxFit.cover,
              ),
            SizedBox(height: 16.0),
            Text(note.description),
          ],
        ),
      ),
    );
  }
}

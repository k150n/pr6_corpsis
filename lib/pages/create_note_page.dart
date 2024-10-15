import 'package:flutter/material.dart';
import 'package:pr6_corpsis/models/note.dart';

class CreateNotePage extends StatefulWidget {
  final Function(Note) onCreate;

  const CreateNotePage({Key? key, required this.onCreate}) : super(key: key);

  @override
  _CreateNotePageState createState() => _CreateNotePageState();
}

class _CreateNotePageState extends State<CreateNotePage> {
  final TextEditingController _imageUrlController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _priceController = TextEditingController(); // Новый контроллер для цены

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Создать заметку'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: 'Заголовок'),
            ),
            TextField(
              controller: _descriptionController,
              decoration: const InputDecoration(labelText: 'Описание'),
            ),
            TextField(
              controller: _imageUrlController,
              decoration: const InputDecoration(labelText: 'URL изображения'),
            ),
            TextField(
              controller: _priceController,
              decoration: const InputDecoration(labelText: 'Цена'), // Поле для ввода цены
              keyboardType: TextInputType.number, // Числовая клавиатура для ввода цены
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final newNote = Note(
                  id: DateTime.now().millisecondsSinceEpoch, // Уникальный ID
                  photo_id: _imageUrlController.text, // Используем URL изображения
                  title: _titleController.text,
                  description: _descriptionController.text,
                  price: double.tryParse(_priceController.text) ?? 0.0, // Получаем цену, преобразуем в double
                );
                widget.onCreate(newNote);
                Navigator.pop(context);
              },
              child: const Text('Сохранить товар'),
            ),
          ],
        ),
      ),
    );
  }
}

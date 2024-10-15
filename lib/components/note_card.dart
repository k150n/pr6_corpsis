import 'package:flutter/material.dart';
import 'package:pr6_corpsis/models/note.dart';

class NoteCard extends StatelessWidget {
  final Note note;
  final Function(Note) onTap;
  final Function(Note) onToggleFavorite;
  final Function(Note) onAddToCart;

  const NoteCard({
    Key? key,
    required this.note,
    required this.onTap,
    required this.onToggleFavorite,
    required this.onAddToCart,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(note), // Передаем note
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(15)), // Закругляем верхние углы
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Отображаем изображение товара
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(15)), // Закругляем изображение
              child: Image.network(
                note.photo_id, // Используем photo_id для загрузки изображения
                fit: BoxFit.cover,
                height: 150, // Установите нужную высоту для изображения
                width: double.infinity, // Установите ширину в 100%
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                note.title,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                '${note.price} ₽', // Отображаем цену с символом ₽
                style: TextStyle(fontSize: 14, color: Colors.green),
              ),
            ),
            // Используем Row для иконок в одну строку
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: Icon(note.isFavorite ? Icons.favorite : Icons.favorite_border),
                  onPressed: () => onToggleFavorite(note), // Передаем note
                ),
                IconButton(
                  icon: Icon(Icons.add_shopping_cart),
                  onPressed: () => onAddToCart(note), // Передаем note
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

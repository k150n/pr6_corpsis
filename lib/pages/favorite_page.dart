import 'package:flutter/material.dart';
import 'package:pr6_corpsis/components/note_card.dart';
import 'package:pr6_corpsis/models/note.dart';

class FavoritePage extends StatelessWidget {
  final List<Note> favorites;
  final Function(Note) onOpenNote;
  final Function(Note) onRemoveFromFavorites;
  final Function(Note) onAddToCart; // Добавляем новый параметр

  const FavoritePage({
    Key? key,
    required this.favorites,
    required this.onOpenNote,
    required this.onRemoveFromFavorites,
    required this.onAddToCart, // Добавляем новый параметр
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: favorites.isEmpty
          ? const Center(child: Text('Нет избранных товаров'))
          : Padding(
        padding: const EdgeInsets.all(0.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.75,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
          ),
          itemCount: favorites.length,
          itemBuilder: (context, index) {
            final note = favorites[index];
            return NoteCard(
              note: note,
              onTap: (note) => onOpenNote(note), // Передаем note в onTap
              onToggleFavorite: (note) {
                onRemoveFromFavorites(note); // Передаем note в onToggleFavorite
              },
              onAddToCart: (note) => onAddToCart(note), // Передаем note в onAddToCart
            );
          },
        ),
      ),
    );
  }
}

import 'note.dart'; // Убедитесь, что импортируете модель Note

class CartItem {
  final Note note; // Ссылка на объект Note
  int quantity; // Поле для хранения количества товара

  CartItem({required this.note, this.quantity = 1}); // Инициализируем количество по умолчанию
}

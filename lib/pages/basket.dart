import 'package:flutter/material.dart';
import 'package:pr6_corpsis/models/cart_item.dart'; // Импортируйте модель CartItem
import 'package:pr6_corpsis/components/item_note.dart'; // Импортируйте ваш компонент для отображения заметки
import 'package:pr6_corpsis/components/cart_card.dart'; // Импортируйте компонент для карточки корзины

class CartPage extends StatefulWidget {
  final List<CartItem> cartItems; // Обновите тип списка на CartItem

  const CartPage({Key? key, required this.cartItems}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  void _removeItem(int index) {
    setState(() {
      widget.cartItems.removeAt(index); // Удаляем товар из корзины
    });
  }

  void _incrementItem(int index, bool add) {
    setState(() {
      if (add) {
        widget.cartItems[index].quantity++; // Увеличиваем количество
      } else {
        widget.cartItems[index].quantity--; // Уменьшаем количество
      }

      // Если количество товара равно нулю, удаляем его из корзины
      if (widget.cartItems[index].quantity <= 0) {
        widget.cartItems.removeAt(index);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Корзина'),
      ),
      body: widget.cartItems.isEmpty
          ? const Center(
        child: Text(
          "Попробуйте добавить товар в корзину",
          style: TextStyle(fontSize: 15),
          textAlign: TextAlign.center,
        ),
      )
          : Stack(
        children: [
          ListView.builder(
            itemCount: widget.cartItems.length,
            itemBuilder: (BuildContext context, int index) {
              return CartCard(
                cartItem: widget.cartItems[index], // Передаем cartItem
                itemIndex: index,
                removeItem: _removeItem,
                incrementItem: _incrementItem,
              );

            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: const EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                color: Theme.of(context).disabledColor,
              ),
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Суммарная стоимость корзины: ${widget.cartItems.fold(0.0, (sum, item) => sum + (item.note.price * item.quantity))} ₽',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final String fullName = "Гоман Кирилл Борисович";
  final String email = "kison_nosik@mail.ru";
  final String phone = "+7 (929) 576-37-44";
  final String photoUrl = "https://sun9-28.userapi.com/impg/i1NIToNrZCMhpaG4jqCrNeHWqJCr5PKM56nFjQ/g3DCnBzjoes.jpg?size=640x640&quality=95&sign=350c06e9fa7ddcb8acb9c7a6a794ab4e&type=album"; // Пример фото профиля

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Фото профиля
            CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage(photoUrl), // Загружаем фото профиля
            ),
            const SizedBox(height: 20),

            // ФИО
            Text(
              fullName,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),

            // Email
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.email),
                const SizedBox(width: 10),
                Text(email),
              ],
            ),
            const SizedBox(height: 10),

            // Телефон
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.phone),
                const SizedBox(width: 10),
                Text(phone),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class EmailMenu extends StatelessWidget {
  const EmailMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: const Color(0xFF2B1B12),
        child: SafeArea(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Gmail',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),

              _buildItem(Icons.inbox, 'Несортированные', '99+'),
              _buildItem(Icons.local_offer, 'Промоакции', '44'),
              _buildItem(Icons.people, 'Соцсети', '5'),
              _buildItem(Icons.info, 'Оповещения', '75'),

              const Divider(color: Colors.white30),

              _buildItem(Icons.star, 'Помеченные', ''),
              _buildItem(Icons.schedule, 'Отложенные', ''),
              _buildItem(Icons.label, 'Важные', '84'),
              _buildItem(Icons.shopping_bag, 'Покупки', '58'),
              _buildItem(Icons.send, 'Отправленные', ''),
              _buildItem(Icons.drafts, 'Черновики', '5'),
              _buildItem(Icons.mail, 'Вся почта', '99+'),
              _buildItem(Icons.report, 'Спам', '718'),
              _buildItem(Icons.delete, 'Корзина', ''),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildItem(IconData icon, String title, String count) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(
        title,
        style: const TextStyle(color: Colors.white),
      ),
      trailing: count.isNotEmpty
          ? Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.white24,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                count,
                style: const TextStyle(color: Colors.white),
              ),
            )
          : null,
      onTap: () {
        Navigator.pop(context); // закрывает меню
      },
    );
  }
}
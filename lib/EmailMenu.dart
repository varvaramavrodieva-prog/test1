import 'package:flutter/material.dart';

class EmailMenu extends StatelessWidget {
  const EmailMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: const Color(0xFF2B1B12),
        child: SafeArea(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: const Text(
                      'Gmail',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                  ),
                ),
              ),

              _buildItem(context, Icons.inbox, 'Несортированные', '99+'),
              _buildItem(context, Icons.local_offer, 'Промоакции', '44'),
              _buildItem(context, Icons.people, 'Соцсети', '5'),
              _buildItem(context, Icons.info, 'Оповещения', '75'),

              const Divider(color: Colors.white30),

              _buildItem(context, Icons.star, 'Помеченные', ''),
              _buildItem(context, Icons.schedule, 'Отложенные', ''),
              _buildItem(context, Icons.label, 'Важные', '84'),
              _buildItem(context, Icons.shopping_bag, 'Покупки', '58'),
              _buildItem(context, Icons.send, 'Отправленные', ''),
              _buildItem(context, Icons.drafts, 'Черновики', '5'),
              _buildItem(context, Icons.mail, 'Вся почта', '99+'),
              _buildItem(context, Icons.report, 'Спам', '718'),
              _buildItem(context, Icons.delete, 'Корзина', ''),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildItem(BuildContext context, IconData icon, String title, String count) {
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
        Navigator.pop(context);
      },
    );
  }
}
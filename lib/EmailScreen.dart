import 'package:flutter/material.dart';

class EmailScreen extends StatelessWidget {
  const EmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2C2420),
      appBar: AppBar(
        backgroundColor: const Color(0xFF2C2420),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFFD4A574)),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_outline, color: Color(0xFFD4A574)),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          // Заголовок
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'gitlab.com sign-in from new location',
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xFFE8D5C0),
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Container(
                      width: 44,
                      height: 44,
                      decoration: const BoxDecoration(
                        color: Color(0xFF6B7A8D),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.person, color: Colors.white),
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'GitLab',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFFE8D5C0),
                          ),
                        ),
                        Text(
                          'кому: мне',
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFF9B8577),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Divider(color: Color(0xFF3A2E28)),
          // Тело письма
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF1E1A17),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildInfoRow('Hostname', 'gitlab.com'),
                  _buildDivider(),
                  _buildInfoRow('User', 'Егор Чуриков (echurikov2001)'),
                  _buildDivider(),
                  _buildInfoRow('IP Address', '185.88.140.55'),
                  _buildDivider(),
                  _buildInfoRow('Location', 'Lelystad, Netherlands'),
                  _buildDivider(),
                  _buildInfoRow('Time', '2026-04-10 07:14:53 UTC'),
                ],
              ),
            ),
          ),
          // Кнопки
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.reply),
                    label: const Text('Ответить'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFD4A574),
                      foregroundColor: const Color(0xFF2C2420),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.forward),
                    label: const Text('Переслать'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFD4A574),
                      foregroundColor: const Color(0xFF2C2420),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 14,
                color: Color(0xFF9B8577),
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 14,
                color: Color(0xFFE8D5C0),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return Divider(color: const Color(0xFF3A2E28), height: 1);
  }
}
import 'package:flutter/material.dart';
import 'email_menu.dart'; //я вставила это// Раскомментируйте, когда экран будет готов
// import 'email_detail_screen.dart'; // Раскомментируйте, когда экран будет готов

// ==================== ТОЧКА ВХОДА ====================
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Email App',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF1E1B18),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF1E1B18),
          elevation: 0,
        ),
      ),
      home: const EmailListScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class EmailListScreen extends StatefulWidget {
  const EmailListScreen({Key? key}) : super(key: key);

  @override
  State<EmailListScreen> createState() => _EmailListScreenState();
}

class _EmailListScreenState extends State<EmailListScreen> {
  final List<Map<String, dynamic>> emails = [
    {
      'sender': 'GitLab',
      'subject': 'gitlab.com sign-in from new location',
      'preview': 'Someone signed in to your gitlab.com ac...',
      'time': '10:14',
      'isRead': false,
      'icon': Icons.account_circle,
    },
    {
      'sender': 'Оповещения',
      'subject': 'Оповещения о вакансиях Linked...',
      'preview': '',
      'time': '',
      'isRead': false,
      'icon': Icons.info_outline,
      'badge': '75 нов.',
    },
    {
      'sender': 'App Store Connect',
      'subject': 'The uploaded build for Diwo App has o...',
      'preview': 'Hello, We noticed one or more issues wit...',
      'time': '00:22',
      'isRead': false,
      'icon': Icons.apple,
    },
    {
      'sender': 'LinkedIn',
      'subject': 'Оповещение, связанное с безопасно...',
      'preview': 'Оповещение, связанное с безопасност...',
      'time': '9 апр.',
      'isRead': false,
      'icon': Icons.business,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const EmailMenu(), //я вставила это
      backgroundColor: const Color(0xFF1E1B18),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1E1B18),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.white),
          onPressed: () {
            // TODO: Раскомментировать, когда экран меню будет готов
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => const MenuScreen()),
            // он мне сказал это не надо );
            print('Открыть меню');
          },
        ),
        title: Container(
          height: 40,
          decoration: BoxDecoration(
            color: const Color(0xFF2D2925),
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Center(
            child: Text(
              'Поиск в почте',
              style: TextStyle(color: Colors.grey, fontSize: 16),
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: const CircleAvatar(
              backgroundColor: Color(0xFF2D2925),
              child: Icon(Icons.person, color: Colors.white, size: 20),
            ),
            onPressed: () {
              print('Профиль');
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Несортированные',
                style: TextStyle(color: Colors.grey[400], fontSize: 16),
              ),
            ),
          ),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: emails.length,
              separatorBuilder: (context, index) => const Divider(
                color: Color(0xFF2D2925),
                height: 1,
              ),
              itemBuilder: (context, index) {
                return _buildEmailTile(emails[index]);
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: const Color(0xFF8B6F4E),
        onPressed: () {
          print('Написать письмо');
        },
        icon: const Icon(Icons.edit),
        label: const Text('Написать'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF1E1B18),
        selectedItemColor: const Color(0xFF8B6F4E),
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Badge(
              label: Text('99+'),
              backgroundColor: Colors.red,
              child: Icon(Icons.email),
            ),
            label: 'Почта',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_call),
            label: 'Звонки',
          ),
        ],
      ),
    );
  }

  Widget _buildEmailTile(Map<String, dynamic> email) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 12),
      leading: CircleAvatar(
        backgroundColor: const Color(0xFF2D2925),
        child: Icon(email['icon'], color: Colors.white),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              email['sender'],
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Text(
            email['time'],
            style: TextStyle(color: Colors.grey[400], fontSize: 12),
          ),
        ],
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (email['badge'] != null)
            Container(
              margin: const EdgeInsets.only(top: 4),
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: const Color(0xFF8B6F4E),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                email['badge'],
                style: const TextStyle(color: Colors.white, fontSize: 12),
              ),
            ),
          Text(
            email['subject'],
            style: const TextStyle(color: Colors.white, fontSize: 14),
          ),
          if (email['preview'].isNotEmpty)
            Text(
              email['preview'],
              style: TextStyle(color: Colors.grey[500], fontSize: 12),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
        ],
      ),
      trailing: IconButton(
        icon: const Icon(Icons.star_border, color: Colors.grey),
        onPressed: () {
          print('В избранное: ${email['sender']}');
        },
      ),
      onTap: () {
        // TODO: Раскомментировать, когда экран письма будет готов
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => EmailDetailScreen(emailData: email),
        //   ),
        // );
        print('Открыть письмо: ${email['subject']}');
      },
    );
  }
}

// ==================== ЗАГЛУШКИ ДЛЯ ЭКРАНОВ КОЛЛЕГ ====================
// Удалите эти классы, когда подключите реальные файлы



class EmailDetailScreen extends StatelessWidget {
  final Map<String, dynamic> emailData;

  const EmailDetailScreen({Key? key, required this.emailData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(emailData['sender'] ?? 'Письмо')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              emailData['subject'] ?? '',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'От: ${emailData['sender']}',
              style: TextStyle(color: Colors.grey[400]),
            ),
            const SizedBox(height: 16),
            Text(
              emailData['preview'] ?? 'Содержимое письма...',
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
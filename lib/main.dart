import 'package:chat_app/firebase_options.dart';
import 'package:chat_app/page/chat_page.dart';
import 'package:chat_app/page/regester_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:chat_app/page/logain_pages.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ScholarChat());
}

class ScholarChat extends StatelessWidget {
  const ScholarChat({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        LoginPage.id: (context) => const LoginPage(),
        RegesterPage.id: (context) => const RegesterPage(),
        ChatPage.id: (context) => ChatPage(),
      },
      initialRoute: LoginPage.id,
      debugShowCheckedModeBanner: false,
      // home: const LoginPage(),
      home: ChatPage(),
    );
  }
}

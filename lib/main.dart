import 'package:agro/presentation/pages/sign_in_page.dart';
import 'package:agro/presentation/pages/test_page.dart';
import 'package:agro/presentation/theme/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final theme = AppTheme();
    return MaterialApp(
      title: 'Agro',
      theme: theme.light(),
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      home: const SignInPage(),
    );
  }
}

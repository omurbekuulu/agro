import 'package:agro/presentation/pages/sign_in_page.dart';
import 'package:agro/presentation/service_locator.dart';
import 'package:agro/presentation/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  setupServiceLocator();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp, // Только портретная ориентация
  ]).then((_) {
    runApp(const MyApp());
  });
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

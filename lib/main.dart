import 'package:agro/presentation/pages/splash/cubit/splash_cubit.dart';
import 'package:agro/presentation/pages/splash/splash_page.dart';
import 'package:agro/presentation/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/configs/theme/theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp, // Только портретная ориентация
  ]).then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme();
    return BlocProvider(
      create: (context) => SplashCubit()..appStart(),
      child: MaterialApp(
        title: 'Agro',
        theme: theme.light(),
        themeMode: ThemeMode.light,
        debugShowCheckedModeBanner: false,
        home: const SplashPage(),
      ),
    );
  }
}

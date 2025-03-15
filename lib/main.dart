import 'package:agro/presentation/agro.dart';
import 'package:agro/presentation/pages/splash/cubit/splash_cubit.dart';
import 'package:agro/presentation/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'core/configs/theme/theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp, // Только портретная ориентация
  ]).then((_) async {
  await initializeDateFormatting('ru_RU', null); 
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme();
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SplashCubit()..isConnected(),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(393, 852),
        minTextAdapt: true,
        splitScreenMode: true,
        child: MaterialApp(
          title: 'Agro',
          theme: theme.light(),
          themeMode: ThemeMode.light,
          debugShowCheckedModeBanner: false,
          home: const Agro(),
        ),
      ),
    );
  }
}

import 'package:agro/common/helper/navigation/app_navigator.dart';
import 'package:agro/presentation/pages/landing/landing_page.dart';
import 'package:agro/presentation/pages/auth/pages/sign_in_page.dart';
import 'package:agro/presentation/pages/splash/cubit/splash_cubit.dart';
import 'package:agro/presentation/pages/un_connected_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<SplashCubit, SplashState>(
        listener: (context, state) {
          if (state is DisplayUnConnected) {
            AppNavigator.pushReplacement(context, const UnConnectedPage());
          }
          if (state is UnAuthenticated) {
            AppNavigator.pushReplacement(context, const SignInPage());
          }
          if (state is Authenticated) {
            AppNavigator.pushReplacement(context, const LandingPage());
          }
        },
        child: Center(
          child: SvgPicture.asset('assets/logo.svg'),
        ),
      ),
    );
  }
}

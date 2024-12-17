import 'package:agro/presentation/pages/landing/landing_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:agro/common/helper/navigation/app_navigator.dart';
import 'package:agro/core/configs/theme/color_extantion.dart';
import 'package:agro/core/configs/theme/theme.dart';
import 'package:agro/data/auth/model/signin_req_params.dart';
import 'package:agro/domain/auth/usecase/signin.dart';
import 'package:agro/presentation/pages/auth/pages/sing_up_page.dart';
import 'package:agro/presentation/service_locator.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameCon = TextEditingController();
  final TextEditingController _passwordCon = TextEditingController();
  bool _isNull = false;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).appColors;
    final typography = Theme.of(context).appTypography;

    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/sign_in.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Card(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset('assets/logo.svg'),
                      const SizedBox(height: 24),
                      Text(
                        'Кош келиңиз!',
                        style:
                            typography.h0.bold.copyWith(color: colors.primary),
                      ),
                      const SizedBox(height: 24),
                      if (_isNull)
                        Column(
                          children: [
                            Text(
                              'Мындай аккаунт жок',
                              style: TextStyle(
                                color: Colors.deepOrange.shade900,
                              ),
                            ),
                            const SizedBox(height: 12),
                          ],
                        ),
                      TextFormField(
                        controller: _nameCon,
                        cursorColor: colors.onBackground2,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Аты жөнү',
                        ),
                        autovalidateMode: AutovalidateMode.onUnfocus,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Аты жөнү талап кылынат';
                          }
                          if (value.length < 3) {
                            return 'Aты жөнү кеминде 3 символ болушу керек';
                          }
                          if (value.length >= 20) {
                            return 'Aты жөнү 20 символдон көп болбошу керек';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _passwordCon,
                        autocorrect: false,
                        obscureText: true,
                        cursorColor: colors.onBackground2,
                        decoration: const InputDecoration(
                          hintText: 'Пароль',
                        ),
                        autovalidateMode: AutovalidateMode.onUnfocus,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Сыр сөз талап кылынат';
                          }
                          if (value.length < 4) {
                            return 'Пароль кеминде 4 символ болушу керек';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        width: double.infinity,
                        child: FilledButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              final response = await sl<SigninUseCase>().call(
                                params: SigninReqParams(
                                  username: _nameCon.text,
                                  password: _passwordCon.text,
                                ),
                              );
                              response.fold(
                                (error) {
                                  setState(() {
                                    _isNull = true;
                                  });
                                },
                                (data) {
                                  AppNavigator.pushAndRemove(
                                      context, const LandingPage());
                                },
                              );
                            }
                          },
                          child: const Text('Кирүү'),
                        ),
                      ),
                      const SizedBox(height: 24),
                      _signUpText(colors, context),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _signUpText(AppColorExtantion colors, BuildContext context) {
    return TextButton(
      onPressed: () {
        AppNavigator.pushAndRemove(context, const SignUpPage());
      },
      child: Text(
        'Жаңы катталуу',
        style: TextStyle(color: colors.onBackground2),
      ),
    );
  }
}

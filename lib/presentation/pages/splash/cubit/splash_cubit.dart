import 'package:agro/domain/auth/usecase/is_logged_in.dart';
import 'package:agro/presentation/service_locator.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(DisplaySplash());

  void appStart() async {
    await Future.delayed(const Duration(seconds: 2));
    final isLoggedIn = await sl<IsLoggedInUseCase>().call();

    isLoggedIn
        ? emit(
            Authenticated(),
          )
        : emit(
            UnAuthenticated(),
          );
  }
}

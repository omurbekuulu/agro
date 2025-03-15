import 'package:agro/domain/auth/usecase/is_logged_in.dart';
import 'package:agro/presentation/service_locator.dart';
import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:meta/meta.dart';
import 'dart:async';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;

  SplashCubit() : super(DisplaySplash()) {
    _connectivitySubscription =
        Connectivity().onConnectivityChanged.listen((connectivityResults) {
      final connectivityResult = connectivityResults.first;
      if (connectivityResult == ConnectivityResult.none) {
        emit(DisplayUnConnected());
      } else {
        appStart();
      }
    });
  }

  void isConnected() async {
    await Future.delayed(const Duration(seconds: 2));
    final connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      emit(
        DisplayUnConnected(),
      );
    } else {
      appStart();
    }
  }

  void appStart() async {
    final isLoggedIn = await sl<IsLoggedInUseCase>().call();
    isLoggedIn
        ? emit(
            Authenticated(),
          )
        : emit(
            UnAuthenticated(),
          );
  }

  @override
  Future<void> close() {
    _connectivitySubscription.cancel();
    return super.close();
  }
}

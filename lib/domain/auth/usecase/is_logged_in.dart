import 'package:agro/domain/auth/repository/auth.dart';
import 'package:agro/presentation/service_locator.dart';

class IsLoggedInUseCase {
  Future<bool> call() async {
    return await sl<AuthRepository>().isLoggedIn();
  }
}

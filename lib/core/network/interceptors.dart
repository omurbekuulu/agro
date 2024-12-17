import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/api_url.dart';

/// This interceptor is used to show request and response logs
class LoggerInterceptor extends Interceptor {
  Logger logger = Logger(
    printer: PrettyPrinter(methodCount: 0, colors: true, printEmojis: true),
  );

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final options = err.requestOptions;
    final requestPath = '${options.baseUrl}${options.path}';
    logger.e('${options.method} request ==> $requestPath'); //Error log
    logger.d('Error type: ${err.error} \n '
        'Error message: ${err.message}'); //Debug log
    handler.next(err); //Continue with the Error
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final requestPath = '${options.baseUrl}${options.path}';
    logger.i('${options.method} request ==> $requestPath'); //Info log
    handler.next(options); // continue with the Request
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    logger.d('STATUSCODE: ${response.statusCode} \n '
        'STATUSMESSAGE: ${response.statusMessage} \n'
        'HEADERS: ${response.headers} \n'
        'Data: ${response.data}'); // Debug log
    handler.next(response); // continue with the Response
  }
}

class AuthorizationInterceptor extends Interceptor {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    final token = sharedPreferences.getString('token');
    if (token != null && token.isNotEmpty) {
      options.headers['Authorization'] = "Bearer $token";
    }
    handler.next(options);
  }
}

class RefreshTokenInterceptor extends Interceptor {
  final Dio dio;

  RefreshTokenInterceptor(this.dio);

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401 &&
        err.response?.data['message'] == 'Invalid JWT') {
      final prefs = await SharedPreferences.getInstance();
      final refreshToken = prefs.getString('refreshToken');
      if (refreshToken != null && await _refreshToken(refreshToken, prefs)) {
        final newRequest = await _retry(err.requestOptions);
        return handler.resolve(newRequest);
      }
    }
    super.onError(err, handler); // Продолжить обработку
  }

  Future<bool> _refreshToken(String refreshToken, SharedPreferences prefs) async {
    try {
      final response = await dio.post('${ApiUrl.baseURL}/auth/refresh',
          data: {'refreshToken': refreshToken});
      if (response.statusCode == 201) {
        final accessToken = response.data['accessToken'];
        await prefs.setString('accessToken', accessToken);
        return true;
      }
    } catch (e) {
      await prefs.clear();
    }
    return false;
  }

  Future<Response> _retry(RequestOptions requestOptions) async {
    final options = Options(
      method: requestOptions.method,
      headers: requestOptions.headers,
    );
    return dio.request(
      requestOptions.path,
      data: requestOptions.data,
      queryParameters: requestOptions.queryParameters,
      options: options,
    );
  }
}

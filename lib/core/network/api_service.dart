// import 'package:dio/dio.dart';
// import 'package:localreview/app/constant/api_endpoint.dart';
// import 'package:localreview/core/network/dio_error_interceptor.dart';
// import 'package:pretty_dio_logger/pretty_dio_logger.dart';


// class ApiService {
//   final Dio _dio;

//   Dio get dio => _dio;

//   ApiService(this._dio) {
//     _dio
//       ..options.baseUrl = ApiEndpoints.baseUrl
//       ..options.connectTimeout = ApiEndpoints.connectionTimeout
//       ..options.receiveTimeout = ApiEndpoints.receiveTimeout
//       ..interceptors.add(DioErrorInterceptor())
//       ..interceptors.add(PrettyDioLogger(
//           requestHeader: true, requestBody: true, responseHeader: true))
//       ..options.headers = {
//         'Accept': 'application/json',
//         'Content-Type': 'application/json'
//       };
//   }
// }
import 'package:dio/dio.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:localreview/app/constant/api_endpoint.dart';
import 'package:localreview/core/network/dio_error_interceptor.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ApiService {
  final Dio _dio;
  final cookieJar = CookieJar();

  Dio get dio => _dio;

  ApiService(this._dio) {
    _dio
      ..options.baseUrl = ApiEndpoints.baseUrl
      ..options.connectTimeout = ApiEndpoints.connectionTimeout
      ..options.receiveTimeout = ApiEndpoints.receiveTimeout
      ..interceptors.add(DioErrorInterceptor())
      ..interceptors.add(PrettyDioLogger  (
          requestHeader: true, requestBody: true, responseHeader: true))
      ..options.headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json'
      }
      ..interceptors.add(CookieManager(cookieJar));  // Adds the Cookie Manager
  }
}

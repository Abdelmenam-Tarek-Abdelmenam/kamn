import 'package:dio/dio.dart';

const String _payMobKey =
    "ZXlKMGVYQWlPaUpLVjFRaUxDSmhiR2NpT2lKSVV6VXhNaUo5LmV5SnVZVzFsSWpvaWFXNXBkR2xoYkNJc0ltTnNZWE56SWpvaVRXVnlZMmhoYm5RaUxDSndjbTltYVd4bFgzQnJJam8yTWpNeE5EbDkubXRlQXhzNEpSME9zTVQtVkt3aFQ0VHNEZ2hWWk1WN2E3UVlrRF85ZGpqeVRyX0lUamZSMWRHemZObEhoSDhROTRGOVQtY01BbndfWGNEY0hoNk5rcXc=";

class PayMobRepository {
  static PayMobRepository? _instance;
  static PayMobRepository get instance => _instance ??= PayMobRepository();

  late Dio dio;

  void init() {
    dio = Dio(BaseOptions(
      baseUrl: 'https://accept.paymob.com/api/',
      headers: {
        'content-type': 'application/json',
      },
      receiveDataWhenStatusError: true,
    ));
  }

  Future<String> getToken(String price, String firstName, String lastName,
      String email, String phone) async {
    Map<String, dynamic> value =
        await _postData(url: 'auth/tokens', data: {'api_key': _payMobKey});
    return value['token'];
  }

  Future<String> registerOrder(String token, String price, String firstName,
      String lastName, String email, String phone) async {
    Map<String, dynamic> value =
        await _postData(url: 'ecommerce/orders', data: {
      'auth_token': token,
      'delivery_needed': 'false',
      "amount_cents": price,
      "currency": "EGP",
      "items": []
    });

    return value['id'];
  }

  Future<String> getPaymentToken(
      {required String token,
      required String orderId,
      required String integrationIdCard,
      required String price,
      required String firstName,
      required String lastName,
      required String email,
      required String phone}) async {
    Map<String, dynamic> value =
        await _postData(url: 'acceptance/payment_keys', data: {
      "auth_token": token,
      "amount_cents": price,
      "expiration": 3600,
      "order_id": orderId,
      "billing_data": {
        "apartment": "NA",
        "email": email,
        "floor": "NA",
        "first_name": firstName,
        "street": "NA",
        "building": "NA",
        "phone_number": phone,
        "shipping_method": "NA",
        "postal_code": "NA",
        "city": "NA",
        "country": "NA",
        "last_name": lastName,
        "state": "NA"
      },
      "currency": "EGP",
      "integration_id": integrationIdCard,
      "lock_order_when_paid": "false"
    });

    return value['token'].toString();
  }

  Future<dynamic> _postData(
      {required String url,
      Map<String, dynamic>? data,
      Map<String, dynamic>? query}) async {
    try {
      Response response =
          await dio.post(url, data: data, queryParameters: query);
      return response.data;
    } on DioError catch (e) {
      throw DioErrors.fromCode(e);
    } catch (e) {
      throw const DioErrors();
    }
  }
}

class DioErrors implements Exception {
  const DioErrors([
    this.message = 'An unknown exception occurred.',
  ]);

  factory DioErrors.fromCode(DioError error) {
    String message;
    switch (error.type) {
      case DioErrorType.connectTimeout:
        message = 'server not reachable';
        break;
      case DioErrorType.sendTimeout:
        message = 'send Time out';
        break;
      case DioErrorType.receiveTimeout:
        message = 'server not reachable';
        break;
      case DioErrorType.response:
        message = 'the server response, but with a incorrect status';
        break;
      case DioErrorType.cancel:
        message = 'request is cancelled';
        break;
      case DioErrorType.other:
        error.message.contains('SocketException')
            ? message = 'check your internet connection'
            : message = "Unknown error happened";
        break;
    }
    return DioErrors(message);
  }

  final String message;
}

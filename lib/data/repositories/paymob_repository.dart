import 'package:dio/dio.dart';

import '../dio_errors.dart';

// Authentication Request ==> requestAuth
// Order Registration API ==> registerOrder
// Payment Key Request    ==>  getPaymentKey

// define your payment channel
//  1- Card payment   ==> iFrame
//  2- Kiosk Payments ==> getKioskPaymentsCode
//  3- Mobile Wallets ==>

class PayMobRepository {
  static PayMobRepository? _instance;
  static PayMobRepository get instance => _instance ??= PayMobRepository();

  late Dio dio;

  void init() {
    dio = Dio(BaseOptions(
      baseUrl: PaymobConstants.baseUrl,
      headers: {
        'content-type': 'application/json',
      },
      receiveDataWhenStatusError: true,
    ));
  }

  Future<String> requestAuth(String price, String firstName, String lastName,
      String email, String phone) async {
    Map<String, dynamic> value = await _postData(
        url: PaymobConstants.getAuthToken,
        data: {'api_key': PaymobConstants.paymentApiKey});
    return value['token'];
  }

  Future<String> registerOrder(String authToken, String price) async {
    Map<String, dynamic> value =
        await _postData(url: PaymobConstants.getOrderId, data: {
      'auth_token': authToken,
      'delivery_needed': 'false',
      "amount_cents": price,
      "currency": "EGP",
      "items": []
    });

    return value['id'];
  }

  Future<String> getPaymentKey(
      {required String token,
      required String orderId,
      required String integrationIdCard,
      required String price,
      required String firstName,
      required String lastName,
      required String email,
      required String phone}) async {
    Map<String, dynamic> value =
        await _postData(url: PaymobConstants.getPaymentRequest, data: {
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

  Future<String> getKioskPaymentsCode(String paymentToken) async {
    Map<String, dynamic> value =
        await _postData(url: PaymobConstants.getRefCode, data: {
      'payment_token': paymentToken,
      "source": {"identifier": "AGGREGATOR", "subtype": "AGGREGATOR"},
    });

    return value['id'];
  }

  Future<String> mobileWalletsPayments(
      String paymentToken, String number) async {
    Map<String, dynamic> value =
        await _postData(url: PaymobConstants.getWalletsCode, data: {
      'payment_token': paymentToken,
      "source": {"identifier": number, "subtype": "WALLET"},
    });

    return value['redirect_url'];
  }

  Future<String> refundRequest(
      String paymentToken, String id, double price) async {
    Map<String, dynamic> value = await _postData(
        url: PaymobConstants.getRefundRequest,
        data: {
          "auth_token": paymentToken,
          "transaction_id": id,
          "amount_cents": price
        });

    return value['redirect_url'];
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

class PaymobConstants {
  static const String baseUrl = 'https://accept.paymob.com/api';
  static const paymentApiKey =
      "ZXlKMGVYQWlPaUpLVjFRaUxDSmhiR2NpT2lKSVV6VXhNaUo5LmV5SnVZVzFsSWpvaWFXNXBkR2xoYkNJc0ltTnNZWE56SWpvaVRXVnlZMmhoYm5RaUxDSndjbTltYVd4bFgzQnJJam8yTWpNeE5EbDkubXRlQXhzNEpSME9zTVQtVkt3aFQ0VHNEZ2hWWk1WN2E3UVlrRF85ZGpqeVRyX0lUamZSMWRHemZObEhoSDhROTRGOVQtY01BbndfWGNEY0hoNk5rcXc=";

  static const String getAuthToken = '/auth/tokens';
  static const getOrderId = '/ecommerce/orders';
  static const getPaymentRequest = '/acceptance/payment_keys';
  static const getRefundRequest = 'acceptance/void_refund/refund';
  static const getRefCode = '/acceptance/payments/pay';
  static const getWalletsCode = 'acceptance/payments/pay';

  static String cardPaymentIframe(String token) =>
      "https://accept.paymob.com/api/acceptance/iframes/699886?payment_token=$token";

  static const String integrationIdCard = 'ENTER_YOUR_INTEGRATION_ID';
  static const String integrationIdKiosk = 'ENTER_YOUR_INTEGRATION_ID';
}

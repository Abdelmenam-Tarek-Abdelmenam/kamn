import 'package:kamn/bloc/auth_bloc/auth_status_bloc.dart';

class CustomerMessage {
  String message;
  String phoneNumber;
  String name;

  CustomerMessage(
      {required this.message, required this.phoneNumber, required this.name});

  Map<String, dynamic> get toJson => {
        "message": message,
        "phoneNumber": phoneNumber,
        "name": name,
        "userId": AuthBloc.user.id
      };

  bool get check =>
      (message.isNotEmpty && phoneNumber.isNotEmpty && name.isNotEmpty);
}

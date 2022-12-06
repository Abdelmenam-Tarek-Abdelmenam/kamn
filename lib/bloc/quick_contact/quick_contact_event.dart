part of 'quick_contact_bloc.dart';

abstract class QuickContactEvent extends Equatable {
  const QuickContactEvent();
}

class SendMessageEvent extends QuickContactEvent {
  final CustomerMessage message;
  const SendMessageEvent(this.message);

  @override
  List<Object?> get props => [message.message, message.phoneNumber];
}

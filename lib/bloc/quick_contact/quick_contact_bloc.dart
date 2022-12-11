import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kamn/bloc/status.dart';
import 'package:kamn/data/data_sources/web_services/mongo_repository.dart';
import 'package:kamn/data/models/coustmer_message.dart';
import 'package:kamn/presentation/shared/toast_helper.dart';

import '../../domain_layer/repository_implementer/error_state.dart';

part 'quick_contact_event.dart';

class QuickContactBloc extends Bloc<QuickContactEvent, BlocStatus> {
  QuickContactBloc() : super(BlocStatus.idle) {
    on<SendMessageEvent>(_sendMessageHandler);
  }

  Future<void> _sendMessageHandler(SendMessageEvent event, Emitter emit) async {
    if (!event.message.check) {
      showToast("Data can't be empty");
      return;
    }
    emit(BlocStatus.gettingData);

    try {
      await MongoDatabase.instance.sendMessage(event.message.toJson);
      emit(BlocStatus.getData);
    } catch (err) {
      if (err is Failure) {
        showToast(err.message);
      } else {
        showToast("Error Happened while sending the message");
      }
      emit(BlocStatus.error);
    }
  }
}

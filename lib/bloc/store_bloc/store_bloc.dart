import 'package:bloc/bloc.dart';
import 'package:either_dart/either.dart';
import 'package:equatable/equatable.dart';
import 'package:kamn/bloc/status.dart';

import '../../data/models/product.dart';
import '../../data/models/show_data.dart';
import '../../data/repository_implementer/error_state.dart';
import '../../data/repository_implementer/store_repo.dart';

part 'store_event.dart';
part 'store_state.dart';

class StoreBloc extends Bloc<StoreEvent, StoreState> {
  StoreBloc() : super(StoreState.initial()) {
    on<GetStoreEvent>(_getDataHandler);
    on<GetMoreStoreEvent>(_getMoreDataHandler);
    add(GetStoreEvent());
  }
  final StoreRepository _repository = StoreRepository();

  Future<void> _getDataHandler(GetStoreEvent _, Emitter emit) async {
    emit(state.copyWith(status: BlocStatus.gettingData));
    Either<Failure, AllStore> all =
        await _repository.getAllStore(state.products.end);
    all.fold(
        (_) => emit(state.copyWith(status: BlocStatus.error)),
        (data) => emit(state.copyWith(
            status: BlocStatus.getData,
            products: data.products,
            offers: data.offers)));
  }

  Future<void> _getMoreDataHandler(GetMoreStoreEvent _, Emitter emit) async {
    if (state.products.isEnd) return;
    if (state.status == BlocStatus.gettingData) return;

    emit(state.copyWith(status: BlocStatus.idle));
    Either<Failure, ShowData<Product>> all =
        await _repository.getMoreStore(state.products);
    all.fold(
        (err) => err.show,
        (data) => emit(state.copyWith(
              status: BlocStatus.getData,
              products: data,
            )));
  }
}

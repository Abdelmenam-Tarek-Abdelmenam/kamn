part of 'store_bloc.dart';

class StoreState extends Equatable {
  final ShowData<Product> products;
  final List<OfferItem> offers;
  final BlocStatus status;

  const StoreState(
      {required this.products, required this.offers, required this.status});

  factory StoreState.initial() => StoreState(
      products: ShowData.empty(), offers: const [], status: BlocStatus.idle);

  StoreState copyWith(
          {ShowData<Product>? products,
          List<OfferItem>? offers,
          BlocStatus? status}) =>
      StoreState(
        status: status ?? this.status,
        products: products ?? this.products,
        offers: offers ?? this.offers,
      );

  @override
  List<Object?> get props => [products.data.length, offers.length, status];
}

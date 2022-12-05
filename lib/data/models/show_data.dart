// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

class ShowData<T> extends Equatable {
  List<T> data;
  int end = 20;

  ShowData({
    required this.data,
  });

  void addData(T newData) {
    data.insert(0, newData);
  }

  factory ShowData.empty() => ShowData(data: const []);

  bool get isEmpty => data.isEmpty;
  bool get isEnd => end > data.length;
  int get start => data.length;

  void getNext() {
    end = data.length + 20;
  }

  @override
  List<Object?> get props => [data.length];
}

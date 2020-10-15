import 'package:flutter_bloc/flutter_bloc.dart';


class CounterCubit extends Cubit<int> {   /// [extends Cubit<int> -> Cubit使うよ、状態管理情報はint]

  CounterCubit() : super(0);   /// [Cubitは初期化必須]

  void increment() => emit(state + 1);   /// [emitでstateを変化させる]
  void reset() => emit(0);   /// [emitでstateを変化させる]
  void decrement() => emit(state - 1);   /// [emitでstateを変化させる]

}

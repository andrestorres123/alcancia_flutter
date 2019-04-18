import 'package:alcancia_flutter/domain/blocs/base/disposable_streams.dart';

abstract class BaseBloc {
  final disposables = DisposablesStreams();
  void onDispose() {
    disposables.dispose();
  }
}

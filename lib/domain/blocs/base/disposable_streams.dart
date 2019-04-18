import 'dart:async';

class DisposablesStreams {
  List<StreamSubscription> _disposables = List();

  void add(StreamSubscription disposable) {
    _disposables.add(disposable);
  }

  void dispose() {
    _disposables.forEach((d) => d.cancel());
  }
}

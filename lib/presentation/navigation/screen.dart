import 'package:flutter/material.dart';

class Screen {
  final Widget _screen;
  final String _screenName;
  final bool isModal;
  final bool replace;

  Screen(this._screen, this._screenName,
      {this.isModal = false, this.replace = false})
      : assert(_screen != null);

  Widget get get => _screen;

  Future<T> show<T>(BuildContext context) {
    final settings = RouteSettings(name: _screenName);
    final navigator = Navigator.of(context);

    return replace
        ? navigator.pushReplacement(MaterialPageRoute(
            fullscreenDialog: isModal,
            settings: settings,
            builder: (context) => _screen))
        : navigator.push(MaterialPageRoute(
            fullscreenDialog: isModal,
            settings: settings,
            builder: (context) => _screen));
  }
}

import 'package:alcancia_flutter/domain/blocs/base/base_bloc.dart';
import 'package:flutter/widgets.dart';

Type _getType<B>() => B;

class Provider<B> extends InheritedWidget {
  final B bloc;

  Provider({Key key, this.bloc, Widget child}) : super(key: key, child: child);

  @override
  bool updateShouldNotify(Provider<B> oldWidget) {
    return bloc != oldWidget.bloc;
  }

  static B of<B extends BaseBloc>(BuildContext context) {
    final type = _getType<Provider<B>>();
    final Provider<B> provider = (context.inheritFromWidgetOfExactType(type));
    return provider.bloc;
  }
}

class BlocProvider<B> extends StatefulWidget {
  final Function(BuildContext context) blocBuilder;
  final Function(BuildContext context, B bloc) onDispose;
  final Widget child;

  BlocProvider(
      {Key key,
      @required this.blocBuilder,
      @required this.onDispose,
      @required this.child})
      : assert(child != null),
        assert(blocBuilder != null),
        super(key: key);

  @override
  State<StatefulWidget> createState() => _BlocProviderState<B>();
}

class _BlocProviderState<B> extends State<BlocProvider<B>> {
  B bloc;

  @override
  Widget build(BuildContext context) {
    return Provider<B>(
      bloc: bloc,
      child: widget.child,
    );
  }

  @override
  void initState() {
    super.initState();
    _createBloc();
  }

  @override
  void dispose() {
    widget.onDispose(context, bloc);
    super.dispose();
  }

  void _createBloc() {
    bloc = widget.blocBuilder(context);
  }
}

import 'package:alcancia_flutter/domain/blocs/bloc_provider.dart';
import 'package:alcancia_flutter/domain/blocs/user_bloc.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';

void configureDomainModule(Injector injector) {
  _setupBlocs(injector);
}

void configureTestDomainModule(Injector injector) {
  _setupBlocs(injector);
}

void _setupBlocs(Injector injector) {
  injector.mapWithParams<UserBloc>((i, params) => UserBloc());
}

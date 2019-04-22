import 'package:alcancia_flutter/di/domain_module.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';

void configureDI() {
  final injector = Injector.getInjector();
  configureDomainModule(injector);
}

void configureTestDI() {
  final injector = Injector.getInjector();
  configureTestDomainModule(injector);
}

Injector get injector => Injector.getInjector();

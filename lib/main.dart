import 'package:alcancia_flutter/domain/blocs/bloc_provider.dart';
import 'package:alcancia_flutter/domain/blocs/user_bloc.dart';
import 'package:alcancia_flutter/presentation/sections/login/login_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserBloc>(
      blocBuilder: (context) => UserBloc(),
      onDispose: (context, bloc) => bloc.onDispose(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(primarySwatch: Colors.lightGreen),
        home: LoginPage(),
      ),
    );
  }
}

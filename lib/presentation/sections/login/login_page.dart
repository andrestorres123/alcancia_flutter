import 'package:alcancia_flutter/di/di_config.dart';
import 'package:alcancia_flutter/domain/blocs/bloc_provider.dart';
import 'package:alcancia_flutter/domain/blocs/user_bloc.dart';
import 'package:alcancia_flutter/presentation/navigation/wireframe.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  UserBloc userBloc;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    userBloc =
        injector.get<UserBloc>(additionalParameters: {'context': context});

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(
          'LOGIN',
        ),
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    SizedBox(
                      child: Placeholder(),
                      height: 150,
                      width: 150,
                    ),
                    SizedBox(
                      height: 48,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: TextFormField(
                        key: Key('emailKey'),
                        keyboardType: TextInputType.emailAddress,
                        controller: _emailController,
                        decoration: InputDecoration(labelText: 'Email'),
                        validator: _validateEmail,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: TextFormField(
                        key: Key('passwordKey'),
                        validator: _validatePassword,
                        controller: _passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                            labelText: 'Password',
                            suffix: GestureDetector(
                              child: Text(
                                'Forgot password?',
                                style: TextStyle(color: Colors.lightGreen),
                              ),
                              onTap: () {
                                print('Forgot Password!');
                              },
                            )),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Builder(
                      builder: (context) => RaisedButton(
                            key: Key('loginBtn'),
                            child: Text(
                              'LOG IN',
                              style: TextStyle(color: Colors.white),
                            ),
                            color: Colors.lightBlue,
                            onPressed: () => _attemptLogin(
                                context,
                                _emailController.text,
                                _passwordController.text),
                          ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Don't have an account?"),
                        SizedBox(
                          width: 8,
                        ),
                        GestureDetector(
                          onTap: () {
                            print('Sign in');
                          },
                          child: Text(
                            'Sign In',
                            style: TextStyle(color: Colors.lightGreen),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _attemptLogin(
      BuildContext context, String email, String password) async {
    if (!_formKey.currentState.validate()) {
      return;
    }

    try {
      await userBloc.attemptLogIn(email, password);
      var wireframe = Wireframe();
      wireframe.checklistPage().show(context);
    } on PlatformException catch (err) {
      _scaffoldKey.currentState
          .showSnackBar(SnackBar(content: Text(err.message)));
    }
  }

  String _validateEmail(String value) =>
      value.isEmpty ? "Email can't be empty" : null;

  String _validatePassword(String value) =>
      value.isEmpty ? "Password can't be empty" : null;
}

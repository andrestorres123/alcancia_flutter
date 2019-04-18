import 'package:alcancia_flutter/domain/blocs/bloc_provider.dart';
import 'package:alcancia_flutter/domain/blocs/user_bloc.dart';
import 'package:alcancia_flutter/presentation/navigation/wireframe.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginPage extends StatelessWidget {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  UserBloc userBloc;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    userBloc = Provider.of<UserBloc>(context);

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(
          'LOGIN',
        ),
      ),
      body: SafeArea(
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
                    child: TextField(
                      keyboardType: TextInputType.emailAddress,
                      controller: _emailController,
                      decoration: InputDecoration(labelText: 'Email'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextField(
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
                          child: Text(
                            'LOG IN',
                            style: TextStyle(color: Colors.white),
                          ),
                          color: Colors.lightBlue,
                          onPressed: () => _attemptLogin(context,
                              _emailController.text, _passwordController.text),
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
    );
  }

  void _attemptLogin(
      BuildContext context, String email, String password) async {
    try {
      await userBloc.attemptLogIn(email, password);
      var wireframe = Wireframe();
      wireframe.checklistPage().show(context);
    } on PlatformException catch (err) {
      _scaffoldKey.currentState
          .showSnackBar(SnackBar(content: Text(err.message)));
    }
  }
}

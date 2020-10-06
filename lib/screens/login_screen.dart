import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:humseafood/provider/modal_hud.dart';
import 'package:humseafood/screens/admin/admin_screen.dart';
import 'package:humseafood/screens/user/home_screen.dart';
import 'package:humseafood/services/auth.dart';
import 'package:humseafood/widgets/authentication_widgets/admin_button.dart';
import 'package:humseafood/widgets/authentication_widgets/authentication_button.dart';
import 'package:humseafood/widgets/authentication_widgets/custom_divider.dart';
import 'package:humseafood/widgets/authentication_widgets/custom_logo.dart';
import 'package:humseafood/widgets/authentication_widgets/navigator_toSignup.dart';
import 'package:humseafood/widgets/authentication_widgets/google_authButton.dart';
import 'package:humseafood/widgets/custom_snackBar.dart';
import 'package:humseafood/widgets/authentication_widgets/custom_textField.dart';
import 'package:provider/provider.dart';
import 'signUp_screen.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class LoginScreen extends StatefulWidget {
  static String id = 'LoginScreen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  String _email;
  String _password;
  final Auth _auth = Auth();
  final String _adminPassword = '123456789';
  bool checkBoxValue = false;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: height,
        width: width,
        child: ModalProgressHUD(
          inAsyncCall: Provider.of<ModalHud>(context).loading,
          child: SingleChildScrollView(
            child: Form(
              key: _globalKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: height * 0.08),
                  customLogo(),
                  CustomTextField(
                    label: 'Email',
                    icon: Icons.email,
                    saveValue: (String value) {
                      _email = value;
                    },
                  ),
                  SizedBox(height: 20.0),
                  CustomTextField(
                    label: 'Password',
                    icon: Icons.lock,
                    saveValue: (String value) {
                      _password = value;
                    },
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      AdminButton(checkBoxValue, (bool value) {
                        setState(() {
                          checkBoxValue = value;
                        });
                      }),
                      Builder(
                        builder: (context) => authenticationButton(
                            width, 50.0, 'Login', () async {
                          _validate(context);
                        }),
                      ),
                    ],
                  ),
                  customDivider(),
                  GoogleAuthButton(),
                  SizedBox(height: 15.0),
                  navigatorToSignUp(context, 'Don\'t have an account?...',
                      'Register', SignUpScreen.id),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _validate(BuildContext context) async {
    final ModalHud modalHud = Provider.of<ModalHud>(context, listen: false);
    modalHud.loadChanging(true);
    if (_globalKey.currentState.validate()) {
      _globalKey.currentState.save();
      if (checkBoxValue == true) {
        if (_password == _adminPassword) {
          try {
            AuthResult _loginResult = await _auth.signIn(_email.trim(), _password.trim());
            modalHud.loadChanging(false);
            Navigator.pushReplacementNamed(context, AdminPanel.id);
          } on PlatformException catch (exception) {
            modalHud.loadChanging(false);
            Scaffold.of(context).showSnackBar(
              customSnackBar(exception.message),
            );
          }
        } else {
          modalHud.loadChanging(false);
          Scaffold.of(context).showSnackBar(
            customSnackBar('Something went wrong !'),
          );
        }
      } else {
        try {
          AuthResult _loginResult = await _auth.signIn(_email, _password);
          modalHud.loadChanging(false);
          Navigator.pushReplacementNamed(context, HomeScreen.id);
        } on PlatformException catch (exception) {
          modalHud.loadChanging(false);
          Scaffold.of(context).showSnackBar(
            customSnackBar(exception.message),
          );
        }
      }
    }
    modalHud.loadChanging(false);
  }
}

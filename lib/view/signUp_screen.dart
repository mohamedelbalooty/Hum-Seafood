import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:humseafood/controller/auth_controller.dart';
import 'package:humseafood/provider/modal_hud.dart';
import 'package:humseafood/widgets/authentication_widgets/authentication_button.dart';
import 'package:humseafood/widgets/authentication_widgets/custom_divider.dart';
import 'package:humseafood/widgets/authentication_widgets/custom_logo.dart';
import 'package:humseafood/widgets/authentication_widgets/navigator_toSignup.dart';
import 'package:humseafood/widgets/authentication_widgets/google_authButton.dart';
import 'package:humseafood/widgets/custom_snackBar.dart';
import 'package:humseafood/widgets/authentication_widgets/custom_textField.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';

import 'login_screen.dart';

class SignUpScreen extends StatelessWidget {
  static String id = 'SignUpScreen';
  String _email;
  String _password;
  GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  Auth _auth = Auth();

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
                  SizedBox(height: height * 0.04),
                  customLogo(),
                  CustomTextField(
                    label: 'Name',
                    icon: Icons.person,
                    saveValue: (String value) {
                      _email = value;
                    },
                  ),
                  SizedBox(height: 10.0),
                  CustomTextField(
                    label: 'Email',
                    icon: Icons.email,
                    saveValue: (String value) {
                      _email = value;
                    },
                  ),
                  SizedBox(height: 10.0),
                  CustomTextField(
                    label: 'Password',
                    icon: Icons.lock,
                    saveValue: (String value) {
                      _password = value;
                    },
                  ),
                  Builder(
                    builder: (context) => authenticationButton(
                      width,
                      45.0,
                      'Sign up',
                      () async {
                        final modalHud =
                            Provider.of<ModalHud>(context, listen: false);
                        modalHud.loadChanging(true);
                        if (_globalKey.currentState.validate()) {
                          try {
                            _globalKey.currentState.save();
                            AuthResult _signUpResult = await _auth.signUp(
                                _email.trim(), _password.trim());
                            modalHud.loadChanging(false);
                          } on PlatformException catch (exception) {
                            modalHud.loadChanging(false);
                            Scaffold.of(context).showSnackBar(
                              customSnackBar(exception.message),
                            );
                          }
                        }
                        modalHud.loadChanging(false);
                      },
                    ),
                  ),
                  customDivider(),
                  GoogleAuthButton(),
                  navigatorToSignUp(context, 'Already have an account?...',
                      'Login', LoginScreen.id),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

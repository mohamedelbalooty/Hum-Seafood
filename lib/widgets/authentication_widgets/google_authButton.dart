import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:humseafood/screens/user/home_screen.dart';
import 'package:humseafood/services/auth.dart';
import '../../constants.dart';
import '../custom_snackBar.dart';

class GoogleAuthButton extends StatefulWidget {
  @override
  _GoogleAuthButtonState createState() => _GoogleAuthButtonState();
}

class _GoogleAuthButtonState extends State<GoogleAuthButton> {
  final Auth _auth = Auth();
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Builder(
          builder: (context) => loading
              ? Container(
                  height: 50.0,
                  width: width - 50.0,
                  margin:
                      EdgeInsets.symmetric(vertical: 20.0, horizontal: 25.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    color: Colors.redAccent.withOpacity(0.7),
                  ),
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              : _customSocialButton(width),
        ),
      ],
    );
  }
  Widget _customSocialButton(double width) {
    return GestureDetector(
      onTap: () async {
        setState(() {
          loading = true;
        });
        try {
          await _auth.signInWithGoogle();
        } on PlatformException catch (exception) {
          Scaffold.of(context).showSnackBar(
            customSnackBar(exception.message),
          );
        }
        setState(() {
          loading = false;
        });
        Navigator.pushReplacementNamed(context, HomeScreen.id);
      },
      child: Container(
        height: 45.0,
        width: width - 50.0,
        margin: EdgeInsets.symmetric(vertical: 20.0, horizontal: 25.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          color: Colors.red,
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 30.0,
                width: 30.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: ExactAssetImage('assets/images/icons/google.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 4.0, left: 4.0),
                child: Text(
                  'Google',
                  style: TextStyle(
                    color: KWhiteColor,
                    fontSize: 19.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

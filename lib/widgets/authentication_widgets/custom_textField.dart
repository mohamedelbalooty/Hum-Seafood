import 'package:flutter/material.dart';
import '../../constants.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final IconData icon;
  final Function saveValue;

  CustomTextField(
      {@required this.label, @required this.icon, @required this.saveValue});

  final Color _textFieldColor = Colors.deepOrange;

  String _errorMessage(String value) {
    switch (label) {
      case 'Name':
        return 'Enter your name';
        break;
      case 'Email':
        return 'Enter your email';
        break;
      case 'Password':
        return 'Enter your password';
        break;
      default:
        return 'Enter your value';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.0),
      child: TextFormField(
        // ignore: missing_return
        validator: (value) {
          if (value.isEmpty) {
            return _errorMessage(label);
          }
        },
        onSaved: saveValue,
        obscureText: label == 'Password' ? true : false,
        cursorColor: KSecondColor,
        style: TextStyle(color: Colors.black54, fontWeight: FontWeight.w500),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 13.0),
          labelText: label,
          labelStyle: TextStyle(fontSize: 18.0),
          prefixIcon: Icon(icon, color: _textFieldColor),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide(
              color: _textFieldColor,
              width: 1.5,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide(
              color: _textFieldColor,
              width: 1.5,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide(
              color: _textFieldColor,
              width: 1.5,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide(
              color: _textFieldColor,
              width: 1.5,
            ),
          ),
        ),
      ),
    );
  }
}

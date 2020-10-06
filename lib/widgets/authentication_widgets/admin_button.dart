import 'package:flutter/material.dart';

class AdminButton extends StatelessWidget {

  bool checkBoxValue;
  Function checkBoxChange;
  AdminButton(this.checkBoxValue, this.checkBoxChange);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(left: 11.0),
        height: 72.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Checkbox(
              value: checkBoxValue,
              onChanged: checkBoxChange,
            ),
            Padding(
              padding: EdgeInsets.only(left: 15.0),
              child: Text(
                'I\'m an admin',
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 14.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

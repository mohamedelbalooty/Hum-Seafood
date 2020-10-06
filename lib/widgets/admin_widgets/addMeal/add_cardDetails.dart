import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:humseafood/constants.dart';

class AddCardDetails extends StatelessWidget {
  final String image;
  final String label;
  final Function onClick;

  AddCardDetails(this.image, this.label, this.onClick);

  // ignore: missing_return
  String _errorMessage(String value) {
    switch (label) {
      case 'Name':
        return 'Enter name';
        break;
      case 'Price':
        return 'Enter price';
        break;
      case 'Category':
        return 'Enter category';
        break;
      case 'Description':
        return 'Enter description';
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      height: isPortrait ? height * 0.25 : height * 0.5,
      width: isPortrait ? (width * 0.5) - 30.0 : (width * 0.5) - 30.0,
      margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      decoration: BoxDecoration(
        color: KWhiteColor,
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(
          color: Colors.blueGrey,
          width: 1.0,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: Image.asset(
              image,
              height: 80.0,
              width: 80.0,
            ),
          ),
          Container(
            height: 55.0,
            margin: EdgeInsets.all(5.0),
            child: TextFormField(
              // ignore: missing_return
              validator: (value) {
                if (value.isEmpty) {
                  return _errorMessage(label);
                }
              },
              onSaved: onClick,
              keyboardType:
                  label == 'Price' ? TextInputType.number : TextInputType.text,
              cursorColor: Colors.blueGrey,
              style:
                  TextStyle(color: Colors.black54, fontWeight: FontWeight.w500, height: 1.0,),
              decoration: InputDecoration(
                labelText: label,
                labelStyle: TextStyle(
                  color: KGreyColor,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  borderSide: BorderSide(
                    color: Colors.blueGrey,
                    width: 1.0,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  borderSide: BorderSide(
                    color: Colors.blueGrey,
                    width: 1.5,
                  ),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  borderSide: BorderSide(
                    color: Colors.blueGrey,
                    width: 1.5,
                  ),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  borderSide: BorderSide(
                    color: Colors.blueGrey,
                    width: 1.5,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

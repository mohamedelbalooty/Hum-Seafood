import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:humseafood/constants.dart';

class AddImageButton extends StatelessWidget {
  Function pickImageFromCam;
  Function pickImageFromGallery;

  AddImageButton(
      {@required this.pickImageFromCam, @required this.pickImageFromGallery});

  @override
  Widget build(BuildContext context) {
    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      height: isPortrait ? height * 0.18 : height * 0.4,
      width: width,
      margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
      decoration: BoxDecoration(
        color: KWhiteColor,
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(color: Colors.blueGrey, width: 1.0),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _typeImageButton('camera', pickImageFromCam),
          _divider(height, isPortrait),
          _typeImageButton('gallery', pickImageFromGallery),
        ],
      ),
    );
  }

  Widget _typeImageButton(String imageName, Function pickImage) {
    return Expanded(
      child: GestureDetector(
        onTap: pickImage,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'assets/images/icons/$imageName.png',
              ),
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }

  Widget _divider(double height, bool isPortrait) {
    return Container(
      height: isPortrait ? height * 0.18 : height * 0.4,
      width: 1.5,
      margin: EdgeInsets.symmetric(vertical: 10.0),
      color: Colors.blueGrey,
    );
  }
}

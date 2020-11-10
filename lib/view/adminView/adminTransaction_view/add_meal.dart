import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:humseafood/controller/store_controller.dart';
import 'package:humseafood/provider/modal_hud.dart';
import 'package:humseafood/widgets/adminView_widgets/addMeal/add_cardDetails.dart';
import 'package:humseafood/widgets/adminView_widgets/addMeal/add_imageButton.dart';
import 'package:humseafood/widgets/adminView_widgets/addMeal/add_mealBackground.dart';
import 'package:humseafood/widgets/adminView_widgets/addMeal/add_mealButton.dart';
import 'package:humseafood/widgets/adminView_widgets/transaction_mealAppBar.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'dart:io';
import 'package:path/path.dart' as path;
import 'package:humseafood/model/meal.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:humseafood/widgets/custom_snackBar.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class AddMeal extends StatefulWidget {
  static String id = 'AddMeal';

  @override
  _AddMealState createState() => _AddMealState();
}

class _AddMealState extends State<AddMeal> {
  GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  Store _store = Store();
  String _name;
  String _price;
  String _category;
  String _description;
  String _url;
  File _imageFile;

  @override
  Widget build(BuildContext context) {
    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: Provider.of<ModalHud>(context).loading,
        child: SingleChildScrollView(
          child: Stack(
            children: <Widget>[
              addMealBackground(height, width, isPortrait),
              Form(
                key: _globalKey,
                child: Builder(
                  builder: (context) => Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      transactionMealAppBar(
                          context, 'Add Meal', height, isPortrait),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          AddCardDetails(
                            'assets/images/icons/name.png',
                            'Name',
                            (value) {
                              _name = value;
                            },
                          ),
                          AddCardDetails(
                            'assets/images/icons/price.png',
                            'Price',
                            (value) {
                              _price = value;
                            },
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          AddCardDetails(
                            'assets/images/icons/category.png',
                            'Category',
                            (value) {
                              _category = value;
                            },
                          ),
                          AddCardDetails(
                            'assets/images/icons/description.png',
                            'Description',
                            (value) {
                              _description = value;
                            },
                          ),
                        ],
                      ),
                      AddImageButton(
                        pickImageFromCam: pickImageFromCam,
                        pickImageFromGallery: pickImageFromGallery,
                      ),
                      GestureDetector(
                        onTap: () async {
                          _validate(context);
                        },
                        child: addMealButton(height, width, isPortrait, 'Add'),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _validate(context) async {
    final ModalHud modalHud = Provider.of<ModalHud>(context, listen: false);
    modalHud.loadChanging(true);
    if (_globalKey.currentState.validate()) {
      _globalKey.currentState.save();
      _globalKey.currentState.reset();
      await upLoadImage(context);
      if (_url != null) {
        try {
          _store.addMeal(Meal(
            mealName: _name.trim(),
            mealPrice: _price.trim(),
            mealCategory: _category.toLowerCase().trim(),
            mealDescription: _description.trim(),
            imageURL: _url,
          ));
          modalHud.loadChanging(false);
          Scaffold.of(context).showSnackBar(customSnackBar('Success'));
        } on PlatformException catch (exception) {
          modalHud.loadChanging(false);
          Scaffold.of(context).showSnackBar(customSnackBar(exception.message));
        }
      } else {
        modalHud.loadChanging(false);
        Scaffold.of(context)
            .showSnackBar(customSnackBar('Meal Image is empty'));
      }
    }
    modalHud.loadChanging(false);
  }

  void pickImageFromCam() async {
    // var image = await ImagePicker().getImage(source: ImageSource.camera);
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      _imageFile = image;
    });
  }

  void pickImageFromGallery() async {
    // var image = await ImagePicker().getImage(source: ImageSource.gallery);
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _imageFile = image;
    });
  }

  Future upLoadImage(context) async {
    try {
      FirebaseStorage firebaseStorage =
          FirebaseStorage(storageBucket: 'gs://hum-seafood-207fd.appspot.com');
      StorageReference reference =
          firebaseStorage.ref().child(path.basename(_imageFile.path));
      StorageUploadTask uploadTask = reference.putFile(_imageFile);
      StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete;
      var downLoadURL = await taskSnapshot.ref.getDownloadURL();
      String url = downLoadURL.toString();
      setState(() {
        _url = url;
      });
    } catch (exception) {
      Scaffold.of(context).showSnackBar(customSnackBar('Wrong'));
    }
  }
}

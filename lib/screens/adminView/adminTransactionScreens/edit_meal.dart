import 'dart:io';
import 'package:humseafood/widgets/adminView_widgets/addMeal/add_cardDetails.dart';
import 'package:humseafood/widgets/adminView_widgets/addMeal/add_imageButton.dart';
import 'package:humseafood/widgets/adminView_widgets/addMeal/add_mealBackground.dart';
import 'package:humseafood/widgets/adminView_widgets/addMeal/add_mealButton.dart';
import 'package:humseafood/widgets/adminView_widgets/transaction_mealAppBar.dart';
import 'package:path/path.dart' as path;
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:humseafood/constants.dart';
import 'package:humseafood/model/meal.dart';
import 'package:humseafood/provider/modal_hud.dart';
import 'package:humseafood/widgets/custom_snackBar.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:flutter/material.dart';
import 'package:humseafood/services/store.dart';
import 'package:provider/provider.dart';

class EditMeal extends StatefulWidget {
  static String id = 'EditMeal';
  Meal meals;

  EditMeal({@required this.meals});

  @override
  _EditMealState createState() => _EditMealState();
}

class _EditMealState extends State<EditMeal> {
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
                          context, 'Edit MeaL Details', height, isPortrait),
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
                        child: addMealButton(height, width, isPortrait, 'Edit'),
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
          _store.editMeal(
            <String, dynamic>{
              KMealName: _name,
              KMealPrice: _price,
              KMealCategory: _category,
              KMealDescription: _description,
              KMealImageURL: _url,
            },
            widget.meals.mealId,
          );
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

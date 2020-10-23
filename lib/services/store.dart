import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:humseafood/constants.dart';
import 'package:humseafood/model/meal.dart';

class Store {
  Firestore _firestore = Firestore.instance;

  Future addMeal(Meal meal) async {
    _firestore.collection(KMealCollection).add(<String, dynamic>{
      KMealName: meal.mealName,
      KMealPrice: meal.mealPrice,
      KMealCategory: meal.mealCategory,
      KMealDescription: meal.mealDescription,
      KMealImageURL: meal.imageURL,
    });
  }

  Stream<QuerySnapshot> loadMeals(){
    return _firestore.collection(KMealCollection).snapshots();
  }
  deleteMeal(documentId){
    _firestore.collection(KMealCollection).document(documentId).delete();
  }
  editMeal(data, documentId){
    _firestore.collection(KMealCollection).document(documentId).updateData(data);
  }
  viewStoreOrders({@required data, @required List<Meal> meals}){
    var documentRef = _firestore.collection(KOrders).document();
    documentRef.setData(data);
    for(var meal in meals){
      documentRef.collection(KOrderDetails).document().setData(<String, dynamic>{
        KMealName: meal.mealName,
        KMealPrice: meal.mealPrice,
        KMealQuantity: meal.mealQuantity,
        KMealImageURL: meal.imageURL,
      });
    }
  }
  Stream<QuerySnapshot> loadOrders(){
    return _firestore.collection(KOrders).snapshots();
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
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
}

import 'package:flutter/material.dart';
import 'package:humseafood/provider/meal_categoryName.dart';
import 'package:humseafood/provider/modal_hud.dart';
import 'package:humseafood/screens/admin/adminTransactionScreens/add_meal.dart';
import 'package:humseafood/screens/admin/adminTransactionScreens/edit_meal.dart';
import 'package:humseafood/screens/admin/admin_screen.dart';
import 'package:humseafood/screens/admin/adminTransactionScreens/manage_meal.dart';
import 'package:humseafood/screens/onboarding_screen.dart';
import 'package:humseafood/screens/user/home_screen.dart';
import 'package:humseafood/screens/user/meal_screen.dart';
import 'screens/admin/adminTransactionScreens/view_order.dart';
import 'screens/login_screen.dart';
import 'screens/signUp_screen.dart';
import 'screens/splash_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ModalHud>(
          create: (context) => ModalHud(),
        ),
        ChangeNotifierProvider<MealCategoryName>(
          create: (context) => MealCategoryName(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Hum seafood',
        theme: ThemeData(
          fontFamily: 'BalooTamma2',
          primarySwatch: Colors.deepOrange,
          primaryColor: Colors.deepOrange,
          buttonTheme: ButtonThemeData(minWidth: 5.0),
        ),
        // initialRoute: SplashScreen.id,
        initialRoute: HomeScreen.id,
        routes: {
          SplashScreen.id: (context) => SplashScreen(),
          OnboardingScreen.id: (context) => OnboardingScreen(),
          LoginScreen.id: (context) => LoginScreen(),
          SignUpScreen.id: (context) => SignUpScreen(),
          AdminPanel.id: (context) => AdminPanel(),
          HomeScreen.id: (context) => HomeScreen(),
          AddMeal.id: (context) => AddMeal(),
          ManageMeals.id: (context) => ManageMeals(),
          EditMeal.id: (context) => EditMeal(),
          ViewOrder.id: (context) => ViewOrder(),
          MealScreen.id: (context) => MealScreen(),
        },
      ),
    );
  }
}

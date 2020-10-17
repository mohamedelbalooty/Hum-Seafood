import 'package:flutter/material.dart';
import 'package:humseafood/provider/cart_item.dart';
import 'package:humseafood/provider/modal_hud.dart';
import 'package:humseafood/screens/adminView/adminTransactionScreens/add_meal.dart';
import 'package:humseafood/screens/adminView/adminTransactionScreens/edit_meal.dart';
import 'package:humseafood/screens/adminView/admin_screen.dart';
import 'package:humseafood/screens/adminView/adminTransactionScreens/manage_meal.dart';
import 'package:humseafood/screens/onboarding_screen.dart';
import 'package:humseafood/screens/userView/cart_screen.dart';
import 'package:humseafood/screens/userView/home_screen.dart';
import 'package:humseafood/screens/userView/meal_screen.dart';
import 'screens/adminView/adminTransactionScreens/view_order.dart';
import 'screens/login_screen.dart';
import 'screens/signUp_screen.dart';
import 'screens/splash_screen.dart';
import 'package:provider/provider.dart';
import 'screens/userView/map_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ModalHud>(
          create: (context) => ModalHud(),
        ),
        ChangeNotifierProvider<CartItem>(
          create: (context) => CartItem(),
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
          CartScreen.id: (context) => CartScreen(),
          MapScreen.id: (context) => MapScreen(),
        },
      ),
    );
  }
}

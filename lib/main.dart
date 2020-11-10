import 'package:flutter/material.dart';
import 'package:humseafood/provider/cart_item.dart';
import 'package:humseafood/provider/modal_hud.dart';
import 'package:provider/provider.dart';
import 'view/adminView/adminTransaction_view/add_meal.dart';
import 'view/adminView/adminTransaction_view/edit_meal.dart';
import 'view/adminView/adminTransaction_view/manage_meal.dart';
import 'view/adminView/adminTransaction_view/order_details.dart';
import 'view/adminView/adminTransaction_view/view_orders.dart';
import 'view/adminView/admin_screen.dart';
import 'view/login_screen.dart';
import 'view/onboarding_screen.dart';
import 'view/signUp_screen.dart';
import 'view/splash_screen.dart';
import 'view/userView/cart_screen.dart';
import 'view/userView/home_screen.dart';
import 'view/userView/meal_screen.dart';

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
        initialRoute: SplashScreen.id,
        // initialRoute: HomeScreen.id,
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
          ViewOrders.id: (context) => ViewOrders(),
          MealScreen.id: (context) => MealScreen(),
          CartScreen.id: (context) => CartScreen(),
          OrderDetails.id: (context) => OrderDetails(),
        },
      ),
    );
  }
}

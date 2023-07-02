import 'package:flutter/material.dart';
import 'package:vp_16_ui_app/screens/app/bottom_navigation_screen.dart';
import 'package:vp_16_ui_app/screens/app/categories_screen.dart';
import 'package:vp_16_ui_app/screens/app/chat_messages_screen.dart';
import 'package:vp_16_ui_app/screens/app/drawer/favorites_screen.dart';
import 'package:vp_16_ui_app/screens/app/drawer/first_faqs_screen.dart';
import 'package:vp_16_ui_app/screens/app/drawer/second_faqs_screen.dart';
import 'package:vp_16_ui_app/screens/app/drawer/second_favorites_screen.dart';
import 'package:vp_16_ui_app/screens/app/users_screen.dart';
import 'package:vp_16_ui_app/screens/launch_screen.dart';
import 'package:vp_16_ui_app/screens/login_screen.dart';
import 'package:vp_16_ui_app/screens/out_boarding/out_boarding_screen.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/launch_screen',
      routes: {
        '/launch_screen' : (context) => const LaunchScreen(),
        '/out_boarding_screen' : (context) => const OutBoardingScreen(),
        '/login_screen' : (context) => const LoginScreen(),
        '/users_screen' : (context) =>  UsersScreen(),
        '/categories_screen' : (context) =>  const CategoriesScreen(),
        '/chat_messages_screen' : (context) =>  const ChatMessagesScreen(),
        '/bottom_navigation_screen' : (context) =>  const BottomNavigationScreen(),
        '/first_faqs_screen' : (context) =>  const FirstFaqsScreen(),
        '/second_faqs_screen' : (context) =>  const SecondFaqsScreen(),
        '/favorites_screen' : (context) =>  const FavoritesScreen(),
        '/second_favorites_screen' : (context) =>  const SecondFavoritesScreen(),
      },
    );
  }
}

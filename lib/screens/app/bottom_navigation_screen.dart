import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vp_16_ui_app/models/bn_screen.dart';
import 'package:vp_16_ui_app/screens/app/categories_screen.dart';
import 'package:vp_16_ui_app/screens/app/home_screen.dart';
import 'package:vp_16_ui_app/screens/app/settings_screen.dart';
import 'package:vp_16_ui_app/screens/app/users_screen.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({Key? key}) : super(key: key);

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {

  int _currentIndex = 0;

  final List<BnScreen> _screens =<BnScreen>[
    const BnScreen(widget: HomeScreen(), title: 'Home'),
     BnScreen(widget: UsersScreen(), title: 'Users'),
    const BnScreen(widget: CategoriesScreen(), title: 'Categories'),
    const BnScreen(widget: SettingsScreen(), title: 'Settings'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(_screens[_currentIndex].title),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            // Container(
            //   padding: EdgeInsets.all(15),
            //   color: Colors.blue,
            //   height: 200,
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       Container(
            //         width:80,
            //         height: 80,
            //         margin: const EdgeInsets.only(bottom: 10),
            //         decoration: BoxDecoration(
            //           shape: BoxShape.circle,
            //           color: Colors.blue.shade400,
            //         ),
            //       ),
            //       Text(
            //         'Username',
            //         style: GoogleFonts.montserrat(
            //           fontSize: 16,
            //           color: Colors.white,
            //         ),
            //       ),
            //       Text(
            //         'email@app.com',
            //         style: GoogleFonts.montserrat(
            //           fontSize: 14,
            //           color: Colors.white54,
            //         ),
            //       ),
                  const UserAccountsDrawerHeader(
                      accountName: Text('UserName'),
                      accountEmail: Text('email@app.com'),
                    currentAccountPicture: CircleAvatar(),
                    otherAccountsPictures: [
                      CircleAvatar(),
                      CircleAvatar(),
                      CircleAvatar(),
                    ],
                    currentAccountPictureSize: Size(80,80),
                    otherAccountsPicturesSize: Size(30,30),
                  ),
            ListTile(
              onTap: (){
                // Navigator.pushNamed(context, '/first_faqs_screen');
                Navigator.pop(context);
                Future.delayed(Duration(milliseconds: 500),(){
                  Navigator.pushNamed(context, '/second_faqs_screen');
                });
              },
              leading: const Icon(Icons.question_answer),
              title: Text(
                  'FAQs',
                  style: GoogleFonts.montserrat(),
              ),
              subtitle: Text('Frequently Asked Questions',
                  style: GoogleFonts.montserrat(fontSize: 12),
              ),
              trailing: const Icon(Icons.arrow_forward_ios,size: 18,),
            ),
            const Divider(
              indent: 25,
              endIndent: 25,
              thickness: 1,
            ),
            ListTile(
              onTap: () {
                Navigator.pop(context);
                Future.delayed(Duration(milliseconds: 500), () {
                  Navigator.pushNamed(context, '/favorites_screen');
                });
              },
              leading: const Icon(Icons.favorite),
              title: Text(
                'Favorites',
                style: GoogleFonts.montserrat(),
              ),
              subtitle: Text(
                'Items you\'ve liked!',
                style: GoogleFonts.montserrat(fontSize: 12),
              ),
              trailing: Icon(Icons.arrow_forward_ios,size: 18,),
            ),
            ListTile(
              onTap: () {
                Navigator.pop(context);
                Future.delayed(Duration(milliseconds: 500), () {
                  Navigator.pushNamed(context, '/second_favorites_screen');
                });
              },
              leading: const Icon(Icons.favorite),
              title: Text(
                'Second Favorites',
                style: GoogleFonts.montserrat(),
              ),
              subtitle: Text(
                'Items you\'ve liked!',
                style: GoogleFonts.montserrat(fontSize: 12),
              ),
              trailing: Icon(Icons.arrow_forward_ios,size: 18,),
            ),
            ListTile(
              onTap: () {
                  Navigator.pop(context);
                  Future.delayed(const Duration(milliseconds: 500),(){
                  Navigator.pushNamed(context, '/login_screen');
                  });
                },
              leading: const Icon(Icons.logout),
              title: Text(
                'Logout',
                style: GoogleFonts.montserrat(),
              ),
              subtitle: Text('Return to login',
                style: GoogleFonts.montserrat(fontSize: 12),
              ),
            ),
                ],
              ),
            ),

      body: _screens[_currentIndex].widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int currentIndex){
          setState(()=>_currentIndex=currentIndex);
        },
        currentIndex: _currentIndex,
        backgroundColor: Colors.white,
        //****************************************
        type: BottomNavigationBarType.fixed,
        //****************************************
        showSelectedLabels: true,
        showUnselectedLabels: true,
        //****************************************
        elevation: 10,
        //****************************************
        // fixedColor: Colors.pink.shade100,
        selectedItemColor: Colors.blue.shade100,
        selectedIconTheme: IconThemeData(
            color: Colors.blue.shade300,
          // size: 24,
        ),
        selectedLabelStyle: GoogleFonts.nunito(
          fontWeight: FontWeight.w700,
          letterSpacing: 2,
          // fontSize: 20,
        ),
        //****************************************
        unselectedItemColor: Colors.grey.shade400,
        unselectedIconTheme: IconThemeData(
          color: Colors.grey.shade200,
          // size: 24,
        ),
        //****************************************
        // selectedFontSize: 14,
        // unselectedFontSize: 12,
        //****************************************
        // iconSize: 10,
        //****************************************
        items:  [
          BottomNavigationBarItem(
            backgroundColor: Colors.blue.shade100,
            activeIcon: const Icon(Icons.home),
            icon: const Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.pink.shade100,
            activeIcon: const Icon(Icons.person,size: 24,),
            icon: const Icon(Icons.person_outline),
            label: 'Users',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.red.shade100,
            activeIcon: const Icon(Icons.category),
            icon: const Icon(Icons.category_outlined),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.purple.shade100,
            activeIcon: const Icon(Icons.settings),
            icon: const Icon(Icons.settings_outlined),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}

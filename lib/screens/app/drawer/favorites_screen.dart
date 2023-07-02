import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vp_16_ui_app/screens/app/tabs/first_tab.dart';
import 'package:vp_16_ui_app/screens/app/tabs/second_tab.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen>
    with SingleTickerProviderStateMixin{

  late TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _tabController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites'),
        bottom: TabBar(
          isScrollable: false,
          //**************************
          controller: _tabController,
          //**************************
          indicatorColor: Colors.grey.shade200,
          indicatorWeight: 5,
          indicatorSize: TabBarIndicatorSize.tab,
          indicatorPadding: EdgeInsets.zero,
          // indicator: BoxDecoration(
          //   color: Colors.orange,
          //   borderRadius: BorderRadiusDirectional.only(
          //     topStart: Radius.circular(10),
          //     topEnd: Radius.circular(10),
          //   ),
          // ),
          //**************************
          onTap: (int tabIndex)=>print(tabIndex),
          //**************************
          labelColor: Colors.white,
          labelStyle: GoogleFonts.montserrat(
            fontWeight: FontWeight.bold,
            letterSpacing: 2
          ),
          unselectedLabelColor: Colors.white70,
          unselectedLabelStyle: GoogleFonts.montserrat(
            fontWeight: FontWeight.w300,
            letterSpacing: 0, 
          ),
          //**************************
          padding: EdgeInsets.all(0),
          labelPadding: EdgeInsets.only(bottom: 0),
          //**************************
          tabs: const [
            Tab(text: 'First Tab',),
            Tab(text: 'Second Tab',),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          Center(
              child: Text('First Tab')),
          Center(
              child: Text('Second Tab')),

          //in the second favorite screen
          // FirstTab(),
          // SecondTab(),

        ],
      ),
    );
  }
}

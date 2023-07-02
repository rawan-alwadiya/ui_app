import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vp_16_ui_app/screens/app/tabs/first_tab.dart';
import 'package:vp_16_ui_app/screens/app/tabs/second_tab.dart';

class SecondFavoritesScreen extends StatefulWidget {
  const SecondFavoritesScreen({Key? key}) : super(key: key);

  @override
  State<SecondFavoritesScreen> createState() => _SecondFavoritesScreenState();
}

class _SecondFavoritesScreenState extends State<SecondFavoritesScreen>
    with SingleTickerProviderStateMixin {

  late TabController _tabController;
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController=TabController(length: 2, vsync: this);
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
      ),
      body: ListView(
        children: [
          CircleAvatar(radius: 40,),
          SizedBox(height: 10,),
          Text(
            'Favorites Items',
            style: GoogleFonts.montserrat(
              fontWeight: FontWeight.w500,
              fontSize: 18,
            ),
          ),
          TabBar(
            controller: _tabController,
            labelColor: Colors.black,
            onTap: (int index){
              setState(()=> _tabController.index = index);
            },
            tabs: [
              Tab(text: 'First',),
              Tab(text: 'Second',),
            ],
          ),
          IndexedStack(
            index: _tabController.index,
            children: [
              // Text('A'),
              // Text('B'),
              Visibility(
                visible: _tabController.index==0,
                  child: const FirstTab(),
              ),
              Visibility(
                visible: _tabController.index==1,
                  child: SecondTab(),
              ),
            ],
          ),
          // TabBarView(
          //   controller: _tabController,
          //   children: [
          // Text('A'),
          // Text('B'),
          //     FirstTab(),
          //     SecondTab(),
          //   ],
          // ),
        ],
      ),
    );
  }
}


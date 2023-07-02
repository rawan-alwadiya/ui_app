import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LaunchScreen extends StatefulWidget {
  const LaunchScreen({Key? key}) : super(key: key);

  @override
  State<LaunchScreen> createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 3),(){
      Navigator.pushReplacementNamed(context, '/out_boarding_screen');
      // Navigator.pushReplacementNamed(context, '/categories_screen');
      // Navigator.pushReplacementNamed(context, '/users_screen');
      // Navigator.pushReplacementNamed(context, '/bottom_navigation_screen');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: AlignmentDirectional.center,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: AlignmentDirectional.topStart,
            end: AlignmentDirectional.bottomEnd,
            colors: [
              Colors.pink.shade100,
              Colors.blue.shade100,
            ],
          ),
        ),
        child: Text('UI APP',style: GoogleFonts.montserrat(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        ),
      ),
    );
  }
}

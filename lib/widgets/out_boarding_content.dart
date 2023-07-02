import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OutBoardingContent extends StatelessWidget {
  const OutBoardingContent({
    Key? key,
    required this.imageName,
    required this.title,
    required this.subTitle,

  }) : super(key: key);

 final String imageName;
 final String title;
 final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'images/$imageName.jpg',
          height: 320,
          width: 400,
          fit: BoxFit.fill,
        ),
        SizedBox(height: 19,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 34),
          child: Column(
            children: [
              Text(
                title,
                style: GoogleFonts.nunito(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF23203F),
                ),
              ),
              SizedBox(height: 20.8,),
              Text(
                subTitle,
                textAlign: TextAlign.center,
                style: GoogleFonts.openSans(
                  fontSize: 17,
                  fontWeight: FontWeight.w300,
                  color: Color(0xFF716F87),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
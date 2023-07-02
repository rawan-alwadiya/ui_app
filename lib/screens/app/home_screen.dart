import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(15),
      children: [
        // ConstrainedBox(
        //   constraints: BoxConstraints(
        //     maxHeight: 100,
        //   ),
        //   child: ListView.builder(
        //     scrollDirection: Axis.horizontal,
        //     itemCount: 10,
        //     itemBuilder: (context,index){
        //     return Container(
        //       color: Colors.blue.shade100,
        //       margin: EdgeInsetsDirectional.only(end: index == 9? 0: 10),
        //       height: 100,
        //       width: 100,
        //     );
        //   },
        //   ),
        // ),
        Text(
          'Categories',
          style: GoogleFonts.montserrat(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10,),
        ConstrainedBox(
          constraints: const BoxConstraints(
            maxHeight: 150,
          ),
          child: GridView.builder(
            itemCount: 10,
            scrollDirection: Axis.horizontal,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              mainAxisSpacing: 10,
            ),
            itemBuilder:(context,index){
              return Container(
                color: Colors.blue.shade300,
              );
            },
          ),
        ),
        //Latest Products
        SizedBox(height: 20,),
        Text(
          'Latest Products',
          style: GoogleFonts.montserrat(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10,),
        GridView.builder(
          shrinkWrap: true,
          itemCount: 6,
          physics: NeverScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
          ),
          itemBuilder: (context,index){
            return Container(
              color: index % 2==0? Colors.blue.shade100:Colors.pink.shade100,
            );
          },
        ),
        SizedBox(height: 20,),
        Text(
          'Latest Products',
          style: GoogleFonts.montserrat(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10,),
        ListView.builder(
          scrollDirection: Axis.vertical,
          physics: NeverScrollableScrollPhysics(),
          itemCount: 10,
          shrinkWrap: true,
          itemBuilder: (context,index){
            return Container(
              color: index % 2 ==0? Colors.pink.shade100 : Colors.blue.shade100,
              height: 100,
              margin: EdgeInsetsDirectional.only(bottom: 10),
            );
          },
        ),
      ],
    );
  }
}

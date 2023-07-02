import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 9,
      padding: EdgeInsets.all(10),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        // mainAxisExtent: 225,
        childAspectRatio: 132/225,
      ),
      itemBuilder: (context,index){
        return Container(
          color: Colors.blue.shade100,
          alignment: AlignmentDirectional.center,
          child: Text(
            'Container #$index',
            style: GoogleFonts.nunito(fontSize: 18),
          ),
        );
      },
    );
      // body: GridView(
      //   padding: EdgeInsets.all(10),
      //   scrollDirection: Axis.vertical,
      //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      //     crossAxisCount: 2,
      //     crossAxisSpacing: 10,
      //     mainAxisSpacing: 10,
      //     // mainAxisExtent: 200,
      //     childAspectRatio: 132/225,
      //   ),
      //   children: [
      //     Container(color: Colors.pink.shade100,),
      //     Container(color: Colors.blue.shade100,),
      //     Container(color: Colors.green.shade100,),
      //     Container(color: Colors.yellow.shade100,),
      //   ],
      // ),

  }
}

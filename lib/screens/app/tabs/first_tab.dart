import 'package:flutter/material.dart';

class FirstTab extends StatelessWidget {
  const FirstTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 10,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder:(context , index){
          return ListTile(leading: Icon(Icons.person),
            title: Text('Title'),
          );
        });
  }
}

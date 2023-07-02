import 'package:flutter/material.dart';


class UsersScreen extends StatelessWidget {
   UsersScreen({Key? key}) : super(key: key);

  final List<String> data = ['A','B','C','D','E'];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context,index){
        return ListTile(
          onTap: ()=>Navigator.pushNamed(context, '/chat_messages_screen'),
          // contentPadding: EdgeInsets.zero,
          leading: const Icon(Icons.person),
          title: Text('Title $index'),
          subtitle: const Text('SubTitle'),
        );
      },
      separatorBuilder: (context,index){
        return const Divider(
          thickness: 1,
          color: Colors.black45,
          indent: 30,
          endIndent: 30,
          height: 10,
        );
      },
      itemCount: 10,
    );

      // body: ListView.builder(
      //   physics: BouncingScrollPhysics(),
      //   itemCount: 10,
      //     reverse: false,
      //     padding: EdgeInsets.all(10),
      //     itemBuilder: (context,index){
      //       return ListTile(
      //         contentPadding: EdgeInsets.zero,
      //         leading: Icon(Icons.person),
      //         title: Text('Title $index'),
      //         subtitle: Text('SubTitle'),
      //       );
      //     },
      // ),
      // body: ListView(
      //   children: data.map((e) => ListTile(
      //     leading: Icon(Icons.person),
      //     title: Text('Title $e'),
      //     subtitle: Text('SubTitle'),
      //   ),).toList(),
      // ),
      // body: ListView(
      //   children: [
      //     ListTile(
      //       leading: Icon(Icons.person),
      //       title: Text('Title'),
      //       subtitle: Text('SubTitle'),
      //     ),
      //   ],
      // ),

  }
}

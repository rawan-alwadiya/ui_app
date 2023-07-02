import 'package:flutter/material.dart';
import 'package:vp_16_ui_app/models/faq.dart';

class SecondFaqsScreen extends StatefulWidget {
  const SecondFaqsScreen({Key? key}) : super(key: key);

  @override
  State<SecondFaqsScreen> createState() => _SecondFaqsScreenState();
}

class _SecondFaqsScreenState extends State<SecondFaqsScreen> {

  final List<Faq> _faqs =<Faq>[
    Faq(question: 'Question #1', answer: 'Answer #1'),
    Faq(question: 'Question #2', answer: 'Answer #2'),
    Faq(question: 'Question #3', answer: 'Answer #3'),
    Faq(question: 'Question #4', answer: 'Answer #4'),
    Faq(question: 'Question #5', answer: 'Answer #5'),

    Faq(question: 'Question #6', answer: 'Answer #6'),
    Faq(question: 'Question #7', answer: 'Answer #7'),
    Faq(question: 'Question #8', answer: 'Answer #8'),
    Faq(question: 'Question #9', answer: 'Answer #9'),

    Faq(question: 'Question #10', answer: 'Answer #10'),
    Faq(question: 'Question #11', answer: 'Answer #11'),
    Faq(question: 'Question #12', answer: 'Answer #12'),
    Faq(question: 'Question #13', answer: 'Answer #13'),
    Faq(question: 'Question #14', answer: 'Answer #14'),
    Faq(question: 'Question #15', answer: 'Answer #15'),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FAQs'),
      ),
      body: ListView.builder(
        itemCount: _faqs.length,
          itemBuilder: (context,index) {
        return ExpansionTile(
          title: Text(_faqs[index].question),
          //Expanded
          iconColor: Colors.grey.shade100,
          backgroundColor: Color(0xFF5CB8E4),
          textColor: Colors.white,

          //Collapsed
          collapsedIconColor: Colors.blue.shade200,
          collapsedBackgroundColor: Color(0xFFF2F2F2),
          collapsedTextColor: Colors.black,
          initiallyExpanded: false,
          expandedAlignment: Alignment.centerLeft,
          childrenPadding: EdgeInsets.all(10),
          leading: Icon(Icons.question_answer),
          onExpansionChanged: (bool value) {},

          children: [
            Text(_faqs[index].answer),
          ],
        );
      }
     ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:vp_16_ui_app/models/faq.dart';

class FirstFaqsScreen extends StatefulWidget {
  const FirstFaqsScreen({Key? key}) : super(key: key);

  @override
  State<FirstFaqsScreen> createState() => _FirstFaqsScreenState();
}

class _FirstFaqsScreenState extends State<FirstFaqsScreen> {

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

  int _currentPanelIndex=0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FAQs'),
      ),
      body: ListView(
          children:[
          ExpansionPanelList(
            animationDuration: Duration(seconds: 1),
            elevation: 4,
            expandedHeaderPadding: EdgeInsets.zero,
            dividerColor: Color(0xFFF9F5EB),

            expansionCallback: (panelIndex,isExpanded){
              for(Faq faq in _faqs) {
                if (faq.isExpanded) {
                  faq.isExpanded = false;
                }
              }
                  setState(() => _faqs[panelIndex].isExpanded =! isExpanded);
              // setState(() => _currentPanelIndex = panelIndex);
              // setState(() => _faqs[_currentPanelIndex].isExpanded =! isExpanded);

            },
            children: _faqs.map((Faq faq){
              return ExpansionPanel(
                backgroundColor: Color(0xFFEEEEEE),
                canTapOnHeader: true,
                isExpanded: faq.isExpanded,
                headerBuilder: (context, isExpanded){
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Icon(Icons.question_answer,size: 18,),
                      SizedBox(width: 10,),
                      Text(faq.question),
                    ],
                  ),
                );
              },
                  body: Container(
                    color: Color(0xFF9FC9F3),
                    padding: const EdgeInsets.all(10),
                    child: Align(
                      alignment: AlignmentDirectional.centerStart,
                        child: Text(faq.answer)),
                  ),
              );
            }).toList(),
          ),
      ],
     ),
    );
  }
}

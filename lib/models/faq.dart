class Faq {
  final String question;
  final String answer;
  bool isExpanded;

  Faq({
    required this.question,
    required this.answer,
    this.isExpanded=false,
  });
}
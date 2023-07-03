class QModel {
  final int id;
  final String question;
  final int answer;
  final List<Option> options;
  bool isSelected = false;

  QModel(
      {required this.id,
      required this.question,
      required this.answer,
      required this.options,
      required this.isSelected});
}

class Option {
  String text;
  bool isClicked=false;
  Option({required this.text, required this.isClicked});
}

// ignore: camel_case_types
class BMI_C {
  final String comment;
  final double bmi;
  final String result;

  BMI_C({this.comment, this.bmi, this.result});

  Map<String, dynamic> toJson() => {
        "result": result,
        "bmi": bmi,
        "comment": comment,
      };

  static BMI_C fromJson(Map<String, dynamic> json) => BMI_C(
        bmi: json['bmi'],
        comment: json['comment'],
        result: json['result'],
      );
}

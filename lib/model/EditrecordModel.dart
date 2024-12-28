class Editrecordmodel {
  final String recordDate;
  final String recordText;

  Editrecordmodel({
    required this.recordDate,
    required this.recordText,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['recorddate'] = this.recordDate;
    data['recordtext'] = this.recordText;

    return data;
  }

  factory Editrecordmodel.fromJson(Map<String, dynamic> json) {
    return Editrecordmodel(
      recordDate: json['recorddate'],
      recordText: json['recordtext'],
    );
  }
}

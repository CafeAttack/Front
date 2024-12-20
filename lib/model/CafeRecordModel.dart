class Record {
  int id;
  String date;
  String text;

  Record({
    required this.id,
    required this.date,
    required this.text,
  });

  factory Record.fromJson(Map<String, dynamic> json) {
    return Record(
      id: json['id'],
      date: json['date'],
      text: json['text'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'date': date,
      'text': text,
    };
  }
}


class CafeRecordResponse {
  int visitcount; // 수정 가능하도록 final 제거
  int heart;
  List<Record> records;

  CafeRecordResponse({
    required this.visitcount,
    required this.heart,
    required this.records,
  });

  factory CafeRecordResponse.fromJson(Map<String, dynamic> json) {
    return CafeRecordResponse(
      visitcount: json['visitcount'],
      heart: json['heart'],
      records: List<Record>.from(
        json['records'].map((recordJson) => Record.fromJson(recordJson)),
      ),
    );
  }

  // 데이터를 JSON 형식으로 변환
  Map<String, dynamic> toJson() {
    return {
      'visitcount': visitcount,
      'heart': heart,
      'records': records.map((record) => record.toJson()).toList(),
    };
  }
}

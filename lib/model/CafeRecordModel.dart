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
    // 날짜 값에서 T 이후의 내용을 제거
    String formattedDate = json['date'].split('T')[0];
    return Record(
      id: json['id'],
      date: formattedDate,
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
  int visitcount;
  int heart;
  List<Record> records;

  CafeRecordResponse({
    required this.visitcount,
    required this.heart,
    required this.records,
  });

  factory CafeRecordResponse.fromJson(Map<String, dynamic> json) {
    return CafeRecordResponse(
      visitcount: json['visitcount'] ?? 0,
      heart: json['heart'] ?? 0,
      records: List<Record>.from(
        (json['records'] ?? [])
            .map((recordJson) => Record.fromJson(recordJson)),
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'visitcount': visitcount,
      'heart': heart,
      'records': records.map((record) => record.toJson()).toList(),
    };
  }
}

class CafeRecordApiResponse {
  int status;
  String message;
  CafeRecordResponse data;

  CafeRecordApiResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory CafeRecordApiResponse.fromJson(Map<String, dynamic> json) {
    return CafeRecordApiResponse(
      status: json['status'],
      message: json['message'],
      data: CafeRecordResponse.fromJson(json['data']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'data': data.toJson(),
    };
  }
}

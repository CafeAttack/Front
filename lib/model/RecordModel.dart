class RecordModel {
  int status;
  String message;
  List<Cafe> data;

  RecordModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory RecordModel.fromJson(Map<String, dynamic> json) {
    return RecordModel(
      status: json['status'] ?? 0, // 기본값 설정
      message: json['message'] ?? '',
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => Cafe.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [], // data가 null일 경우 빈 리스트 반환
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'data': data.map((e) => e.toJson()).toList(),
    };
  }
}

class Cafe {
  int cafeId;
  String cafename;
  int visitcount;
  String latestvisit;

  Cafe({
    required this.cafeId,
    required this.cafename,
    required this.visitcount,
    required this.latestvisit,
  });

  factory Cafe.fromJson(Map<String, dynamic> json) {
    return Cafe(
      cafeId: json['cafeId'] ?? 0,
      cafename: json['cafename'] ?? '',
      visitcount: json['visitcount'] ?? 0,
      latestvisit: json['latestvisit'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'cafeId': cafeId,
      'cafename': cafename,
      'visitcount': visitcount,
      'latestvisit': latestvisit,
    };
  }
}

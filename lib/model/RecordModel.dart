class RecordModel {
  int status;
  String message;
  List<Cafe> cafes; // Ensure Cafe is a valid type

  RecordModel({required this.status, required this.message, required this.cafes});

  factory RecordModel.fromJson(Map<String, dynamic> json) {
    var cafesList = json['cafes'] as List;
    List<Cafe> cafes = cafesList.map((i) => Cafe.fromJson(i)).toList();

    return RecordModel(
      status: json['status'],
      message: json['message'],
      cafes: cafes,
    );
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
      cafeId: json['cafeId'],
      cafename: json['cafename'],
      visitcount: json['visitcount'],
      latestvisit: json['latestvisit'],
    );
  }
}

import 'dart:convert';

class NoteKeep {
  String id;
  String userId;
  String title;
  String description;
  DateTime? dateAdded;
  NoteKeep({
    required this.id,
    required this.userId,
    required this.title,
    required this.description,
    this.dateAdded,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'userId': userId});
    result.addAll({'title': title});
    result.addAll({'description': description});
    if (dateAdded != null) {
      result.addAll({'dateAdded': dateAdded!.toIso8601String()});
    }

    return result;
  }

  factory NoteKeep.fromMap(Map<String, dynamic> map) {
    return NoteKeep(
      id: map['id'] ?? '',
      userId: map['userId'] ?? '',
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      dateAdded: DateTime.tryParse(map["dateAdded"]),
    );
  }

  String toJson() => json.encode(toMap());

  factory NoteKeep.fromJson(String source) =>
      NoteKeep.fromMap(json.decode(source));
}

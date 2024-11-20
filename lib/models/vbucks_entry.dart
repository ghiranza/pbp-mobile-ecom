// To parse this JSON data, do
//
//     final moodEntry = moodEntryFromJson(jsonString);

import 'dart:convert';

List<VBucksEntry> moodEntryFromJson(String str) =>
    List<VBucksEntry>.from(json.decode(str).map((x) => MoodEntry.fromJson(x)));

String moodEntryToJson(List<MoodEntry> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MoodEntry {
  String model;
  String pk;
  Fields fields;

  MoodEntry({
    required this.model,
    required this.pk,
    required this.fields,
  });

  factory MoodEntry.fromJson(Map<String, dynamic> json) => MoodEntry(
        model: json["model"],
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
      );

  Map<String, dynamic> toJson() => {
        "model": model,
        "pk": pk,
        "fields": fields.toJson(),
      };
}

class Fields {
  int user;
  String vbucks;
  DateTime time;
  String description;
  int vbucksPrice;

  Fields({
    required this.user,
    required this.vbucks,
    required this.time,
    required this.description,
    required this.vbucksPrice,
  });

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        user: json["user"],
        vbucks: json["vbucks"],
        time: DateTime.parse(json["time"]),
        description: json["description"],
        vbucksPrice: json["vbucks_price"],
      );

  Map<String, dynamic> toJson() => {
        "user": user,
        "vbucks": vbucks,
        "time":
            "${time.year.toString().padLeft(4, '0')}-${time.month.toString().padLeft(2, '0')}-${time.day.toString().padLeft(2, '0')}",
        "description": description,
        "vbucks_price": vbucksPrice,
      };
}
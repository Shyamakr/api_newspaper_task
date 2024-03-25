import 'dart:convert';

SampleapiNewsModel sampleapiNewsModelFromJson(String str) =>
    SampleapiNewsModel.fromJson(json.decode(str));

String sampleapiNewsModelToJson(SampleapiNewsModel data) =>
    json.encode(data.toJson());

class SampleapiNewsModel {
  List<Newspaper>? newspapers;

  SampleapiNewsModel({
    this.newspapers,
  });

  factory SampleapiNewsModel.fromJson(Map<String, dynamic> json) =>
      SampleapiNewsModel(
        newspapers: json["newspapers"] == null
            ? []
            : List<Newspaper>.from(
                json["newspapers"]!.map((x) => Newspaper.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "newspapers": newspapers == null
            ? []
            : List<dynamic>.from(newspapers!.map((x) => x.toJson())),
      };
}

class Newspaper {
  String? lccn;
  String? url;
  State? state;
  String? title;

  Newspaper({
    this.lccn,
    this.url,
    this.state,
    this.title,
  });

  factory Newspaper.fromJson(Map<String, dynamic> json) => Newspaper(
        lccn: json["lccn"],
        url: json["url"],
        state: stateValues.map[json["state"]]!,
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "lccn": lccn,
        "url": url,
        "state": stateValues.reverse[state],
        "title": title,
      };
}

enum State { ALABAMA }

final stateValues = EnumValues({"Alabama": State.ALABAMA});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}

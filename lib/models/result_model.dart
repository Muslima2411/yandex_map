import 'dart:convert';

class Result {
  String? suggest_reqid;
  List<ResultElement>? results;

  Result({
    this.suggest_reqid,
    this.results,
  });

  Result.fromJson(Map<String, dynamic> json) {
    suggest_reqid = json["suggest_reqid"];
    results = json["results"] == null
        ? []
        : List<ResultElement>.from(
            json["results"]!.map((x) => ResultElement.fromJson(x)));
  }

  Map<String, dynamic> toJson() => {
        "suggest_reqid": suggest_reqid,
        "results": results == null
            ? []
            : List<dynamic>.from(results!.map((x) => x.toJson())),
      };
}

class ResultElement {
  Title? title;
  List<String>? tags;
  Distance? distance;
  Title? subtitle;

  ResultElement({
    this.title,
    this.tags,
    this.distance,
    this.subtitle,
  });

  factory ResultElement.fromJson(Map<String, dynamic> json) => ResultElement(
        title: json["title"] == null ? null : Title.fromJson(json["title"]),
        tags: json["tags"] == null
            ? []
            : List<String>.from(json["tags"]!.map((x) => x)),
        distance: json["distance"] == null
            ? null
            : Distance.fromJson(json["distance"]),
        subtitle:
            json["subtitle"] == null ? null : Title.fromJson(json["subtitle"]),
      );

  Map<String, dynamic> toJson() => {
        "title": title?.toJson(),
        "tags": tags == null ? [] : List<dynamic>.from(tags!.map((x) => x)),
        "distance": distance?.toJson(),
        "subtitle": subtitle?.toJson(),
      };
}

class Distance {
  double? value;
  String? text;

  Distance({
    this.value,
    this.text,
  });

  factory Distance.fromRawJson(String str) =>
      Distance.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Distance.fromJson(Map<String, dynamic> json) => Distance(
        value: json["value"]?.toDouble(),
        text: json["text"],
      );

  Map<String, dynamic> toJson() => {
        "value": value,
        "text": text,
      };
}

class Title {
  String? text;
  List<Hl>? hl;

  Title({
    this.text,
    this.hl,
  });

  factory Title.fromRawJson(String str) => Title.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Title.fromJson(Map<String, dynamic> json) => Title(
        text: json["text"],
        hl: json["hl"] == null
            ? []
            : List<Hl>.from(json["hl"]!.map((x) => Hl.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "text": text,
        "hl": hl == null ? [] : List<dynamic>.from(hl!.map((x) => x.toJson())),
      };
}

class Hl {
  int? begin;
  int? end;

  Hl({
    this.begin,
    this.end,
  });

  factory Hl.fromRawJson(String str) => Hl.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Hl.fromJson(Map<String, dynamic> json) => Hl(
        begin: json["begin"],
        end: json["end"],
      );

  Map<String, dynamic> toJson() => {
        "begin": begin,
        "end": end,
      };
}

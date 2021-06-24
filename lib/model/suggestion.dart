class Suggestion {
  List<String>? suggestions;

  Suggestion({
      this.suggestions});

  Suggestion.fromJson(dynamic json) {
    suggestions = json["suggestions"] != null ? json["suggestions"].cast<String>() : [];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["suggestions"] = suggestions;
    return map;
  }

}
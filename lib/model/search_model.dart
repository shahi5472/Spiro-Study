class SearchModel {
  int? id;
  String? title;
  String? description;
  Category? category;
  SubCategory? subCategory;
  String? tag;
  Video? video;
  double? avgRating;
  int? totalNumberOfRating;

  SearchModel(
      {this.id,
      this.title,
      this.description,
      this.category,
      this.subCategory,
      this.tag,
      this.video,
      this.avgRating,
      this.totalNumberOfRating});

  SearchModel.fromJson(dynamic json) {
    id = json["id"];
    title = json["title"];
    description = json["description"];
    category =
        json["category"] != null ? Category.fromJson(json["category"]) : null;
    subCategory = json["sub_category"] != null
        ? SubCategory.fromJson(json["sub_category"])
        : null;
    tag = json["tag"];
    video = json["video"] != null ? Video.fromJson(json["video"]) : null;
    avgRating = json["avg_rating"];
    totalNumberOfRating = json["total_number_of_rating"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = id;
    map["title"] = title;
    map["description"] = description;
    if (category != null) {
      map["category"] = category?.toJson();
    }
    map["sub_category"] = subCategory;
    map["tag"] = tag;
    if (video != null) {
      map["video"] = video?.toJson();
    }
    map["avg_rating"] = avgRating;
    map["total_number_of_rating"] = totalNumberOfRating;
    return map;
  }
}

class Video {
  int? id;
  int? duration;
  String? thumbnail;
  String? link;
  int? views;

  Video({this.id, this.duration, this.thumbnail, this.link, this.views});

  Video.fromJson(dynamic json) {
    id = json["id"];
    duration = json["duration"];
    thumbnail = json["thumbnail"];
    link = json["link"];
    views = json["views"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = id;
    map["duration"] = duration;
    map["thumbnail"] = thumbnail;
    map["link"] = link;
    map["views"] = views;
    return map;
  }
}

class Category {
  int? id;
  String? name;

  Category({this.id, this.name});

  Category.fromJson(dynamic json) {
    id = json["id"];
    name = json["name"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = id;
    map["name"] = name;
    return map;
  }
}

class SubCategory {
  int? id;
  String? name;

  SubCategory({this.id, this.name});

  SubCategory.fromJson(dynamic json) {
    id = json["id"];
    name = json["name"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = id;
    map["name"] = name;
    return map;
  }
}

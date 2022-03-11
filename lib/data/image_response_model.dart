import 'dart:convert';

ImageResponseModel imageModelFromJson(String str) =>
    ImageResponseModel.fromJson(json.decode(str));

String imageModelToJson(ImageResponseModel data) => json.encode(data.toJson());

class ImageResponseModel {
  List<Backdrops>? backdrops;

  ImageResponseModel({
    this.backdrops,
  });

  ImageResponseModel.fromJson(dynamic json) {
    if (json['backdrops'] != null) {
      backdrops = [];
      json['backdrops'].forEach((v) {
        backdrops?.add(Backdrops.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (backdrops != null) {
      map['backdrops'] = backdrops?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Backdrops {
  double? aspectRatio;
  int? height;
  String? iso6391;
  String? filePath;
  double? voteAverage;
  int? voteCount;
  int? width;

  Backdrops({
    this.aspectRatio,
    this.height,
    this.iso6391,
    this.filePath,
    this.voteAverage,
    this.voteCount,
    this.width,
  });

  Backdrops.fromJson(dynamic json) {
    aspectRatio = json['aspect_ratio'];
    height = json['height'];
    iso6391 = json['iso_639_1'];
    filePath = json['file_path'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
    width = json['width'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['aspect_ratio'] = aspectRatio;
    map['height'] = height;
    map['iso_639_1'] = iso6391;
    map['file_path'] = filePath;
    map['vote_average'] = voteAverage;
    map['vote_count'] = voteCount;
    map['width'] = width;
    return map;
  }
}

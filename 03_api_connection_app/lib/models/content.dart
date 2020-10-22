import 'package:json_annotation/json_annotation.dart';

part 'content.g.dart';

@JsonSerializable(nullable: false)
class Content {
  final Uri thumbnail;
  final String title;
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  Content(this.thumbnail, this.title, this.createdAt);

  factory Content.fromJson(Map<String, dynamic> json) => _$ContentFromJson(json);
}

@JsonSerializable(nullable: false)
class ContentList {
  @JsonKey(name: 'contents')
  final List<Content> values;
  ContentList(this.values);

  factory ContentList.fromJson(Map<String, dynamic> json) => _$ContentListFromJson(json);
}

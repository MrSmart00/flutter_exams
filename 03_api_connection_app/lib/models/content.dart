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
class ContentList<T> {
  @JsonKey(name: 'contents')
  @_Converter()
  final List<T> values;
  ContentList(this.values);

  factory ContentList.fromJson(Map<String, dynamic> json) => _$ContentListFromJson<T>(json);
}

class _Converter<T> implements JsonConverter<T, Object> {
  const _Converter();

  @override
  T fromJson(Object json) {
    if (Content.fromJson(json) != null) {

    }
    if (json is Map<String, dynamic> &&
        json.containsKey('thumbnail') &&
        json.containsKey('title') &&
        json.containsKey("created_at")
    ) {
      return Content.fromJson(json) as T;
    }
    return json as T;
  }

  @override
  Object toJson(T object) {
    return object;
  }
}

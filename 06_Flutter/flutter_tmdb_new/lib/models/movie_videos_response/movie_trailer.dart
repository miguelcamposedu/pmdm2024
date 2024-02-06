import 'dart:convert';

class MovieTrailer {
  String? iso6391;
  String? iso31661;
  String? name;
  String? key;
  String? site;
  int? size;
  String? type;
  bool? official;
  DateTime? publishedAt;
  String? id;

  MovieTrailer({
    this.iso6391,
    this.iso31661,
    this.name,
    this.key,
    this.site,
    this.size,
    this.type,
    this.official,
    this.publishedAt,
    this.id,
  });

  factory MovieTrailer.fromMap(Map<String, dynamic> data) => MovieTrailer(
        iso6391: data['iso_639_1'] as String?,
        iso31661: data['iso_3166_1'] as String?,
        name: data['name'] as String?,
        key: data['key'] as String?,
        site: data['site'] as String?,
        size: data['size'] as int?,
        type: data['type'] as String?,
        official: data['official'] as bool?,
        publishedAt: data['published_at'] == null
            ? null
            : DateTime.parse(data['published_at'] as String),
        id: data['id'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'iso_639_1': iso6391,
        'iso_3166_1': iso31661,
        'name': name,
        'key': key,
        'site': site,
        'size': size,
        'type': type,
        'official': official,
        'published_at': publishedAt?.toIso8601String(),
        'id': id,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Result].
  factory MovieTrailer.fromJson(String data) {
    return MovieTrailer.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [MovieTrailer] to a JSON string.
  String toJson() => json.encode(toMap());
}

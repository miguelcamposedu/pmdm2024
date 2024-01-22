import 'dart:convert';

import 'location.dart';
import 'origin.dart';

class CharacterResponse {
  int? id;
  String? name;
  String? status;
  String? species;
  String? type;
  String? gender;
  Origin? origin;
  Location? location;
  String? image;
  List<dynamic>? episode;
  String? url;
  DateTime? created;

  CharacterResponse({
    this.id,
    this.name,
    this.status,
    this.species,
    this.type,
    this.gender,
    this.origin,
    this.location,
    this.image,
    this.episode,
    this.url,
    this.created,
  });

  factory CharacterResponse.fromMap(Map<String, dynamic> data) {
    return CharacterResponse(
      id: data['id'] as int?,
      name: data['name'] as String?,
      status: data['status'] as String?,
      species: data['species'] as String?,
      type: data['type'] as String?,
      gender: data['gender'] as String?,
      origin: data['origin'] == null
          ? null
          : Origin.fromMap(data['origin'] as Map<String, dynamic>),
      location: data['location'] == null
          ? null
          : Location.fromMap(data['location'] as Map<String, dynamic>),
      image: data['image'] as String?,
      episode: data['episode'] as List<dynamic>?,
      url: data['url'] as String?,
      created: data['created'] == null
          ? null
          : DateTime.parse(data['created'] as String),
    );
  }

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'status': status,
        'species': species,
        'type': type,
        'gender': gender,
        'origin': origin?.toMap(),
        'location': location?.toMap(),
        'image': image,
        'episode': episode,
        'url': url,
        'created': created?.toIso8601String(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [CharacterResponse].
  factory CharacterResponse.fromJson(String data) {
    return CharacterResponse.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [CharacterResponse] to a JSON string.
  String toJson() => json.encode(toMap());
}

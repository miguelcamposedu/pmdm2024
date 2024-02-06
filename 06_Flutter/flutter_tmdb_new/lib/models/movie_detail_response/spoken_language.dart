import 'dart:convert';

class SpokenLanguage {
	String? englishName;
	String? iso6391;
	String? name;

	SpokenLanguage({this.englishName, this.iso6391, this.name});

	factory SpokenLanguage.fromMap(Map<String, dynamic> data) {
		return SpokenLanguage(
			englishName: data['english_name'] as String?,
			iso6391: data['iso_639_1'] as String?,
			name: data['name'] as String?,
		);
	}



	Map<String, dynamic> toMap() => {
				'english_name': englishName,
				'iso_639_1': iso6391,
				'name': name,
			};

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [SpokenLanguage].
	factory SpokenLanguage.fromJson(String data) {
		return SpokenLanguage.fromMap(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [SpokenLanguage] to a JSON string.
	String toJson() => json.encode(toMap());
}

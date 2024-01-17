import 'dart:convert';

class Origin {
	String? name;
	String? url;

	Origin({this.name, this.url});

	factory Origin.fromMap(Map<String, dynamic> data) => Origin(
				name: data['name'] as String?,
				url: data['url'] as String?,
			);

	Map<String, dynamic> toMap() => {
				'name': name,
				'url': url,
			};

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Origin].
	factory Origin.fromJson(String data) {
		return Origin.fromMap(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [Origin] to a JSON string.
	String toJson() => json.encode(toMap());
}

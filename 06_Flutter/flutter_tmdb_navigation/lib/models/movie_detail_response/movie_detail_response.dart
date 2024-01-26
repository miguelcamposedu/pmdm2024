import 'dart:convert';

import 'genre.dart';
import 'production_company.dart';
import 'production_country.dart';
import 'spoken_language.dart';

class MovieDetailResponse {
	bool? adult;
	String? backdropPath;
	dynamic belongsToCollection;
	int? budget;
	List<Genre>? genres;
	String? homepage;
	int? id;
	String? imdbId;
	String? originalLanguage;
	String? originalTitle;
	String? overview;
	double? popularity;
	String? posterPath;
	List<ProductionCompany>? productionCompanies;
	List<ProductionCountry>? productionCountries;
	String? releaseDate;
	int? revenue;
	int? runtime;
	List<SpokenLanguage>? spokenLanguages;
	String? status;
	String? tagline;
	String? title;
	bool? video;
	double? voteAverage;
	int? voteCount;

	MovieDetailResponse({
		this.adult, 
		this.backdropPath, 
		this.belongsToCollection, 
		this.budget, 
		this.genres, 
		this.homepage, 
		this.id, 
		this.imdbId, 
		this.originalLanguage, 
		this.originalTitle, 
		this.overview, 
		this.popularity, 
		this.posterPath, 
		this.productionCompanies, 
		this.productionCountries, 
		this.releaseDate, 
		this.revenue, 
		this.runtime, 
		this.spokenLanguages, 
		this.status, 
		this.tagline, 
		this.title, 
		this.video, 
		this.voteAverage, 
		this.voteCount, 
	});

	factory MovieDetailResponse.fromMap(Map<String, dynamic> data) {
		return MovieDetailResponse(
			adult: data['adult'] as bool?,
			backdropPath: data['backdrop_path'] as String?,
			belongsToCollection: data['belongs_to_collection'] as dynamic,
			budget: data['budget'] as int?,
			genres: (data['genres'] as List<dynamic>?)
						?.map((e) => Genre.fromMap(e as Map<String, dynamic>))
						.toList(),
			homepage: data['homepage'] as String?,
			id: data['id'] as int?,
			imdbId: data['imdb_id'] as String?,
			originalLanguage: data['original_language'] as String?,
			originalTitle: data['original_title'] as String?,
			overview: data['overview'] as String?,
			popularity: (data['popularity'] as num?)?.toDouble(),
			posterPath: data['poster_path'] as String?,
			productionCompanies: (data['production_companies'] as List<dynamic>?)
						?.map((e) => ProductionCompany.fromMap(e as Map<String, dynamic>))
						.toList(),
			productionCountries: (data['production_countries'] as List<dynamic>?)
						?.map((e) => ProductionCountry.fromMap(e as Map<String, dynamic>))
						.toList(),
			releaseDate: data['release_date'] as String?,
			revenue: data['revenue'] as int?,
			runtime: data['runtime'] as int?,
			spokenLanguages: (data['spoken_languages'] as List<dynamic>?)
						?.map((e) => SpokenLanguage.fromMap(e as Map<String, dynamic>))
						.toList(),
			status: data['status'] as String?,
			tagline: data['tagline'] as String?,
			title: data['title'] as String?,
			video: data['video'] as bool?,
			voteAverage: (data['vote_average'] as num?)?.toDouble(),
			voteCount: data['vote_count'] as int?,
		);
	}



	Map<String, dynamic> toMap() => {
				'adult': adult,
				'backdrop_path': backdropPath,
				'belongs_to_collection': belongsToCollection,
				'budget': budget,
				'genres': genres?.map((e) => e.toMap()).toList(),
				'homepage': homepage,
				'id': id,
				'imdb_id': imdbId,
				'original_language': originalLanguage,
				'original_title': originalTitle,
				'overview': overview,
				'popularity': popularity,
				'poster_path': posterPath,
				'production_companies': productionCompanies?.map((e) => e.toMap()).toList(),
				'production_countries': productionCountries?.map((e) => e.toMap()).toList(),
				'release_date': releaseDate,
				'revenue': revenue,
				'runtime': runtime,
				'spoken_languages': spokenLanguages?.map((e) => e.toMap()).toList(),
				'status': status,
				'tagline': tagline,
				'title': title,
				'video': video,
				'vote_average': voteAverage,
				'vote_count': voteCount,
			};

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [MovieDetailResponse].
	factory MovieDetailResponse.fromJson(String data) {
		return MovieDetailResponse.fromMap(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [MovieDetailResponse] to a JSON string.
	String toJson() => json.encode(toMap());
}

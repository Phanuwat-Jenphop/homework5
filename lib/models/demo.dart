
// POJO (Plain Old Java Object)
class Country {
  final String? name;
  final String? capital;
  final int? population;
  final String? flag;

  Country({
    required this.name,
    required this.capital,
    required this.population,
    required this.flag,
  });

  factory Country.fromJson(Map<String, dynamic> json) {
    // call back to country
    return Country(
      name: json['name'],
      capital: json['capital'],
      population: json['population'],
      flag: json['media']['flag'],
    );
  }
}

//--------------------------------------------------------------//

class Anime {
  final int? id;
  final String? title;
  final String? imdbId;
  final String? posterURL;

  Anime({
    required this.id,
    required this.title,
    required this.imdbId,
    required this.posterURL,
  });

  factory Anime.fromJson(Map<String, dynamic> json) {
    // call back to movies
    return Anime(
      id: json['id'],
      title: json['title'],
      imdbId: json['imdbId'],
      posterURL: json['posterURL'],
    );
  }
}


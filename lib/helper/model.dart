class ResultModel {
  List<Results>? results;
  ResultModel({this.results});
  ResultModel.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(new Results.fromJson(v));
      });
    }
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.results != null) {
      data['results'] = this.results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Result {
  final int? count;
  final String? next;
  final dynamic previous;
  final List<Results>? results;

  Result({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  Result.fromJson(Map<String, dynamic> json)
      : count = json['count'] as int?,
        next = json['next'] as String?,
        previous = json['previous'],
        results = (json['results'] as List?)?.map((dynamic e) => Results.fromJson(e as Map<String,dynamic>)).toList();

  Map<String, dynamic> toJson() => {
    'count' : count,
    'next' : next,
    'previous' : previous,
    'results' : results?.map((e) => e.toJson()).toList()
  };
}

class Results {
  final String? name;
  final String? height;
  final String? mass;
  final String? hairColor;
  final String? skinColor;
  final String? eyeColor;
  final String? birthYear;
  final String? gender;
  final String? homeworld;
  final List<String>? films;
  final List<dynamic>? species;
  final List<String>? vehicles;
  final List<String>? starships;
  final String? created;
  final String? edited;
  final String? url;

  Results({
    this.name,
    this.height,
    this.mass,
    this.hairColor,
    this.skinColor,
    this.eyeColor,
    this.birthYear,
    this.gender,
    this.homeworld,
    this.films,
    this.species,
    this.vehicles,
    this.starships,
    this.created,
    this.edited,
    this.url,
  });

  Results.fromJson(Map<String, dynamic> json)
      : name = json['name'] as String?,
        height = json['height'] as String?,
        mass = json['mass'] as String?,
        hairColor = json['hair_color'] as String?,
        skinColor = json['skin_color'] as String?,
        eyeColor = json['eye_color'] as String?,
        birthYear = json['birth_year'] as String?,
        gender = json['gender'] as String?,
        homeworld = json['homeworld'] as String?,
        films = (json['films'] as List?)?.map((dynamic e) => e as String).toList(),
        species = json['species'] as List?,
        vehicles = (json['vehicles'] as List?)?.map((dynamic e) => e as String).toList(),
        starships = (json['starships'] as List?)?.map((dynamic e) => e as String).toList(),
        created = json['created'] as String?,
        edited = json['edited'] as String?,
        url = json['url'] as String?;

  Map<String, dynamic> toJson() => {
    'name' : name,
    'height' : height,
    'mass' : mass,
    'hair_color' : hairColor,
    'skin_color' : skinColor,
    'eye_color' : eyeColor,
    'birth_year' : birthYear,
    'gender' : gender,
    'homeworld' : homeworld,
    'films' : films,
    'species' : species,
    'vehicles' : vehicles,
    'starships' : starships,
    'created' : created,
    'edited' : edited,
    'url' : url
  };
}
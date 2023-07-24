class PokemonInfoResponse {
  final List<AbilityResponse> abilities;
  final int baseExperience;
  final int height;
  final int id;
  final bool isDefault;
  final String name;
  final int order;
  final SpeciesResponse species;
  final SpritesResponse sprites;
  final List<TypeResponse> types;
  final List<StatResponse> stats;
  final int weight;

  PokemonInfoResponse({
    required this.abilities,
    required this.baseExperience,
    required this.height,
    required this.id,
    required this.isDefault,
    required this.name,
    required this.order,
    required this.species,
    required this.sprites,
    required this.types,
    required this.stats,
    required this.weight,
  });

  factory PokemonInfoResponse.fromJson(Map<String, dynamic> json) =>
      PokemonInfoResponse(
        abilities: List<AbilityResponse>.from(
            json["abilities"].map((x) => AbilityResponse.fromJson(x))),
        baseExperience: json["base_experience"],
        height: json["height"],
        id: json["id"],
        isDefault: json["is_default"],
        name: json["name"],
        order: json["order"],
        species: SpeciesResponse.fromJson(json["species"]),
        sprites: SpritesResponse.fromJson(json["sprites"]),
        types: List<TypeResponse>.from(
            json["types"].map((x) => TypeResponse.fromJson(x))),
        stats: List<StatResponse>.from(json["stats"].map((x) => StatResponse.fromJson(x))),
        weight: json["weight"],
      );

  Map<String, dynamic> toJson() => {
        "abilities": List<dynamic>.from(abilities.map((x) => x.toJson())),
        "base_experience": baseExperience,
        "height": height,
        "id": id,
        "is_default": isDefault,
        "name": name,
        "order": order,
        "sprites": sprites.toJson(),
        "types": List<dynamic>.from(types.map((x) => x.toJson())),
        "stats": List<dynamic>.from(stats.map((x) => x.toJson())),
        "weight": weight,
      };
}

class AbilityResponse {
  final SpeciesResponse ability;
  final bool isHidden;
  final int slot;

  AbilityResponse({
    required this.ability,
    required this.isHidden,
    required this.slot,
  });

  factory AbilityResponse.fromJson(Map<String, dynamic> json) =>
      AbilityResponse(
        ability: SpeciesResponse.fromJson(json["ability"]),
        isHidden: json["is_hidden"],
        slot: json["slot"],
      );

  Map<String, dynamic> toJson() => {
        "ability": ability.toJson(),
        "is_hidden": isHidden,
        "slot": slot,
      };
}

class SpritesResponse {
  final String backDefault;
  final String? backFemale;
  final String backShiny;
  final String? backShinyFemale;
  final String frontDefault;
  final String? frontFemale;
  final String frontShiny;
  final String? frontShinyFemale;

  SpritesResponse({
    required this.backDefault,
    this.backFemale,
    required this.backShiny,
    this.backShinyFemale,
    required this.frontDefault,
    this.frontFemale,
    required this.frontShiny,
    this.frontShinyFemale,
  });

  factory SpritesResponse.fromJson(Map<String, dynamic> json) =>
      SpritesResponse(
        backDefault: json["back_default"],
        backFemale: json["back_female"] ?? '',
        backShiny: json["back_shiny"],
        backShinyFemale: json["back_shiny_female"] ?? '',
        frontDefault: json["front_default"],
        frontFemale: json["front_female"] ?? '',
        frontShiny: json["front_shiny"],
        frontShinyFemale: json["front_shiny_female"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "back_default": backDefault,
        "back_female": backFemale,
        "back_shiny": backShiny,
        "back_shiny_female": backShinyFemale,
        "front_default": frontDefault,
        "front_female": frontFemale,
        "front_shiny": frontShiny,
        "front_shiny_female": frontShinyFemale,
      };
}

class TypeResponse {
  final int slot;
  final SpeciesResponse type;

  TypeResponse({
    required this.slot,
    required this.type,
  });

  factory TypeResponse.fromJson(Map<String, dynamic> json) => TypeResponse(
        slot: json["slot"],
        type: SpeciesResponse.fromJson(json["type"]),
      );

  Map<String, dynamic> toJson() => {
        "slot": slot,
        "type": type.toJson(),
      };
}

class SpeciesResponse {
  final String name;
  final String url;

  SpeciesResponse({
    required this.name,
    required this.url,
  });

  factory SpeciesResponse.fromJson(Map<String, dynamic> json) =>
      SpeciesResponse(
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
      };
}

class StatResponse {
  final int baseStat;
  final int effort;
  final SpeciesResponse stat;

  StatResponse({
    required this.baseStat,
    required this.effort,
    required this.stat,
  });

  factory StatResponse.fromJson(Map<String, dynamic> json) => StatResponse(
        baseStat: json["base_stat"],
        effort: json["effort"],
        stat: SpeciesResponse.fromJson(json["stat"]),
      );

  Map<String, dynamic> toJson() => {
        "base_stat": baseStat,
        "effort": effort,
        "stat": stat.toJson(),
      };
}

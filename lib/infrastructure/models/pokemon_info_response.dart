class PokemonInfoResponse {
  final int baseExperience;
  final int height;
  final int id;
  final bool isDefault;
  final String name;
  final int order;
  final SpritesResponse sprites;
  final List<TypeResponse> types;
  final int weight;

  PokemonInfoResponse({
    required this.baseExperience,
    required this.height,
    required this.id,
    required this.isDefault,
    required this.name,
    required this.order,
    required this.sprites,
    required this.types,
    required this.weight,
  });

  factory PokemonInfoResponse.fromJson(Map<String, dynamic> json) =>
      PokemonInfoResponse(
        baseExperience: json["base_experience"],
        height: json["height"],
        id: json["id"],
        isDefault: json["is_default"],
        name: json["name"],
        order: json["order"],
        sprites: SpritesResponse.fromJson(json["sprites"]),
        types: List<TypeResponse>.from(json["types"].map((x) => TypeResponse.fromJson(x))),
        weight: json["weight"],
      );

  Map<String, dynamic> toJson() => {
        "base_experience": baseExperience,
        "height": height,
        "id": id,
        "is_default": isDefault,
        "name": name,
        "order": order,
        "sprites": sprites.toJson(),
        "types": List<dynamic>.from(types.map((x) => x.toJson())),
        "weight": weight,
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

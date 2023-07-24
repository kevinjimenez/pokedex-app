class PokemonInfoResponse {
    final int baseExperience;
    final int height;
    final int id;
    final bool isDefault;
    final String name;
    final int order;
    final SpritesResponse sprites;
    final int weight;

    PokemonInfoResponse({
        required this.baseExperience,
        required this.height,
        required this.id,
        required this.isDefault,
        required this.name,
        required this.order,
        required this.sprites,
        required this.weight,
    });

    factory PokemonInfoResponse.fromJson(Map<String, dynamic> json) => PokemonInfoResponse(
        baseExperience: json["base_experience"],
        height: json["height"],
        id: json["id"],
        isDefault: json["is_default"],
        name: json["name"],
        order: json["order"],
        sprites: SpritesResponse.fromJson(json["sprites"]),
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

    factory SpritesResponse.fromJson(Map<String, dynamic> json) => SpritesResponse(
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

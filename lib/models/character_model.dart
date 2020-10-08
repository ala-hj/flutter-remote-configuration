import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'character_model.g.dart';

@JsonSerializable()
class CharactersModel extends Equatable {
  @JsonKey(name: 'docs')
  final List<CharacterModel> documents;
  final int total;
  final int limit;
  final int offset;
  final int page;
  final int pages;
  CharactersModel(this.total, this.limit, this.offset, this.page, this.pages,
      {this.documents});

  @override
  List<Object> get props => [documents, total, limit, offset, page, pages];
  factory CharactersModel.fromJson(Map<String, dynamic> json) =>
      _$CharactersModelFromJson(json);
  Map<String, dynamic> toJson() => _$CharactersModelToJson(this);
}

@JsonSerializable()
class CharacterModel extends Equatable {
  @JsonKey(name: '_id')
  final String id;
  final String height;
  final String race;
  final String birth;
  final String spouse;
  final String death;
  final String realm;
  final String hair;
  final String name;
  final String wikiUrl;

  CharacterModel(
      {this.id,
      this.birth,
      this.death,
      this.hair,
      this.height,
      this.name,
      this.race,
      this.realm,
      this.spouse,
      this.wikiUrl});
  @override
  List<Object> get props =>
      [id, birth, death, hair, height, name, realm, spouse, wikiUrl];
  factory CharacterModel.fromJson(Map<String, dynamic> json) =>
      _$CharacterModelFromJson(json);

  Map<String, dynamic> toJson() => _$CharacterModelToJson(this);
}

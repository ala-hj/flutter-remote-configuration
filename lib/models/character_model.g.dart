// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CharactersModel _$CharactersModelFromJson(Map<String, dynamic> json) {
  return CharactersModel(
    json['total'] as int,
    json['limit'] as int,
    json['offset'] as int,
    json['page'] as int,
    json['pages'] as int,
    documents: (json['docs'] as List)
        ?.map((e) => e == null
            ? null
            : CharacterModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$CharactersModelToJson(CharactersModel instance) =>
    <String, dynamic>{
      'docs': instance.documents,
      'total': instance.total,
      'limit': instance.limit,
      'offset': instance.offset,
      'page': instance.page,
      'pages': instance.pages,
    };

CharacterModel _$CharacterModelFromJson(Map<String, dynamic> json) {
  return CharacterModel(
    id: json['_id'] as String,
    birth: json['birth'] as String,
    death: json['death'] as String,
    hair: json['hair'] as String,
    height: json['height'] as String,
    name: json['name'] as String,
    race: json['race'] as String,
    realm: json['realm'] as String,
    spouse: json['spouse'] as String,
    wikiUrl: json['wikiUrl'] as String,
  );
}

Map<String, dynamic> _$CharacterModelToJson(CharacterModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'height': instance.height,
      'race': instance.race,
      'birth': instance.birth,
      'spouse': instance.spouse,
      'death': instance.death,
      'realm': instance.realm,
      'hair': instance.hair,
      'name': instance.name,
      'wikiUrl': instance.wikiUrl,
    };

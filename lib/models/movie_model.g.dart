// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MoviesModel _$MoviesModelFromJson(Map<String, dynamic> json) {
  return MoviesModel(
    (json['docs'] as List)
        ?.map((e) =>
            e == null ? null : MovieModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['total'] as int,
    json['limit'] as int,
    json['offset'] as int,
    json['page'] as int,
    json['pages'] as int,
  );
}

Map<String, dynamic> _$MoviesModelToJson(MoviesModel instance) =>
    <String, dynamic>{
      'docs': instance.documents,
      'total': instance.total,
      'limit': instance.limit,
      'offset': instance.offset,
      'page': instance.page,
      'pages': instance.pages,
    };

MovieModel _$MovieModelFromJson(Map<String, dynamic> json) {
  return MovieModel(
    json['_id'] as String,
    json['name'] as String,
    (json['runtimeInMinutes'] as num)?.toDouble(),
    (json['budgetInMillions'] as num)?.toDouble(),
    (json['boxOfficeRevenueInMillions'] as num)?.toDouble(),
    (json['academyAwardNominations'] as num)?.toDouble(),
    (json['academyAwardWins'] as num)?.toDouble(),
    (json['rottenTomatesScore'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$MovieModelToJson(MovieModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'runtimeInMinutes': instance.runtimeInMinutes,
      'budgetInMillions': instance.budgetInMillions,
      'boxOfficeRevenueInMillions': instance.boxOfficeRevenueInMillions,
      'academyAwardNominations': instance.academyAwardNominations,
      'academyAwardWins': instance.academyAwardWins,
      'rottenTomatesScore': instance.rottenTomatesScore,
    };

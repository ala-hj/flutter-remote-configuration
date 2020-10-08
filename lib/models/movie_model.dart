import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'movie_model.g.dart';

@JsonSerializable()
class MoviesModel extends Equatable {
  @JsonKey(name: 'docs')
  final List<MovieModel> documents;
  final int total;
  final int limit;
  final int offset;
  final int page;
  final int pages;

  MoviesModel(this.documents, this.total, this.limit, this.offset, this.page,
      this.pages);
  @override
  List<Object> get props => [documents, total, limit, offset, page, pages];

  factory MoviesModel.fromJson(Map<String, dynamic> json) =>
      _$MoviesModelFromJson(json);
  Map<String, dynamic> toJson() => _$MoviesModelToJson(this);
}

@JsonSerializable()
class MovieModel extends Equatable {
  @JsonKey(name: '_id')
  final String id;
  final String name;
  final double runtimeInMinutes;
  final double budgetInMillions;
  final double boxOfficeRevenueInMillions;
  final double academyAwardNominations;
  final double academyAwardWins;
  final double rottenTomatesScore;

  MovieModel(
      this.id,
      this.name,
      this.runtimeInMinutes,
      this.budgetInMillions,
      this.boxOfficeRevenueInMillions,
      this.academyAwardNominations,
      this.academyAwardWins,
      this.rottenTomatesScore);
  @override
  List<Object> get props => [
        id,
        name,
        runtimeInMinutes,
        budgetInMillions,
        boxOfficeRevenueInMillions,
        academyAwardNominations,
        academyAwardWins,
        rottenTomatesScore
      ];
  factory MovieModel.fromJson(Map<String, dynamic> json) =>
      _$MovieModelFromJson(json);
  Map<String, dynamic> toJson() => _$MovieModelToJson(this);
}

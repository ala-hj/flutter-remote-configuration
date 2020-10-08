import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'books_model.g.dart';

@JsonSerializable()
class BooksModel extends Equatable {
  @JsonKey(name: 'docs')
  final List<BookModel> documents;
  final int total;
  final int limit;
  final int offset;
  final int page;
  final int pages;

  BooksModel(
      {this.documents,
      this.limit,
      this.offset,
      this.page,
      this.pages,
      this.total});

  @override
  List<Object> get props => [documents, total, limit, offset, page, pages];
  factory BooksModel.fromJson(Map<String, dynamic> json) =>
      _$BooksModelFromJson(json);

  Map<String, dynamic> toJson() => _$BooksModelToJson(this);
}

@JsonSerializable()
class BookModel extends Equatable {
  @JsonKey(name: '_id')
  final String id;
  final String name;
  BookModel({this.id, this.name});
  @override
  List<Object> get props => [id, name];
  factory BookModel.fromJson(Map<String, dynamic> json) =>
      _$BookModelFromJson(json);
  Map<String, dynamic> toJson() => _$BookModelToJson(this);
}

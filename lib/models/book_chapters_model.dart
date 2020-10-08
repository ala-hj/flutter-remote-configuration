import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'book_chapters_model.g.dart';

@JsonSerializable()
class BookChaptersModel extends Equatable {
  @JsonKey(name: 'docs')
  final List<ChapterModel> documentsChapter;
  final int total;
  final int limit;
  final int offset;
  final int page;
  final int pages;

  BookChaptersModel(
      {this.documentsChapter,
      this.limit,
      this.offset,
      this.page,
      this.pages,
      this.total});

  @override
  List<Object> get props =>
      [documentsChapter, total, limit, offset, page, pages];
  factory BookChaptersModel.fromJson(Map<String, dynamic> json) =>
      _$BookChaptersModelFromJson(json);
  Map<String, dynamic> toJson() => _$BookChaptersModelToJson(this);
}

@JsonSerializable()
class ChapterModel extends Equatable {
  @JsonKey(name: '_id')
  final String id;
  final String bookName;
  final String chapterName;
  ChapterModel({this.id, this.bookName, this.chapterName});
  @override
  List<Object> get props => [id, bookName, chapterName];

  factory ChapterModel.fromJson(Map<String, dynamic> json) =>
      _$ChapterModelFromJson(json);

  Map<String, dynamic> toJson() => _$ChapterModelToJson(this);
}

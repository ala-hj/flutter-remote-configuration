// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_chapters_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookChaptersModel _$BookChaptersModelFromJson(Map<String, dynamic> json) {
  return BookChaptersModel(
    documentsChapter: (json['docs'] as List)
        ?.map((e) =>
            e == null ? null : ChapterModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    limit: json['limit'] as int,
    offset: json['offset'] as int,
    page: json['page'] as int,
    pages: json['pages'] as int,
    total: json['total'] as int,
  );
}

Map<String, dynamic> _$BookChaptersModelToJson(BookChaptersModel instance) =>
    <String, dynamic>{
      'docs': instance.documentsChapter,
      'total': instance.total,
      'limit': instance.limit,
      'offset': instance.offset,
      'page': instance.page,
      'pages': instance.pages,
    };

ChapterModel _$ChapterModelFromJson(Map<String, dynamic> json) {
  return ChapterModel(
    id: json['_id'] as String,
    bookName: json['bookName'] as String,
    chapterName: json['chapterName'] as String,
  );
}

Map<String, dynamic> _$ChapterModelToJson(ChapterModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'bookName': instance.bookName,
      'chapterName': instance.chapterName,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'books_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BooksModel _$BooksModelFromJson(Map<String, dynamic> json) {
  return BooksModel(
    documents: (json['docs'] as List)
        ?.map((e) =>
            e == null ? null : BookModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    limit: json['limit'] as int,
    offset: json['offset'] as int,
    page: json['page'] as int,
    pages: json['pages'] as int,
    total: json['total'] as int,
  );
}

Map<String, dynamic> _$BooksModelToJson(BooksModel instance) =>
    <String, dynamic>{
      'docs': instance.documents,
      'total': instance.total,
      'limit': instance.limit,
      'offset': instance.offset,
      'page': instance.page,
      'pages': instance.pages,
    };

BookModel _$BookModelFromJson(Map<String, dynamic> json) {
  return BookModel(
    id: json['_id'] as String,
    name: json['name'] as String,
  );
}

Map<String, dynamic> _$BookModelToJson(BookModel instance) => <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
    };

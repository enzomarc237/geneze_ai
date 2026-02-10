import 'package:equatable/equatable.dart';

class Document extends Equatable {
  final String id;
  final String title;
  final String content;
  final DateTime lastModified;

  const Document({
    required this.id,
    required this.title,
    required this.content,
    required this.lastModified,
  });

  Document copyWith({
    String? id,
    String? title,
    String? content,
    DateTime? lastModified,
  }) {
    return Document(
      id: id ?? this.id,
      title: title ?? this.title,
      content: content ?? this.content,
      lastModified: lastModified ?? this.lastModified,
    );
  }

  @override
  List<Object> get props => [id, title, content, lastModified];
}
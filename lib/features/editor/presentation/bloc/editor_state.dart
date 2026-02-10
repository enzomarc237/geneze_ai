part of 'editor_bloc.dart';

enum EditorStatus { initial, loading, saving, success, failure }

class EditorState extends Equatable {
  final EditorStatus status;
  final Document document;

  const EditorState({
    this.status = EditorStatus.initial,
    required this.document,
  });

  EditorState copyWith({
    EditorStatus? status,
    Document? document,
  }) {
    return EditorState(
      status: status ?? this.status,
      document: document ?? this.document,
    );
  }

  @override
  List<Object> get props => [status, document];
}
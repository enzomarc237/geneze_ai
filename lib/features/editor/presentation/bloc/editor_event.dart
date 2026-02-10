part of 'editor_bloc.dart';

abstract class EditorEvent extends Equatable {
  const EditorEvent();

  @override
  List<Object> get props => [];
}

class EditorContentChanged extends EditorEvent {
  final String content;

  const EditorContentChanged(this.content);

  @override
  List<Object> get props => [content];
}

class EditorTitleChanged extends EditorEvent {
  final String title;

  const EditorTitleChanged(this.title);

  @override
  List<Object> get props => [title];
}
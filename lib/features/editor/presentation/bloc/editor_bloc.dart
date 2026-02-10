import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geneze/features/editor/domain/entities/document.dart';
import 'package:uuid/uuid.dart';

part 'editor_event.dart';
part 'editor_state.dart';

class EditorBloc extends Bloc<EditorEvent, EditorState> {
  EditorBloc() : super(EditorState(
    document: Document(
      id: const Uuid().v4(),
      title: 'Untitled',
      content: '# Welcome to Geneze\nStart typing...', 
      lastModified: DateTime.now()
    )
  )) {
    on<EditorContentChanged>(_onContentChanged);
    on<EditorTitleChanged>(_onTitleChanged);
  }

  void _onContentChanged(EditorContentChanged event, Emitter<EditorState> emit) {
    final updatedDoc = state.document.copyWith(
      content: event.content,
      lastModified: DateTime.now(),
    );
    emit(state.copyWith(document: updatedDoc));
  }

  void _onTitleChanged(EditorTitleChanged event, Emitter<EditorState> emit) {
    final updatedDoc = state.document.copyWith(
      title: event.title,
      lastModified: DateTime.now(),
    );
    emit(state.copyWith(document: updatedDoc));
  }
}
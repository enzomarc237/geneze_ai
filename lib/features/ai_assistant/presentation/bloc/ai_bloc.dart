import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geneze/features/ai_assistant/domain/repositories/ai_repository.dart';

part 'ai_event.dart';
part 'ai_state.dart';

class AiBloc extends Bloc<AiEvent, AiState> {
  final AiRepository repository;

  AiBloc({required this.repository}) : super(const AiState()) {
    on<AiPromptSubmitted>(_onPromptSubmitted);
    on<AiRephraseRequested>(_onRephraseRequested);
  }

  Future<void> _onPromptSubmitted(AiPromptSubmitted event, Emitter<AiState> emit) async {
    emit(state.copyWith(status: AiStatus.loading));
    try {
      final result = await repository.generateSuggestion(event.prompt);
      emit(state.copyWith(status: AiStatus.success, result: result));
    } catch (e) {
      emit(state.copyWith(status: AiStatus.failure, errorMessage: e.toString()));
    }
  }

  Future<void> _onRephraseRequested(AiRephraseRequested event, Emitter<AiState> emit) async {
    emit(state.copyWith(status: AiStatus.loading));
    try {
      final result = await repository.rephraseText(event.text);
      emit(state.copyWith(status: AiStatus.success, result: result));
    } catch (e) {
      emit(state.copyWith(status: AiStatus.failure, errorMessage: e.toString()));
    }
  }
}
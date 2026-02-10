part of 'ai_bloc.dart';

abstract class AiEvent extends Equatable {
  const AiEvent();

  @override
  List<Object> get props => [];
}

class AiPromptSubmitted extends AiEvent {
  final String prompt;

  const AiPromptSubmitted(this.prompt);

  @override
  List<Object> get props => [prompt];
}

class AiRephraseRequested extends AiEvent {
  final String text;

  const AiRephraseRequested(this.text);

  @override
  List<Object> get props => [text];
}
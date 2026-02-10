part of 'ai_bloc.dart';

enum AiStatus { initial, loading, success, failure }

class AiState extends Equatable {
  final AiStatus status;
  final String result;
  final String? errorMessage;

  const AiState({
    this.status = AiStatus.initial,
    this.result = '',
    this.errorMessage,
  });

  AiState copyWith({
    AiStatus? status,
    String? result,
    String? errorMessage,
  }) {
    return AiState(
      status: status ?? this.status,
      result: result ?? this.result,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, result, errorMessage];
}
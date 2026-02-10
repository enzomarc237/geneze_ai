import 'package:geneze/features/ai_assistant/domain/repositories/ai_repository.dart';

class AiRepositoryImpl implements AiRepository {
  // In a real app, inject Dio client here
  
  @override
  Future<String> generateSuggestion(String prompt) async {
    // Simulate network delay
    await Future.delayed(const Duration(seconds: 2));
    return "Here is a generated suggestion based on: $prompt. \n\nGeneze AI suggests expanding on the topic of Flutter architecture.";
  }

  @override
  Future<String> rephraseText(String text) async {
    await Future.delayed(const Duration(seconds: 1));
    return "[Rephrased] $text";
  }
}
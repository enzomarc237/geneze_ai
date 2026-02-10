abstract class AiRepository {
  /// Generates text completion based on the prompt.
  Future<String> generateSuggestion(String prompt);
  
  /// Rephrases the selected text.
  Future<String> rephraseText(String text);
}
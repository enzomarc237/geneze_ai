import 'package:get_it/get_it.dart';
import 'package:geneze/features/ai_assistant/data/repositories/ai_repository_impl.dart';
import 'package:geneze/features/ai_assistant/domain/repositories/ai_repository.dart';

final getIt = GetIt.instance;

void setupLocator() {
  // Services
  // getIt.registerLazySingleton<ApiClient>(() => ApiClient());

  // Repositories
  getIt.registerLazySingleton<AiRepository>(() => AiRepositoryImpl());

  // Blocs are usually provided via BlocProvider in the UI tree, 
  // but if needed as singletons, register here.
}
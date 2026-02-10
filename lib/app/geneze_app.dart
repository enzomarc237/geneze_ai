import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:macos_ui/macos_ui.dart';
import 'package:geneze/core/di/service_locator.dart';
import 'package:geneze/core/theme/app_theme.dart';
import 'package:geneze/features/editor/presentation/pages/editor_layout.dart';
import 'package:geneze/features/ai_assistant/presentation/bloc/ai_bloc.dart';
import 'package:geneze/features/editor/presentation/bloc/editor_bloc.dart';

class GenezeApp extends StatelessWidget {
  const GenezeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => EditorBloc()),
        BlocProvider(create: (_) => AiBloc(repository: getIt())),
      ],
      child: MacosApp(
        title: 'Geneze',
        theme: AppTheme.light,
        darkTheme: AppTheme.dark,
        themeMode: ThemeMode.system,
        debugShowCheckedModeBanner: false,
        home: const EditorLayout(),
      ),
    );
  }
}
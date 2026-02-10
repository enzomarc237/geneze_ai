import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:macos_ui/macos_ui.dart';
import 'package:geneze/features/ai_assistant/presentation/bloc/ai_bloc.dart';

class AiSidebar extends StatefulWidget {
  const AiSidebar({super.key});

  @override
  State<AiSidebar> createState() => _AiSidebarState();
}

class _AiSidebarState extends State<AiSidebar> {
  final TextEditingController _promptController = TextEditingController();

  @override
  void dispose() {
    _promptController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('AI Assistant', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          const SizedBox(height: 16),
          MacosTextField(
            controller: _promptController,
            placeholder: 'Ask AI to write something...',
            maxLines: 4,
          ),
          const SizedBox(height: 10),
          PushButton(
            buttonSize: ButtonSize.large,
            child: const Text('Generate'),
            onPressed: () {
              if (_promptController.text.isNotEmpty) {
                context.read<AiBloc>().add(AiPromptSubmitted(_promptController.text));
              }
            },
          ),
          const Divider(height: 32),
          Expanded(
            child: BlocBuilder<AiBloc, AiState>(
              builder: (context, state) {
                if (state.status == AiStatus.loading) {
                  return const Center(child: ProgressCircle());
                }
                if (state.status == AiStatus.failure) {
                  return Text('Error: ${state.errorMessage}', style: const TextStyle(color: Colors.red));
                }
                if (state.status == AiStatus.success) {
                  return SingleChildScrollView(
                    child: SelectableText(state.result),
                  );
                }
                return const Text('Results will appear here...', style: TextStyle(color: Colors.grey));
              },
            ),
          ),
        ],
      ),
    );
  }
}
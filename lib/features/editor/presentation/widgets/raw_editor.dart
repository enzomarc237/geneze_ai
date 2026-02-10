import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:macos_ui/macos_ui.dart';
import 'package:geneze/features/editor/presentation/bloc/editor_bloc.dart';

class RawEditor extends StatefulWidget {
  const RawEditor({super.key});

  @override
  State<RawEditor> createState() => _RawEditorState();
}

class _RawEditorState extends State<RawEditor> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    final state = context.read<EditorBloc>().state;
    _controller = TextEditingController(text: state.document.content);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MacosTextField(
      controller: _controller,
      maxLines: null,
      minLines: 20,
      placeholder: 'Type your markdown here...',
      onChanged: (value) {
        context.read<EditorBloc>().add(EditorContentChanged(value));
      },
      style: const TextStyle(
        fontFamily: 'Courier',
        fontSize: 16,
      ),
    );
  }
}
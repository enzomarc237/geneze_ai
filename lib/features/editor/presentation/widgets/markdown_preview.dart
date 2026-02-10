import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:geneze/features/editor/presentation/bloc/editor_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

class MarkdownPreview extends StatelessWidget {
  const MarkdownPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditorBloc, EditorState>(
      builder: (context, state) {
        return Markdown(
          data: state.document.content,
          selectable: true,
          onTapLink: (text, href, title) {
             if (href != null) launchUrl(Uri.parse(href));
          },
        );
      },
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:macos_ui/macos_ui.dart';
import 'package:geneze/features/editor/presentation/widgets/markdown_preview.dart';
import 'package:geneze/features/editor/presentation/widgets/raw_editor.dart';
import 'package:geneze/features/ai_assistant/presentation/widgets/ai_sidebar.dart';
import 'package:geneze/features/editor/presentation/bloc/editor_bloc.dart';

class EditorLayout extends StatefulWidget {
  const EditorLayout({super.key});

  @override
  State<EditorLayout> createState() => _EditorLayoutState();
}

class _EditorLayoutState extends State<EditorLayout> {
  int _pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MacosWindow(
      sidebar: Sidebar(
        minWidth: 200,
        builder: (context, scrollController) => SidebarItems(
          currentIndex: _pageIndex,
          onChanged: (i) => setState(() => _pageIndex = i),
          items: const [
            SidebarItem(
              leading: MacosIcon(Icons.edit_note),
              label: Text('Drafts'),
            ),
            SidebarItem(
              leading: MacosIcon(Icons.settings),
              label: Text('Settings'),
            ),
          ],
        ),
      ),
      endSidebar: Sidebar(
        minWidth: 280,
        startWidth: 300,
        maxWidth: 400,
        builder: (context, scrollController) => const AiSidebar(),
      ),
      child: MacosScaffold(
        toolBar: ToolBar(
          title: const Text('Geneze'),
          titleWidth: 150.0,
          actions: [
            ToolBarIconButton(
              label: 'Save',
              icon: const MacosIcon(Icons.save),
              showLabel: false,
              onPressed: () => debugPrint('Save pressed'),
            ),
          ],
        ),
        children: [
          ContentArea(
            builder: (context, scrollController) {
              return Row(
                children: [
                  // Left: Raw Text Editor
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: const RawEditor(),
                    ),
                  ),
                  // Divider
                  const VerticalDivider(width: 1),
                  // Right: Markdown Preview
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: const MarkdownPreview(),
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
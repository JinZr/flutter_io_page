import 'package:flutter/material.dart';

import 'package:zr_jin_page/utilities/launch_url.dart';

class LinkToolbar extends StatelessWidget {
  const LinkToolbar({super.key, required this.floating});

  final bool floating;
  static const double _textBreakpoint = 600;

  Widget _buildTonalButton({
    required bool showIconAndText,
    required IconData icon,
    required String label,
    required VoidCallback onPressed,
  }) {
    if (showIconAndText) {
      return FilledButton.icon(
        onPressed: onPressed,
        icon: Icon(icon),
        label: Text(label),
      );
    }

    return FilledButton(onPressed: onPressed, child: Text(label));
  }

  Widget _buildTextButton({
    required bool showIconAndText,
    required IconData icon,
    required String label,
    required VoidCallback onPressed,
  }) {
    if (showIconAndText) {
      return TextButton.icon(
        onPressed: onPressed,
        icon: Icon(icon),
        label: Text(label),
      );
    }

    return TextButton(onPressed: onPressed, child: Text(label));
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final EdgeInsets margin = floating
        ? const EdgeInsets.fromLTRB(16, 0, 16, 12)
        : EdgeInsets.zero;
    final BorderRadius borderRadius = BorderRadius.circular(
      floating ? 28.0 : 0.0,
    );
    final Color backgroundColor = floating
        ? theme.colorScheme.surfaceContainerHighest
        : theme.colorScheme.surfaceContainer;

    return SafeArea(
      top: false,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final bool showIconAndText = constraints.maxWidth >= _textBreakpoint;
          return AnimatedContainer(
            duration: const Duration(milliseconds: 220),
            curve: Curves.easeOutCubic,
            margin: margin,
            child: Material(
              color: Colors.transparent,
              elevation: floating ? 6.0 : 0.0,
              shadowColor: theme.colorScheme.shadow,
              surfaceTintColor: Colors.transparent,
              shape: RoundedRectangleBorder(borderRadius: borderRadius),
              clipBehavior: Clip.antiAlias,
              child: Ink(
                decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius: borderRadius,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  child: OverflowBar(
                    alignment: MainAxisAlignment.center,
                    overflowAlignment: OverflowBarAlignment.center,
                    spacing: 8,
                    overflowSpacing: 8,
                    children: [
                      _buildTonalButton(
                        showIconAndText: showIconAndText,
                        icon: Icons.school,
                        label: 'Google Scholar',
                        onPressed: () => launchURL(
                          'https://scholar.google.com/citations?user=kgH1mk0AAAAJ&hl=en',
                        ),
                      ),
                      _buildTextButton(
                        showIconAndText: showIconAndText,
                        icon: Icons.code,
                        label: 'GitHub',
                        onPressed: () => launchURL('https://github.com/JinZr'),
                      ),
                      _buildTextButton(
                        showIconAndText: showIconAndText,
                        icon: Icons.science,
                        label: 'ResearchGate',
                        onPressed: () => launchURL(
                          'https://www.researchgate.net/profile/Zengrui-Jin',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'package:zr_jin_page/utilities/launch_url.dart';

const double linkTextBreakpoint = 600;
// Keep Pro Max-class widths on the full action row.
const double linkOverflowBreakpoint = 430;
const double linkAppBarInlineSecondaryBreakpoint = 1100;

class LinkToolbar extends StatelessWidget {
  const LinkToolbar({super.key, required this.floating});

  final bool floating;

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
          final List<Widget> actions = buildLinkActions(
            width: constraints.maxWidth,
          );

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
                    children: actions,
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

List<Widget> buildLinkAppBarActions({required double screenWidth}) {
  final actions = <Widget>[_buildScholarFilledButton()];

  if (screenWidth >= linkAppBarInlineSecondaryBreakpoint) {
    actions.addAll([
      _buildTextButton(
        showIconAndText: false,
        icon: Icons.code,
        label: 'GitHub',
        onPressed: () => launchURL('https://github.com/JinZr'),
      ),
      _buildTextButton(
        showIconAndText: false,
        icon: Icons.science,
        label: 'ResearchGate',
        onPressed: () =>
            launchURL('https://www.researchgate.net/profile/Zengrui-Jin'),
      ),
    ]);
  } else {
    actions.add(_buildOverflowMenuButton());
  }

  return actions;
}

List<Widget> buildLinkActions({required double width}) {
  final bool showIconAndText = width >= linkTextBreakpoint;
  final bool useOverflowActions = width < linkOverflowBreakpoint;

  final Widget primaryAction = _buildTonalButton(
    showIconAndText: showIconAndText,
    icon: Icons.school,
    label: 'Google Scholar',
    onPressed: () => launchURL(
      'https://scholar.google.com/citations?user=kgH1mk0AAAAJ&hl=en',
    ),
  );

  if (useOverflowActions) {
    return [primaryAction, _buildOverflowMenuButton()];
  }

  return [
    primaryAction,
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
      onPressed: () =>
          launchURL('https://www.researchgate.net/profile/Zengrui-Jin'),
    ),
  ];
}

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

Widget _buildOverflowMenuButton() {
  return PopupMenuButton<_SecondaryLink>(
    tooltip: 'More links',
    icon: const Icon(Icons.more_vert),
    onSelected: (value) {
      switch (value) {
        case _SecondaryLink.github:
          launchURL('https://github.com/JinZr');
        case _SecondaryLink.researchGate:
          launchURL('https://www.researchgate.net/profile/Zengrui-Jin');
      }
    },
    itemBuilder: (context) => const [
      PopupMenuItem<_SecondaryLink>(
        value: _SecondaryLink.github,
        child: ListTile(leading: Icon(Icons.code), title: Text('GitHub')),
      ),
      PopupMenuItem<_SecondaryLink>(
        value: _SecondaryLink.researchGate,
        child: ListTile(
          leading: Icon(Icons.science),
          title: Text('ResearchGate'),
        ),
      ),
    ],
  );
}

Widget _buildScholarFilledButton() {
  return FilledButton(
    onPressed: () => launchURL(
      'https://scholar.google.com/citations?user=kgH1mk0AAAAJ&hl=en',
    ),
    child: const Text('Google Scholar'),
  );
}

enum _SecondaryLink { github, researchGate }

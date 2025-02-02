import 'package:base/base.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class MtpSearchBar extends StatefulWidget {
  const MtpSearchBar({
    super.key,
    required this.onChanged,
    this.hintText,
  });
  final Function(String) onChanged;
  final String? hintText;

  @override
  State<MtpSearchBar> createState() => _MtpSearchBarState();
}

class _MtpSearchBarState extends State<MtpSearchBar> {
  late TextEditingController controller;
  final Debouncer _searchDebouncer = Debouncer();

  @override
  void initState() {
    controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      hintStyle: WidgetStateProperty.resolveWith(
        (states) => context.textTheme.bodyLarge?.copyWith(
          color: context.colorScheme.textMediumEmphasis,
        ),
      ),
      controller: controller,
      constraints: const BoxConstraints(minHeight: 48.0),
      elevation: WidgetStateProperty.all(0),
      padding: WidgetStateProperty.all(
        const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
      ),
      backgroundColor: WidgetStateProperty.all(
        context.colorScheme.surface,
      ),
      shape: WidgetStateProperty.all(
        RoundedRectangleBorder(
          side: BorderSide(
            color: context.colorScheme.outline,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(24),
        ),
      ),
      trailing: controller.text.isNotEmpty
          ? [
              IconButton(
                icon: const Icon(Icons.clear),
                onPressed: () {
                  setState(() {
                    controller.clear();
                    widget.onChanged('');
                  });
                },
              )
            ]
          : [],
      leading: const Icon(Icons.search),
      hintText: widget.hintText,
      onChanged: (value) {
        setState(() {
          _searchDebouncer(() {
            widget.onChanged(value);
          });
        });
      },
    );
  }
}

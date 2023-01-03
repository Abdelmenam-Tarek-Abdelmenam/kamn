import 'package:flutter/material.dart';

import '../../resources/styles_manager.dart';

class DefaultDropDownMenu extends StatelessWidget {
  const DefaultDropDownMenu(
      {required this.title,
      this.prefix,
      required this.items,
      required this.onChanged,
      Key? key})
      : super(key: key);

  final String title;
  final List<DropdownMenuItem> items;
  final IconData? prefix;
  final Function(dynamic) onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: PaddingManager.p8.copyWith(top: 2),
      // decoration: BoxDecoration(
      //     borderRadius: StyleManager.border,
      //     border: Border.all(
      //         width: 3,
      //         color: Theme.of(context).colorScheme.primary.withOpacity(0.8)),
      //     color: Colors.transparent),
      child: DropdownButtonFormField(
        items: items,
        dropdownColor:
            Theme.of(context).colorScheme.onPrimary.withOpacity(0.65),
        onChanged: onChanged,
        style: Theme.of(context).textTheme.labelLarge!.copyWith(
            color: Theme.of(context).colorScheme.primary.withOpacity(0.8),
            fontSize: 16),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(horizontal: 10.0),
          errorStyle: const TextStyle(fontSize: 10),
          errorBorder: InputBorder.none,
          border: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.primary.withOpacity(0.8),
                  width: 3)),
          prefixIcon: prefix == null
              ? null
              : Icon(prefix,
                  size: 20, color: Theme.of(context).colorScheme.primary),
          labelText: title,
          labelStyle: TextStyle(
            fontSize: 16,
            color: Theme.of(context).colorScheme.primary.withOpacity(0.8),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../models/item.dart';

class LineBoard extends StatelessWidget {
  final List<Item> values;
  final Function onTap;
  const LineBoard({super.key, required this.values, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: values
          .map(
            (e) => Expanded(
              child: _ItemBoard(
                value: e,
                onTap: onTap,
              ),
            ),
          )
          .toList(),
    );
  }
}

class _ItemBoard extends StatelessWidget {
  final Item value;
  final Function onTap;
  const _ItemBoard({
    super.key,
    required this.value,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textStyle = theme.textTheme.headlineMedium;
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Material(
        color: value.isBlank ? Colors.purple : Colors.white,
        child: InkWell(
          onTap: () => onTap(value),
          child: Container(
            height: 68,
            padding: const EdgeInsets.all(16),
            child: Align(
              alignment: AlignmentDirectional.center,
              child: Text(
                value.toString(),
                style: textStyle,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

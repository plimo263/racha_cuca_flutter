import 'package:flutter/material.dart';

import '../models/item.dart';

class LineBoard extends StatelessWidget {
  final List<Item> values;
  final Function onTap;
  final Color color;
  const LineBoard(
      {super.key,
      required this.values,
      required this.onTap,
      required this.color});

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
                color: color,
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
  final Color color;
  const _ItemBoard({
    Key? key,
    required this.value,
    required this.onTap,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textStyle = theme.textTheme.headlineMedium;
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Material(
        color: value.isBlank ? color : Colors.white,
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

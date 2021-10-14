import 'package:flutter/material.dart';

import '../../shared.dart';

class TextForm extends StatelessWidget {

  final String text;
  const TextForm({
    required this.text,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyles.textForm,
    );
  }
}

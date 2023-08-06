import 'package:cat_trivia/l10n/l10n.dart';
import 'package:flutter/material.dart';

class AndroidAlert extends StatelessWidget {
  const AndroidAlert({
    super.key,
    required this.title,
    required this.message,
    this.ok,
    this.cancel,
  });

  final String title;
  final String message;
  final String? ok;
  final String? cancel;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return AlertDialog(
      title: Text(title),
      content: Text(message),
      actions: [
        TextButton(
          style: TextButton.styleFrom(
            textStyle: Theme.of(context).textTheme.labelLarge,
          ),
          onPressed: () {
            Navigator.of(context).pop(false);
          },
          child: Text(cancel ?? l10n.cancel),
        ),
        TextButton(
          style: TextButton.styleFrom(
            textStyle: Theme.of(context).textTheme.labelLarge,
          ),
          onPressed: () {
            Navigator.of(context).pop(true);
          },
          child: Text(ok ?? l10n.ok),
        ),
      ],
    );
  }
}

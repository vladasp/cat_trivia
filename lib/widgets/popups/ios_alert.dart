import 'package:cat_trivia/l10n/l10n.dart';
import 'package:flutter/cupertino.dart';

class IOSAlert extends StatelessWidget {
  const IOSAlert({
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

    return CupertinoAlertDialog(
      title: Text(title),
      content: Text(message),
      actions: [
        CupertinoDialogAction(
          child: Text(cancel ?? l10n.cancel),
          onPressed: () => Navigator.of(context).pop(false),
        ),
        CupertinoDialogAction(
          child: Text(ok ?? l10n.ok),
          onPressed: () => Navigator.of(context).pop(true),
        ),
      ],
    );
  }
}

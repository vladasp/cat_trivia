part of history_part;

class FactDetails extends StatefulWidget {
  const FactDetails({required this.model, super.key});
  static const route = '/details';
  final FactUIModel model;

  @override
  State<FactDetails> createState() => _FactDetailsState();
}

class _FactDetailsState extends State<FactDetails> {
  late final theme = Theme.of(context);
  late final colors = theme.extension<AppColorScheme>()!;
  late final styles = theme.extension<AppTextStyle>()!;
  late final l10n = context.l10n;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.backgroundColor,
      appBar: AppBar(
        backgroundColor: colors.primaryColor,
        iconTheme: IconThemeData(color: colors.accentColor),
      ),
      body: SingleChildScrollView(
        child: FactCard(
          model: widget.model,
          margin: const EdgeInsets.fromLTRB(16, 24, 16, 36),
        ),
      ),
    );
  }
}

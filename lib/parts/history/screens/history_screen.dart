part of history_part;

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  late final theme = Theme.of(context);
  late final colors = theme.extension<AppColorScheme>()!;
  late final styles = theme.extension<AppTextStyle>()!;
  late final l10n = context.l10n;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HistoryBloc, HistoryState>(
      listener: (context, state) {
        loading(context, visibility: state.isBusy);
        if (state is GoToDetailsState) {
          context.push(FactDetails.route, extra: state.model);
        }
      },
      builder: (builder, state) => Scaffold(
        backgroundColor: colors.backgroundColor,
        appBar: AppBar(
          iconTheme: IconThemeData(color: colors.accentColor),
          title: Text(l10n.factHistory, style: styles.headline),
          backgroundColor: colors.primaryColor,
          actions: [
            IconButton(
              onPressed: () {
                Popup.showAlert(
                  title: l10n.attention,
                  message: l10n.clearHistory,
                ).then((result) {
                  if (result) {
                    context.read<HistoryBloc>().add(ClearHistoryEvent());
                  }
                });
              },
              icon: Icon(Icons.delete, color: colors.accentColor),
            ),
          ],
        ),
        body: ListView.separated(
          padding: const EdgeInsets.symmetric(vertical: 16),
          itemBuilder: (context, index) {
            return FactListItem(
              model: state.models[index],
              onPressed: () {
                if (kDebugMode) {
                  print(index);
                }
                context
                    .read<HistoryBloc>()
                    .add(GoToDetailsEvent(state.models[index]));
              },
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(height: 8);
          },
          itemCount: state.models.length,
        ),
      ),
    );
  }
}

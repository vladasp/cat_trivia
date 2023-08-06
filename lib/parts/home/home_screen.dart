part of home_part;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final theme = Theme.of(context);
  late final colors = theme.extension<AppColorScheme>()!;
  late final styles = theme.extension<AppTextStyle>()!;
  late final l10n = context.l10n;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {
        loading(context, visibility: state.isBusy);
        if (state is GoToHistoryState) {
          context.push(HistoryPart.route);
        }
      },
      builder: (builder, state) => Scaffold(
        backgroundColor: colors.backgroundColor,
        body: Stack(
          children: [
            Container(height: double.infinity),
            SingleChildScrollView(
              child: FactCard(
                model: state.model,
                margin: const EdgeInsets.fromLTRB(16, 56, 16, 86),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: 24,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                          colors.backgroundColor!.withOpacity(0),
                          colors.backgroundColor!
                        ])),
                  ),
                  Container(
                    padding:
                        EdgeInsets.only(bottom: Platform.isAndroid ? 16 : 36),
                    color: colors.backgroundColor,
                    child: Row(
                      children: [
                        const SizedBox(width: 24),
                        Button(
                          title: l10n.anotherFact,
                          onPressed: () {
                            context.read<HomeBloc>().add(NextFactEvent());
                          },
                        ),
                        const SizedBox(width: 24),
                        Button(
                          title: l10n.factHistory,
                          onPressed: () {
                            context.read<HomeBloc>().add(GoToHistoryEvent());
                          },
                        ),
                        const SizedBox(width: 24),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

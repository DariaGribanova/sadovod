import 'package:auto_route/auto_route.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'works_page_wm.dart';

@RoutePage()
class WorksPageWidget extends ElementaryWidget<IWorksPageWidgetModel> {
  const WorksPageWidget({
    Key? key,
    WidgetModelFactory wmFactory = defaultWorksPageWidgetModelFactory,
  }) : super(wmFactory, key: key);

  @override
  Widget build(IWorksPageWidgetModel wm) {
    final theme = wm.theme;
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Работы"),
          centerTitle: true,
          // bottom: (wm.isLoggedIn)
          //     ? const TabBar(
          //         tabs: [
          //           Tab(
          //               icon: Icon(Icons.trending_up_rounded),
          //               child: Text('Рекомендации')),
          //           Tab(
          //               icon: Icon(Icons.remove_done_rounded),
          //               child: Text('Невыполненные')),
          //           Tab(
          //               icon: Icon(Icons.done_all_rounded),
          //               child: Text('Выполненные')),
          //         ],
          //       )
          //     : null,
        ),
        body: StreamBuilder<bool>(
          stream: wm.isLoggedIn,
          initialData: null,
          builder: (context, snapshot) {
            if (snapshot.data == true) {
              return Column(
                children: [
                  TabBar(
                    indicatorColor: theme.colorScheme.primary,
                    labelColor: theme.colorScheme.primary,
                    tabs: const [
                      Tab(
                          icon: Icon(Icons.trending_up_rounded),
                          child: Text('Рекомендации')),
                      Tab(
                          icon: Icon(Icons.remove_done_rounded),
                          child: Text('Невыполненные')),
                      Tab(
                          icon: Icon(Icons.done_all_rounded),
                          child: Text('Выполненные')),
                    ],
                  ),
                  Expanded(
                    child: TabBarView(
                      children: const [
                        Icon(Icons.trending_up_rounded),
                        Icon(Icons.remove_done_rounded),
                        Icon(Icons.done_all_rounded),
                      ],
                    ),
                  ),
                ],
              );
            } else {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Text(
                    'Авторизуйтесь, чтобы получить список работ.',
                    style: theme.textTheme.bodyLarge,
                    textAlign: TextAlign.center,
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}

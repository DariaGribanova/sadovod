import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sadovod/navigation/app_router.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      lazyLoad: false,
      routes: const [
        ProfileTab(),
        WorksTab(),
      ],
      bottomNavigationBuilder: (_, tabsRouter) {
        return Container(
          decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Color(0x14000000),
                spreadRadius: 0,
                blurRadius: 16,
                offset: Offset(0, -4),
              ),
            ],
          ),
          child: CupertinoTabBar(
            border: const Border(
                top: BorderSide(
                  color: Colors.white,
                  width: 0.0,
                )),
            backgroundColor: Colors.white,
            currentIndex: tabsRouter.activeIndex,
            onTap: tabsRouter.setActiveIndex,
            items: const [
              BottomNavigationBarItem(
                icon: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.home),
                    Text(
                      'Профиль',
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ),
              BottomNavigationBarItem(
                icon: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.local_florist),
                    Text(
                      'Работы',
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

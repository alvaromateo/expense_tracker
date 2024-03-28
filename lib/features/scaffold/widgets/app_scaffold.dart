import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class AppScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AutoTabsRouter.pageView(  
      routes: [ BooksTab(), ProfileTab(), SettingsTab(), ],
      builder: (context, child, _) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(context.topRoute.name),
            leading: AutoLeadingButton()),
            body: child,
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: tabsRouter.activeIndex,
              onTap: tabsRouter.setActiveIndex,
              items: [
                BottomNavigationBarItem(label: 'Books', ...),
                BottomNavigationBarItem(label: 'Profile', ...),
                BottomNavigationBarItem(label: 'Settings', ...),
              ], 
            ), 
          );
        },
      );
  }
  
}
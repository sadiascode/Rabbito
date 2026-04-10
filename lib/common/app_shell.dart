import 'package:flutter/material.dart';
import 'navbar/bottom_tabs.dart';
import 'navbar/bottom_tab_item.dart';
import 'navbar/custom_bottom_nav.dart';
import 'custom_color.dart';

class AppShell extends StatefulWidget {
  final int initialIndex;

  const AppShell({super.key, this.initialIndex = 0});

  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  late int _currentIndex;
  final List<BottomTabItem> _allLogicalTabs = allLogicalTabs;
  late final List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
    _pages = _allLogicalTabs.map((tab) => tab.page).toList();
  }

  void _onTabTapped(int index) {
    if (_currentIndex != index) {
      setState(() {
        _currentIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final bool isDesktop = constraints.maxWidth >= 900;

        if (!isDesktop && _allLogicalTabs[_currentIndex].isWebOnly) {
          _currentIndex = 0;
        }

        if (isDesktop) {
          return Scaffold(
            body: Row(
              children: [
                NavigationRail(
                  selectedIndex: _currentIndex,
                  onDestinationSelected: _onTabTapped,
                  labelType: NavigationRailLabelType.all,
                  minWidth: 200,
                  backgroundColor: AppColors.cardBackground,
                  selectedIconTheme: const IconThemeData(color: Colors.white),
                  unselectedIconTheme: IconThemeData(color: Colors.grey.shade400),
                  selectedLabelTextStyle: const TextStyle(
                    color: AppColors.primary,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                  unselectedLabelTextStyle: TextStyle(
                    color: Colors.grey.shade500,
                    fontSize: 12,
                  ),
                  indicatorColor: AppColors.primary,
                  indicatorShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  leading: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24),
                    child: Image.asset(
                      'assets/logos.png',
                      height: 40,
                    ),
                  ),
                  destinations: desktopTabs.map((tab) {
                    return NavigationRailDestination(
                      icon: tab.icon,
                      selectedIcon: tab.icon,
                      label: Text(tab.label),
                    );
                  }).toList(),
                ),
                const VerticalDivider(thickness: 1, width: 1, color: Color(0xFFEEEEEE)),
                Expanded(
                  child: IndexedStack(
                    index: _currentIndex,
                    children: _pages,
                  ),
                ),
              ],
            ),
          );
        }

        // Mobile Layout: Use the custom mobileTabs order
        final mobileCurrentIndex = mobileTabs.indexWhere((tab) => _allLogicalTabs.indexOf(tab) == _currentIndex || tab.label == _allLogicalTabs[_currentIndex].label);

        return Scaffold(
          body: IndexedStack(
            index: _currentIndex,
            children: _pages,
          ),
          bottomNavigationBar: CustomBottomNav(
            tabs: mobileTabs,
            currentIndex: mobileCurrentIndex >= 0 ? mobileCurrentIndex : 0,
            onTap: (mobileIndex) {
              final tappedTab = mobileTabs[mobileIndex];
              final globalIndex = _allLogicalTabs.indexWhere((t) => t.label == tappedTab.label);
              _onTabTapped(globalIndex);
            },
          ),
        );
      },
    );
  }
}

class SubPageScaffold extends StatelessWidget {
  final Widget body;
  final int parentTabIndex;
  final PreferredSizeWidget? appBar;
  final Color? backgroundColor;

  const SubPageScaffold({
    super.key,
    required this.body,
    required this.parentTabIndex,
    this.appBar,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final bool isDesktop = constraints.maxWidth >= 900;

        if (isDesktop) {
          return Scaffold(
            backgroundColor: backgroundColor ?? const Color(0xFFFFFAF7),
            body: Row(
              children: [
                NavigationRail(
                  selectedIndex: parentTabIndex,
                  onDestinationSelected: (index) {
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (_) => AppShell(initialIndex: index),
                      ),
                      (route) => false,
                    );
                  },
                  labelType: NavigationRailLabelType.all,
                  backgroundColor: AppColors.cardBackground,
                  selectedIconTheme: const IconThemeData(color: Colors.white),
                  unselectedIconTheme: IconThemeData(color: Colors.grey.shade400),
                  selectedLabelTextStyle: const TextStyle(
                    color: AppColors.primary,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                  unselectedLabelTextStyle: TextStyle(
                    color: Colors.grey.shade500,
                    fontSize: 12,
                  ),
                  indicatorColor: AppColors.primary,
                  indicatorShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  destinations: desktopTabs.map((tab) {
                    return NavigationRailDestination(
                      icon: tab.icon,
                      selectedIcon: tab.icon,
                      label: Text(tab.label),
                    );
                  }).toList(),
                ),
                const VerticalDivider(thickness: 1, width: 1, color: Color(0xFFEEEEEE)),
                Expanded(
                  child: Scaffold(
                    backgroundColor: backgroundColor ?? const Color(0xFFFFFAF7),
                    appBar: appBar,
                    body: body,
                  ),
                ),
              ],
            ),
          );
        }

        // Mobile Layout: Use the custom mobileTabs order and translate index
        final mobileCurrentIndex = mobileTabs.indexWhere((tab) => allLogicalTabs.indexOf(tab) == parentTabIndex || tab.label == allLogicalTabs[parentTabIndex].label);

        return Scaffold(
          backgroundColor: backgroundColor ?? const Color(0xFFFFFAF7),
          appBar: appBar,
          body: body,
          bottomNavigationBar: CustomBottomNav(
            tabs: mobileTabs,
            currentIndex: mobileCurrentIndex >= 0 ? mobileCurrentIndex : 0,
            onTap: (mobileIndex) {
              final tappedTab = mobileTabs[mobileIndex];
              final globalIndex = allLogicalTabs.indexWhere((t) => t.label == tappedTab.label);
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                  builder: (_) => AppShell(initialIndex: globalIndex),
                ),
                (route) => false,
              );
            },
          ),
        );
      },
    );
  }
}
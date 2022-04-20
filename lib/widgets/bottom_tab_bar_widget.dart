import 'package:daily_quotes/screens/edit_quote_background_screen.dart';
import 'package:flutter/material.dart';
import '../constants/app_constants.dart';
import '../fab_button_app_bar.dart';
import 'tab_navigator.dart';

class BottomTabBarWidget extends StatefulWidget {
  const BottomTabBarWidget({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<BottomTabBarWidget> createState() => _BottomTabBarWidgetState();
}

class _BottomTabBarWidgetState extends State<BottomTabBarWidget> {
  String _currentPage = "Home";
  List<String> pageKeys = ["Home", "Search", "Profile", "More"];
  final Map<String, GlobalKey<NavigatorState>> _navigatorKeys = {
    "Home": GlobalKey<NavigatorState>(),
    "Search": GlobalKey<NavigatorState>(),
    "Profile": GlobalKey<NavigatorState>(),
    "More": GlobalKey<NavigatorState>(),
  };

  void _onItemTapped(int index) {
    setState(() {
      _selectTab(pageKeys[index], index);
    });
  }

  void _selectTab(String tabItem, int index) {
    if (tabItem == _currentPage) {
      _navigatorKeys[tabItem]!.currentState!.popUntil((route) => route.isFirst);
    } else {
      setState(() {
        _currentPage = pageKeys[index];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final isFirstRouteInCurrentTab =
            !await _navigatorKeys[_currentPage]!.currentState!.maybePop();
        if (isFirstRouteInCurrentTab) {
          if (_currentPage != "Home") {
            _selectTab("Home", 1);

            return false;
          }
        }
        // let system handle back button if we're on the first route
        return isFirstRouteInCurrentTab;
      },
      child: Scaffold(
        body: Stack(children: <Widget>[
          _buildOffstageNavigator("Home"),
          _buildOffstageNavigator("Search"),
          _buildOffstageNavigator("Profile"),
          _buildOffstageNavigator("More"),
        ]),
        bottomNavigationBar: FABBottomAppBar(
          centerItemText: '',
          color: kTertiaryColor,
          backgroundColor: kPrimaryColor,
          selectedColor: Colors.white,
          notchedShape: const CircularNotchedRectangle(),
          onTabSelected: _onItemTapped,
          items: [
            FABBottomAppBarItem(iconData: Icons.home, text: 'Home'),
            FABBottomAppBarItem(iconData: Icons.search, text: 'Search'),
            FABBottomAppBarItem(
                iconData: Icons.account_circle, text: 'Profile'),
            FABBottomAppBarItem(iconData: Icons.more_horiz, text: 'More'),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const EditQuoteBackgroundScreen(),
                ),
              );
            },
            child: const Icon(Icons.add),
            elevation: 2.0,
          ),
        ),
      ),
    );
  }

  Widget _buildOffstageNavigator(String tabItem) {
    return Offstage(
      offstage: _currentPage != tabItem,
      child: TabNavigator(
        navigatorKey: _navigatorKeys[tabItem]!,
        tabItem: tabItem,
      ),
    );
  }
}

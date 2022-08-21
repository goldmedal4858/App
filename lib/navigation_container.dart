import 'package:flutter/material.dart';
import 'package:something/pages/explore_page.dart';
import 'package:something/pages/home_page.dart';
import 'package:something/pages/notifications_page.dart';
import 'package:something/pages/profile_page.dart';
import 'package:something/widgets/custom_bottom_nav_bar.dart';

class NavigationContainer extends StatefulWidget {
  const NavigationContainer({Key? key}) : super(key: key);

  @override
  State<NavigationContainer> createState() => _NavigationContainerState();
}

class _NavigationContainerState extends State<NavigationContainer> {
  int _selectedPageIndex = 0;

  static const List<Widget> _appPages= [
    HomePage(),
    ExplorePage(),
    NotificationsPage(),
    ProfilePage(),
  ];

  void _onIconTapped(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: _appPages[_selectedPageIndex]
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
          selectedPageItems: _selectedPageIndex,
          onIconTap: _onIconTapped,),




      //  drawer: const NavigationDrawer(),  //NAVİGATİON DRAWER 1.
    );
  }
}

/*

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,

          children: [
            buildHeader(context),
            buildMenuItems(context)
          ],
        ),
      ),
    );
  }

    Widget buildHeader(BuildContext context) => Padding(
      padding: const EdgeInsets.all(24.0),
      child: Wrap(
        runSpacing: 16,
      ),
    );

    Widget buildMenuItems(BuildContext context) => Column(
      children: [
        ListTile(
          leading: const Icon(Icons.home_outlined),
          title: const Text ("Ana Menu")
        ),
        Divider(color: Colors.black54),
        ListTile(
            leading: const Icon(Icons.favorite_border),
            title: const Text ("Favoriler")
        ),
        Divider(color: Colors.black54),
        ListTile(
            leading: const Icon(Icons.notifications),
            title: const Text ("Bildirimler")
        ),
        Divider(color: Colors.black54),
        ListTile(
            leading: const Icon(Icons.update),
            title: const Text ("Güncellemeler")
        ),

      ],
    );
}

*/

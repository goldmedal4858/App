import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({Key? key, required this.selectedPageItems, required this.onIconTap})
      : super(key: key);

  final int selectedPageItems;
  final Function onIconTap;
  final double _iconSize = 30;


  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
                onPressed: () => {onIconTap(0)},
                iconSize: _iconSize,
                icon: Icon(
                   selectedPageItems == 0
                       ? Icons.home
                       : Icons.home_outlined)),

            IconButton(
                onPressed: () => {onIconTap(1)},
                iconSize: _iconSize,
                icon: Icon(
                    selectedPageItems == 1
                        ? Icons.search
                        : Icons.search_outlined)),

            IconButton(
                onPressed: () => {onIconTap(2)},
                iconSize: _iconSize,
                icon: Icon(
                    selectedPageItems == 2
                        ? Icons.notifications
                        : Icons.notifications_outlined)),

            IconButton(
                onPressed: () => {onIconTap(3)},
                iconSize: _iconSize,
                icon: Icon(
                    selectedPageItems == 3
                        ? Icons.person
                        : Icons.person_outlined)),


            

          ],
        ),
      ),
    );
  }
}

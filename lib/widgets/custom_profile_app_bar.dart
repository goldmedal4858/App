import 'package:flutter/material.dart';

class CustomProfileAppBar extends StatelessWidget {
  const CustomProfileAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,

      pinned: true,
      centerTitle: false,
      elevation: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(3.0),
            child: Icon(Icons.https_outlined, size: 18),
          ),
          Text("Ali Mert Hero" , style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),

        ],
      ),
      actions: [
        IconButton(
            onPressed: () => {} ,
            icon: Icon(Icons.add_box_outlined),
        ),

        IconButton(
            onPressed: () => {} ,
            icon: Icon(Icons.dehaze_outlined),
        )

      ],
    );
  }
}

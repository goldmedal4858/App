import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../pages/chat_page.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,

      pinned: true,
      title: Text("GoldMedal",
          style:
          GoogleFonts.satisfy(fontSize: 32, fontWeight: FontWeight.bold)),
      actions: [
        IconButton(onPressed: () => {}, icon: Icon(Icons.add_box_outlined)),

        IconButton(onPressed: () => {
          showModalBottomSheet(

            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(20)
              )
            ),

            context: context,
            builder: (context) => buildSheet(),
          )
        }, icon: Icon(Icons.favorite_border_outlined)),
        IconButton(onPressed: () => {

          Navigator.push(context, MaterialPageRoute(
              builder: (context) => ChatPage()))

        }, icon: Icon(Icons.send_outlined)),
      ],
    );
  }
  Widget buildSheet() => Container(
      decoration: BoxDecoration(
        color:Colors.white,
        borderRadius: BorderRadius.vertical(
            top: Radius.circular(30),
        )
    )

  );
}





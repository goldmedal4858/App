import 'package:flutter/material.dart';

import '../_mock_data/chat_json.dart';
import '../_mock_data/mock.dart';
import 'chat_detail_page.dart'; //BURADA KENDİ PROFİLİMİZİN DATASINI ÇEKTİK.

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: getAppBar(),
      body: getBody(size),

      bottomSheet: getBottomSheet(),
    );
  }

  PreferredSizeWidget getAppBar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(55),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context);
                  }
                  ),
              SizedBox(width: 10),
              Text("Sohbetler", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))
            ],
          ),
          Row(
            children: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.videocam_outlined)
              ),
              SizedBox(width: 5),

              IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.edit_outlined)
              ),

            ],
          )
        ],
        ),
      ),
    );
  }

  Widget getBody(size) {
    return ListView(
      children: [
        Column(
          children: [
            SizedBox(height: 10),
            Row(
              children: [
                Container(
                  height: 45,
                  width: size.width * 0.5,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        selectedIndex = 0;
                      });
                    },
                    child: Center(
                      child: Text("Chats",
                          style: TextStyle(
                              color: selectedIndex == 0 ? Colors.black : Colors.black.withOpacity(0.5))),
                    ),
                  ),
                ),

                Container(
                  height: 45,
                  width: size.width * 0.5,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        selectedIndex = 1;
                      });
                    },
                    child: Center(
                      child: Text("Rooms",
                          style: TextStyle(
                              color: selectedIndex == 1 ? Colors.black : Colors.black.withOpacity(0.5))),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              height: 1,
              width: size.width,
              decoration: BoxDecoration(color: Colors.grey),
            )
          ],
        ),
        IndexedStack(
          index: selectedIndex,
          children: [
            getChats(size),
            getRooms(),
          ],
        )
      ],
    );
  }

  Widget getChats(size) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 15, left: 10, right: 10),
          child: Container(
            height: 41,
            width: (size.width - 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.grey.withOpacity(0.3)
            ),
            child: Padding(
              padding: EdgeInsets.only(top: 5),
              child: TextField(
                cursorColor: Colors.black.withOpacity(0.5),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.search, color: Colors.black.withOpacity(0.5)),
                  hintText: "Search",
                  hintStyle: TextStyle(color: Colors.black.withOpacity(0.5))
                ),
              ),
            )
          )
        ),
        SizedBox(height: 10),
        Column(
          children: List.generate(chats.length, (index)  {
            return InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                    builder: (_) => ChatDetailPage()));
              },
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Container(
                      height: (size.width - 20) * 0.15,
                      width: (size.width - 20) * 0.15,
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: NetworkImage(chats[index]["profile"]),
                                    fit: BoxFit.cover
                                )
                            ),
                          ),
                          chats[index]["dateTime"] == "now"
                          ? Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              height: 18,
                              width: 18,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(width: 1, color: Colors.grey),
                                  color: Colors.lightGreenAccent[700]

                              ),
                            ),
                          )
                              :Container(),
                        ],
                      ),
                    ),
                    Container(
                      width: (size.width - 20) * 0.7,
                      child: Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(chats[index]["username"],
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                            Text("${chats[index]["description"]} - ${chats[index]["dateTime"]}",
                              style: TextStyle(fontSize: 16, height: 1, color: Colors.grey[600]),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                        width: (size.width - 20) * 0.15,
                        alignment: Alignment.centerRight,
                        child: Icon(Icons.photo_camera_outlined, color: Colors.black.withOpacity(0.5))
                    )
                  ],
                ),
              ),
            );
          }
          )
        )
      ],
    );
  }

  Widget getRooms() {
    return Column(
      children: [
        Text("merhaba")
      ],
    );
  }

  Widget getBottomSheet() {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: Colors.grey[100],
        border: Border(top: BorderSide(width: 1, color: Colors.blueGrey.withOpacity(0.3)))
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.photo_camera, color: Colors.blue),
          SizedBox(width: 10),
          Text("Camera",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.blue)
          )
        ],
      )
    );

  }


}



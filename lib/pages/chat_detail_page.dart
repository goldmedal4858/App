import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';

import '../_mock_data/chat_detail_json.dart';
import '../_mock_data/chat_json.dart';

class ChatDetailPage extends StatefulWidget {
  const ChatDetailPage({Key? key}) : super(key: key);

  @override
  State<ChatDetailPage> createState() => _ChatDetailPageState();
}

TextEditingController _controller = TextEditingController();

class _ChatDetailPageState extends State<ChatDetailPage> {

  List<Message> messages = [
    Message(
      text: "olurr",
      date: DateTime.now().subtract(Duration(minutes: 1)),
      isSentByMe: false,
    ),
    Message(
      text: "saat 4 gibi",
      date: DateTime.now().subtract(Duration(minutes: 1)),
      isSentByMe: true,
    ),
    Message(
      text: "tamamdır",
      date: DateTime.now().subtract(Duration(minutes: 1)),
      isSentByMe: false,
    ),
    Message(
      text: "olabilir",
      date: DateTime.now().subtract(Duration(minutes: 1)),
      isSentByMe: true,
    ),
    Message(
      text: "bowling oynamaya gidebiliriz",
      date: DateTime.now().subtract(Duration(minutes: 1)),
      isSentByMe: false,
    ),
    Message(
      text: "yarına planın var mı",
      date: DateTime.now().subtract(Duration(minutes: 1)),
      isSentByMe: false,
    ),
    Message(
      text: "merhaba",
      date: DateTime.now().subtract(Duration(minutes: 1)),
      isSentByMe: false,
    ),
    Message(
      text: "asd",
      date: DateTime.now().subtract(
          Duration(days: 10, minutes: 11)),
      isSentByMe: true,
    ),
    Message(
      text: "dgfdr",
      date: DateTime.now().subtract(
          Duration(days: 10, minutes: 9)),
      isSentByMe: true,
    ),
    Message(
      text: ":)",
      date: DateTime.now().subtract(
          Duration(days: 10, minutes: 7)),
      isSentByMe: true,
    ),
    Message(
      text: "Doru",
      date: DateTime.now().subtract(
          Duration(days: 10, minutes: 5)),
      isSentByMe: false,
    ),
    Message(
      text: "yes sure",
      date: DateTime.now().subtract(
          Duration(days: 6, minutes: 7)),
      isSentByMe: false,
    ),
    Message(
      text: "asdasd",
      date: DateTime.now().subtract(
          Duration(days: 6, minutes: 9)),
      isSentByMe: true,
    ),
    Message(
      text: "asdasd",
      date: DateTime.now().subtract(
          Duration(days: 6, minutes: 5)),
      isSentByMe: true,
    ),
    Message(
      text: "sen de",
      date: DateTime.now().subtract(
          Duration(days: 3, minutes: 3)),
      isSentByMe: false,
    ),
    Message(
      text: "kendine iyi bak",
      date: DateTime.now().subtract(
          Duration(days: 3, minutes: 4)),
      isSentByMe: true,

    ),
  ].reversed.toList();

  @override
  Widget build(BuildContext context) {
    
    var size = MediaQuery.of(context).size;
    
    return Scaffold(

      appBar: getAppBar(),
      //body: getBody(size),


      body: Column(
        children: [
          Expanded(
            child: GroupedListView<Message, DateTime>(
                padding: EdgeInsets.all(8),
                reverse: true,
                order: GroupedListOrder.DESC,
                useStickyGroupSeparators: true,
                floatingHeader: true,
                elements: messages,
                groupBy: (message) => DateTime(
                  message.date.year,
                  message.date.month,
                  message.date.day
                ),
                groupHeaderBuilder: (Message message) => SizedBox(
                  height: 40,
                  child: Center(
                    child: Card(
                      color: Colors.blue,
                      child: Padding(
                        padding: EdgeInsets.all(8),
                        child: Text(
                          DateFormat.yMMMd().format(message.date),
                          style: TextStyle(color: Colors.white)
                      )
                      )
                    )
                  )
                ),
                itemBuilder: (context, Message message) => MessageBubble(
                    text: message.text,
                    date: message.date,
                    isSentByMe: message.isSentByMe)
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey.shade200
              ),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  children: [
                    Container(
                      width: (size.width - 40) * 0.1,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.orange
                      ),
                      child: Center(
                        child: Icon(
                            Icons.camera_alt_outlined, color: Colors.white
                        ),
                      ),
                    ),
                    Container(
                      width: (size.width - 40) * 0.6,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                        child: TextField(
                          controller: _controller,
                          cursorColor: Colors.black.withOpacity(0.5),
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Message...",
                              hintStyle: TextStyle(fontSize: 16, color: Colors.black.withOpacity(0.5))
                          ),

                          onSubmitted: (text) {
                            final message = Message(
                              text: text,
                              date: DateTime.now(),
                              isSentByMe: true,
                            );
                            setState(() => messages.add(message));
                            _controller.clear();
                          },
                        ),
                      ),
                    ),
                    Container(
                      width: (size.width - 40) * 0.3,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(Icons.mic),
                          Icon(Icons.image),
                          Icon(Icons.sticky_note_2)
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      )
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
                    icon: Icon(Icons.arrow_back, color: Colors.black),
                      onPressed: () {
                      Navigator.pop(context);
                      },
                  ),
                  SizedBox(width: 10),
                  Container(
                    height: 33,
                    width: 33,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: NetworkImage(chats[0]["profile"]),
                        fit: BoxFit.cover
                      )
                    ),
                  ),
                  SizedBox(width: 15),
                  Text(
                    chats[0]["username"],
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  )
                ],
              ),
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.videocam_outlined),
                    onPressed: () {},
                  ),
                  SizedBox(width: 10),
                  IconButton(
                    icon: Icon(Icons.info_outlined),
                    onPressed: () {},
                  ),
                ],
              )
            ],
          )
        )
    );

  }


  /* Widget getBody(size) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: ListView(
        shrinkWrap: true,
        children: [
          Container(
            height: size.height * 0.83,
            child: ListView(
              children: List.generate(chatDetails.length, (index) {
               return Padding(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: ChatBubbles(
                    isMe: chatDetails[index]["isMe"],
                    profile: chatDetails[index]["profile"],
                    message: chatDetails[index]["message"],
                    messageNo: chatDetails[index]["messageNo"],
                  ),
                );
              })
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.pink.withOpacity(0.3)
              ),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  children: [
                    Container(
                      width: (size.width - 40) * 0.1,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.orange
                      ),
                      child: Center(
                        child: Icon(
                          Icons.camera_alt_outlined, color: Colors.white
                        ),
                      ),
                    ),
                    Container(
                      width: (size.width - 40) * 0.6,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                        child: TextField(
                          cursorColor: Colors.black.withOpacity(0.5),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Message...",
                            hintStyle: TextStyle(fontSize: 16, color: Colors.black.withOpacity(0.5))
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: (size.width - 40) * 0.3,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(Icons.mic),
                          Icon(Icons.image),
                          Icon(Icons.sticky_note_2)
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          )

        ],
      ),
    );
  }  */
}
class ChatBubbles extends StatelessWidget {

  final bool isMe;
  final String profile, message;
  final int messageNo;

  const ChatBubbles({
    Key? key,
    required this.isMe,
    required this.profile,
    required this.message,
    required this.messageNo
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    if(isMe) {
      return Padding(
        padding: EdgeInsets.only(top: 1.5, bottom: 1.5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: getBorderRadiusMessage(messageNo),
                  color: Colors.grey.withOpacity(0.3)
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  message,
                  style: TextStyle(fontSize: 16),
                ),
              ),
            )
          ],
        ),
      );
    }
    else{
      return Padding(
        padding: EdgeInsets.only(top: 1.5, bottom: 1.5),
        child: Row(
          children: [
            Container(
              height: 33,
              width: 33,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage(profile),
                  fit: BoxFit.cover
                )
              ),
            ),
            SizedBox(width: 10),
            Container(
              decoration: BoxDecoration(
                  borderRadius: getBorderRadiusMessage(messageNo),
                  color: Colors.green.withOpacity(0.7)
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  message,
                  style: TextStyle(fontSize: 16),
                ),
              ),
            )
          ],
        ),
      );
    }
  }
   getBorderRadiusMessage(messageNo) {
    if (isMe) {
      if(messageNo == 1) {
        return BorderRadius.only(
          topLeft: Radius.circular(20),
          bottomLeft: Radius.circular(20),
          topRight: Radius.circular(20),
          bottomRight: Radius.circular(5),
        );
      } else if(messageNo == 2){
        return BorderRadius.only(
          topLeft: Radius.circular(20),
          bottomLeft: Radius.circular(20),
          topRight: Radius.circular(5),
          bottomRight: Radius.circular(5),
        );
      } else if(messageNo == 3){
        return BorderRadius.only(
          topLeft: Radius.circular(20),
          bottomLeft: Radius.circular(20),
          topRight: Radius.circular(5),
          bottomRight: Radius.circular(20),
        );
      } else {
        return BorderRadius.circular(20);
      }
    } else {
      if(messageNo == 1) {
        return BorderRadius.only(
          topLeft: Radius.circular(20),
          bottomLeft: Radius.circular(5),
          topRight: Radius.circular(20),
          bottomRight: Radius.circular(5),
        );
      } else if(messageNo == 2){
        return BorderRadius.only(
          topLeft: Radius.circular(5),
          bottomLeft: Radius.circular(5),
          topRight: Radius.circular(20),
          bottomRight: Radius.circular(20),
        );
      } else if(messageNo == 3){
        return BorderRadius.only(
          topLeft: Radius.circular(5),
          bottomLeft: Radius.circular(20),
          topRight: Radius.circular(20),
          bottomRight: Radius.circular(20),
        );
      } else {
        return BorderRadius.circular(20);
      }
    }
  }
}
class MessageBubble extends StatelessWidget {

  final String text;
  final DateTime date;
  final bool isSentByMe;

  const MessageBubble(
      {Key? key, required this.text, required this.date, required this.isSentByMe})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (isSentByMe) {
      return Padding(
        padding: EdgeInsets.only(top: 1.5, bottom: 1.5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.grey.withOpacity(0.3)
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  text,
                  style: TextStyle(fontSize: 16),
                ),
              ),
            )
          ],
        ),
      );
    }
    else {
      return Padding(
        padding: EdgeInsets.only(top: 1.5, bottom: 1.5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.green.withOpacity(0.8)
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  text,
                  style: TextStyle(fontSize: 16),
                ),
              ),
            )
          ],
        ),
      );
    }
  }
}




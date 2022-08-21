import 'package:flutter/material.dart';

import '../models/post.dart';

class PostCard extends StatelessWidget {
  const PostCard({Key? key, required this.post}) : super(key: key);

  final Post post;
  final  double _iconSize = 32;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            dense: true,
            title: Text(post.postedBy.username, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
            subtitle: Text(post.location, style: TextStyle(color: Colors.black, fontSize: 13)),
            leading: CircleAvatar(
              backgroundColor: Colors.grey,
              backgroundImage: NetworkImage(post.postedBy.profileImageUrl),
            ),
            trailing: Icon(Icons.menu, color: Colors.black,),
          ),
          Image.network(
            post.imageUrl,
            height: 320,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(3.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: IconButton(
                    onPressed: () => {},
                    icon: Icon(post.isLiked ? Icons.favorite : Icons.favorite_outline),
                    iconSize: _iconSize,

                    color: post.isLiked ? Colors.red : Colors.black
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: IconButton(
                    onPressed: () => {},
                    icon: Icon(Icons.chat_bubble_outline),
                    iconSize: _iconSize,
                  ),
                ),
                IconButton(
                  onPressed: () => {},
                  icon: Icon(Icons.send_outlined),
                  iconSize: _iconSize,
                ),
                Spacer(),
                IconButton(
                  onPressed: () => {},
                  icon: Icon(post.isBookmarked ? Icons.bookmark : Icons.bookmark_outline),
                  iconSize: _iconSize,
                ),
              ],
            ),
          ),
          SizedBox(height: 3),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("${post.totalLikes} likes",
                    style: TextStyle(
                        color:Colors.black, fontSize: 15, fontWeight: FontWeight.bold)),

                SizedBox(height: 5),

                RichText(text: TextSpan(
                  text: post.postedBy.username,
                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                  children: [
                    TextSpan(
                      text: " ${post.caption}",
                      style: TextStyle(fontWeight: FontWeight.normal)

                    )
                  ]
                )),

                SizedBox(height: 5),

                Text("View all ${post.totalLikes} comments"),

                SizedBox(height: 5),

                Text(post.postedTimeAgo, style: TextStyle(fontSize: 13)),

                SizedBox(height: 5),


              ],
            ),
          )
        ],
      ),
    );
  }
}

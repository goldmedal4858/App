import '../models/post.dart';
import '../models/story.dart';
import '../models/user.dart';

User currentUser =
    User("id" , "alimert" , "https://picsum.photos/id/1062/400/400");

    final List<Story> stories = [
        Story("id", currentUser),
        Story("id", currentUser),
        Story("id", currentUser),
        Story("id", currentUser),
        Story("id", currentUser),
        Story("id", currentUser),
    ];

    final List<Post> posts = [
        Post(
            "id",
            currentUser,
            "https://picsum.photos/id/1062/400/400",
            "title",
            "Denizli, Türkiye",
            "caption",
            "a few seconds ago",
            "132",
            "32",
            true,
            true
        ),
        Post(
            "id1",
            currentUser,
            "https://picsum.photos/id/1063/400/400",
            "title1",
            "Muğla, Türkiye",
            "caption",
            "a few seconds ago",
            "132",
            "32",
            true,
            true
        ),
        Post(
            "id2",
            currentUser,
            "https://picsum.photos/id/1064/400/400",
            "title2",
            "Ankara, Türkiye",
            "caption",
            "a few seconds ago",
            "132",
            "32",
            true,
            true
        ),
        Post(
            "id3",
            currentUser,
            "https://picsum.photos/id/1065/400/400",
            "title3",
            "Kastamonu, Türkiye",
            "caption",
            "a few seconds ago",
            "132",
            "32",
            true,
            true
        ),
        Post(
            "id4",
            currentUser,
            "https://picsum.photos/id/1066/400/400",
            "title4",
            "İstanbul, Türkiye",
            "caption",
            "a few seconds ago",
            "132",
            "32",
            true,
            true
        ),
        Post(
            "id5",
            currentUser,
            "https://picsum.photos/id/1067/400/400",
            "title5",
            "Sivas, Türkiye",
            "caption",
            "a few seconds ago",
            "132",
            "32",
            true,
            true
        )
    ];
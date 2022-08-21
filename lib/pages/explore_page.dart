import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:something/_mock_data/mock.dart';
import 'package:something/widgets/custom_explore_app_bar.dart';

import '../models/post.dart';
import '../widgets/category_bar.dart';
import '../widgets/explore_tile.dart';
import '../widgets/persistent_header.dart';


class ExplorePage extends StatelessWidget {
  const ExplorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
      child: SafeArea(
        child: CustomScrollView(
          slivers: [
            CustomExploreAppBar(),
            SliverPersistentHeader(
                pinned: true,
                delegate: PersistentHeader(
                    child: CategoryBar(categories: [
                      "original memes" ,
                      "wildlife" ,
                      "programming" ,
                      "laugh"])
                ),
            ),

            SliverStaggeredGrid.countBuilder(
                mainAxisSpacing: 1,
                crossAxisSpacing: 1,
                crossAxisCount: 3,
                staggeredTileBuilder: (int index) {
                  int modedIndex = index % 20;
                  int cXCellCount = modedIndex == 11 ? 2 : 1;

                  double mXCellCount = 1;
                  if(modedIndex == 2 || modedIndex == 11) {
                    mXCellCount = 2;
                  }
                  return StaggeredTile.count(cXCellCount,mXCellCount);
                },
                itemBuilder: (BuildContext context, int index) {
                  return ExploreTile(
                      post: Post(
                          "$index",
                          currentUser,
                          "https://picsum.photos/id/${1047 + index}/400/${index % 20 == 2 ? 805 : 400}",
                          "title",
                          "location",
                          "caption",
                          "postedTimeAgo",
                          "totalLikes",
                          "totalComments",
                          true,
                          true)
                  );
                },
                itemCount: 38)

          ],
        ),
      ),
    );
  }
}

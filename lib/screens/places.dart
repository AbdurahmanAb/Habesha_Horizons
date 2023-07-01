import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../models/Recomend.dart';
import '../screens/detail.dart';
import '../widgets/Recomended.dart';
import 'package:flutter/cupertino.dart';

class Places extends StatelessWidget {
  const Places({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: Hive.box("bookmark").listenable(),
        builder: (BuildContext context, Box box, Widget? child) {
          return SizedBox(
              height: 1220,
              child: StaggeredGridView.countBuilder(
                  physics: NeverScrollableScrollPhysics(),
                  crossAxisCount: 4,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  itemCount: Recom.length,
                  itemBuilder: (context, index) => ImageGrid(context, index),
                  staggeredTileBuilder: (index) => StaggeredTile.fit(2)));
        });
  }

  Widget ImageGrid(context, int index) {
    final Bookbox = Hive.box('bookmark');
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Detail(data: Recom[index])));
      },
      child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Stack(children: [
                    Image.asset(
                      Recom[index].Image,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                        right: 2,
                        top: 6,
                        child: GestureDetector(
                          onTap: () {
                            if (Bookbox.get(Recom[index].id) == null) {
                              Bookbox.put(Recom[index].id, Recom[index].id);
                            } else {
                              Bookbox.delete(Recom[index].id);
                            }
                            print("bookamrked");
                          },
                          child: Container(
                              padding: EdgeInsets.all(6),
                              color: Colors.white,
                              child: Icon(
                                Bookbox.get(Recom[index].id) != null
                                    ? CupertinoIcons.heart_fill
                                    : CupertinoIcons.heart,
                                color: Colors.redAccent,
                              )),
                        ))
                  ]),
                ),
                SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        Recom[index].name,
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.blue[300]),
                      ),
                      Spacer(),
                      Icon(
                        CupertinoIcons.star_fill,
                        color: Colors.amber,
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Text(Recom[index].star.toString())
                    ],
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Icon(
                      CupertinoIcons.location_solid,
                      color: Colors.blue[300],
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Text(Recom[index].location),
                  ],
                )
              ],
            ),
          )),
    );
  }
}

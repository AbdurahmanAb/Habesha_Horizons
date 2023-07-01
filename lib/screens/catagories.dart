import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../models/categories.dart';

class Catagory extends StatelessWidget {
  const Catagory({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 700,
      margin: EdgeInsets.only(top: 10),
      child: StaggeredGridView.countBuilder(
          itemCount: 5,
          crossAxisSpacing: 5,
          physics: NeverScrollableScrollPhysics(),
          staggeredTileBuilder: (index) => StaggeredTile.fit(1),
          crossAxisCount: 2,
          itemBuilder: (context, index) => Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image.asset(
                      "assets/chlada.jpg",
                      height: 250,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    width: double.maxFinite,
                    color: Colors.black.withOpacity(0.2),
                  ),
                  Positioned(
                      bottom: 5,
                      left: 5,
                      child: Column(
                        children: [
                          Text(
                            "Historical ",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 25),
                          )
                        ],
                      ))
                ],
              )),
    );
  }
}

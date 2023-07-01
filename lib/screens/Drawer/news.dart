import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:habesha/widgets/BottomNav.dart';
import '../../models/news_model.dart';

class News extends StatelessWidget {
  const News({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 236, 236, 236),
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "News Feed",
          style: TextStyle(color: Colors.black),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ClipRRect(
              child: Container(
                margin: EdgeInsets.only(top: 14),
                padding: EdgeInsets.all(12),
                color: Colors.white,
                width: double.maxFinite,
                child: Text(
                  "GET LATEST NEWS ABOUT ETHIOPIA",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
              height: 400,
              color: Colors.white,
              padding: EdgeInsets.all(12),
              margin: EdgeInsets.all(8),
              child: Swiper(
                itemBuilder: (context, index) => Stack(
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(14),
                        child: Image.asset(
                          news[index].ImagePath,
                          height: 400,
                          width: double.maxFinite,
                          fit: BoxFit.cover,
                        )),
                    Container(
                      width: double.maxFinite,
                      color: Colors.black.withOpacity(0.4),
                    ),
                    Positioned(
                        bottom: 7,
                        left: 0,
                        child: Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                news[index].title,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30),
                              ),
                              Text(
                                news[index].Subtitle,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              )
                            ],
                          ),
                        ))
                  ],
                ),
                itemCount: 4,
                autoplay: true,
                pagination: SwiperPagination(),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
                padding: EdgeInsets.all(8),
                margin: EdgeInsets.all(8),
                color: Colors.white,
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        "assets/afar.jpg",
                        width: 180,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Unity Park is Available For ...",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          Text("This Is Sub title")
                        ],
                      ),
                    )
                  ],
                ))
          ],
        ),
      ),
      bottomNavigationBar: BottomNav(),
    );
  }
}

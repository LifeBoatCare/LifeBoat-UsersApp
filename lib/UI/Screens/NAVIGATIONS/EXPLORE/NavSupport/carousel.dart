import 'package:flutter/material.dart';

import 'package:getwidget/getwidget.dart';

int _currentIndex = 0;

class MyCarousel extends StatefulWidget {
  @override
  _MyCarouselState createState() => _MyCarouselState();
}

class _MyCarouselState extends State<MyCarousel> {
  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < imageList.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  final List<String> imageList = [
    "https://cdn.pixabay.com/photo/2017/12/03/18/04/christmas-balls-2995437_960_720.jpg",
    "https://cdn.pixabay.com/photo/2017/12/13/00/23/christmas-3015776_960_720.jpg",
    "https://cdn.pixabay.com/photo/2019/12/19/10/55/christmas-market-4705877_960_720.jpg",
    "https://cdn.pixabay.com/photo/2019/12/20/00/03/road-4707345_960_720.jpg",
    "https://cdn.pixabay.com/photo/2016/11/22/07/09/spruce-1848543__340.jpg"
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
      height: MediaQuery.of(context).size.height / 3.9,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            GFCarousel(
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              pauseAutoPlayOnTouch: Duration(seconds: 10),
              height: MediaQuery.of(context).size.height / 5.2,
              items: imageList.map(
                (url) {
                  return Column(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ClipRRect(
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0)),
                            child: Image.network(url,
                                fit: BoxFit.cover, width: 1000.0),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ).toList(),
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: map<Widget>(imageList, (index, url) {
                return Container(
                  width: 10.0,
                  height: 10.0,
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentIndex == index
                        ? Colors.blueAccent
                        : Colors.grey,
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_app/UI/Screens/NAVIGATIONS/EXPLORE/NavSupport/carousel.dart';
import 'package:flutter_app/UI/Screens/NAVIGATIONS/EXPLORE/explore_tabs.dart';

class Explore extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            'Explore',
            style: TextStyle(color: Colors.black),
          ),
          actions: [
            IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.black,
              ),
              onPressed: null,
              iconSize: 30,
            ),
            SizedBox(
              width: 20,
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            Center(child: MyCarousel()),
            ExploreTabs(),
          ]),
        ));
  }
}

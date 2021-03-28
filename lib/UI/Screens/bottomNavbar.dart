import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_app/UI/Screens/NAVIGATIONS/EXPLORE/explore_base.dart';
import 'package:flutter_app/UI/Screens/NAVIGATIONS/SELF%20HELP/selfhelp_base.dart';
import 'package:flutter_app/UI/Screens/NAVIGATIONS/THERAPIST/therapist_base.dart';

import 'package:flutter_app/UI/Screens/home.dart';

import 'NAVIGATIONS/MENU/menu_page.dart';

class BottomNavbar extends StatefulWidget {
  @override
  _BottomNavbarState createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  ListQueue<int> _navigationQueue = ListQueue();
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      child: WillPopScope(
        onWillPop: () async {
/* Use this code if you just want to go back to 0th index*/
          if (index == 0) return true;
          setState(() {
            index = 0;
          });
          return false;

/* below code keeps track of all the navigated indexes*/
          if (_navigationQueue.isEmpty) return true;

          setState(() {
            index = _navigationQueue.last;
            _navigationQueue.removeLast();
          });
          return false;
        },
        child: Scaffold(
          body: (_getBody(index)),
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.white,
            selectedItemColor: Color(0xFFf5851f),
            unselectedItemColor: Colors.grey,
            type: BottomNavigationBarType.fixed,
            currentIndex: index,

            // onTap: (value) => setState(() => index = value),
            onTap: (value) {
              _navigationQueue.addLast(index);
              setState(() => index = value);
              print(value);
            },
            items: [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                    size: 32,
                    color: index == 0 ? Colors.black : Colors.black45,
                  ),
                  backgroundColor: Colors.blueAccent,
                  // ignore: deprecated_member_use
                  title: index == 0
                      ? Text('Home',
                          // ignore: deprecated_member_use
                          style: Theme.of(context).textTheme.title.merge(
                                TextStyle(color: Colors.black, fontSize: 12),
                              ))
                      : Text(' ')),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.explore,
                    size: 32,
                    color: index == 1 ? Colors.black : Colors.black45,
                  ),
                  // ignore: deprecated_member_use
                  title: index == 1
                      ? Text('Explore',
                          // ignore: deprecated_member_use
                          style: Theme.of(context).textTheme.title.merge(
                                TextStyle(color: Colors.black, fontSize: 12),
                              ))
                      : Text(' ')),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.video_library_rounded,
                    size: 32,
                    color: index == 2 ? Colors.black : Colors.black45,
                  ),
                  // ignore: deprecated_member_use
                  title: index == 2
                      ? Text('Self Help',
                          // ignore: deprecated_member_use
                          style: Theme.of(context).textTheme.title.merge(
                                TextStyle(color: Colors.black, fontSize: 12),
                              ))
                      : Text(' ')),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.account_box_sharp,
                    size: 32,
                    color: index == 3 ? Colors.black : Colors.black45,
                  ),
                  // ignore: deprecated_member_use
                  title: index == 3
                      ? Text('Therapist',
                          // ignore: deprecated_member_use
                          style: Theme.of(context).textTheme.title.merge(
                                TextStyle(color: Colors.black, fontSize: 12),
                              ))
                      : Text(' ')),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.menu,
                    size: 32,
                    color: index == 4 ? Colors.black : Colors.black45,
                  ),
                  // ignore: deprecated_member_use
                  title: index == 4
                      ? Text('Menu',
                          // ignore: deprecated_member_use
                          style: Theme.of(context).textTheme.title.merge(
                                TextStyle(color: Colors.black, fontSize: 12),
                              ))
                      : Text(' ')),
              //TextStyle(fontSize: 12, fontWeight: FontWeight.w600))),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getBody(int index) {
    switch (index) {
      case 0:
        return Home(); // Create this function, it should return your first page as a widget
      case 1:
        return Explore();
      case 2:
        return SelfHelp();
      case 3:
        return Therapist();

      case 4:
        return Menu();

      // Create this function, it should return your second page as a widget
      // Create this function, it should return your fourth page as a widget
    }
  }
}

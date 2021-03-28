import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.fromLTRB(27, 0, 0, 0),
          child: Row(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height * .05,
                width: MediaQuery.of(context).size.width * .07,
                child: CircleAvatar(
                  maxRadius: 15,
                  minRadius: 15,
                ),
              ),
            ],
          ),
        ),
        title: Text(
          "John",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.logout,
              color: Colors.black,
              size: 24,
            ),
            onPressed: () {
              // do something
            },
          ),
          SizedBox(
            width: 5,
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(8),
              margin: EdgeInsets.fromLTRB(0, 8, 0, 0),
              color: Colors.white,
              child: Column(
                children: [
                  MenuOption("Edit Profile"),
                  Divider(
                    color: Colors.black12,
                    height: 20,
                    thickness: 2,
                    indent: 10,
                    endIndent: 10,
                  ),
                  MenuOption("Settings"),
                  Divider(
                    color: Colors.black12,
                    height: 20,
                    thickness: 2,
                    indent: 10,
                    endIndent: 10,
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.white,
              padding: EdgeInsets.all(8),
              margin: EdgeInsets.fromLTRB(0, 8, 0, 0),
              child: Column(
                children: [
                  MenuOption("Notifications"),
                  Divider(
                    color: Colors.black12,
                    height: 20,
                    thickness: 2,
                    indent: 10,
                    endIndent: 10,
                  ),
                  MenuOption("Favourites"),
                  Divider(
                    color: Colors.black12,
                    height: 20,
                    thickness: 2,
                    indent: 10,
                    endIndent: 10,
                  ),
                  MenuOption("Manage"),
                  Divider(
                    color: Colors.black12,
                    height: 20,
                    thickness: 2,
                    indent: 10,
                    endIndent: 10,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MenuOption extends StatelessWidget {
  final String optionname;
  MenuOption(this.optionname);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(26, 8, 8, 8),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
                color: Colors.black, borderRadius: BorderRadius.circular(8)),
            child: Center(
              child: IconButton(
                onPressed: null,
                icon: Icon(
                  Icons.menu,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.fromLTRB(18, 8, 8, 8),
            child: Text(
              optionname,
              style: TextStyle(fontSize: 16),
            ),
          )),
        ],
      ),
    );
  }
}

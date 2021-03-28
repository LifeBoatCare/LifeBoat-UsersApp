import 'package:flutter/material.dart';
import 'package:flutter_app/UI/Screens/NAVIGATIONS/SELF%20HELP/selfhelp_tabs.dart';

class SelfHelp extends StatelessWidget {
  final List options = [
    "Talk to our bot",
    "Relaxing Music",
    "Nature vibes",
    "Lo-fi ",
    "Talk to our bot",
    "Relaxing Music",
    "Nature vibes"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Self-Help',
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
      body: Container(
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.all(8),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 5.4,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: ClampingScrollPhysics(),
                  itemCount: options.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 38,
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Container(
                            width: 95,
                            child: Text(
                              options[index],
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
              Container(child: SelfHelpTabs()),
            ],
          ),
        ),
      ),
    );
  }
}

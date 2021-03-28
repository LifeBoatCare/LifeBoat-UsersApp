import 'package:flutter/material.dart';
import 'package:flutter_app/UI/Screens/NAVIGATIONS/THERAPIST/therapist_tabs.dart';

class Therapist extends StatelessWidget {
  final List therapistnames = [
    "Pradeep",
    "Hari",
    "kiran",
    "hello",
    "hai",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Therapist',
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
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Container(
            height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.all(8),
            child: Column(
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Container(
                    height: MediaQuery.of(context).size.height / 5.4,
                    child: Row(
                      children: [
                        ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          physics: ClampingScrollPhysics(),
                          itemCount: therapistnames.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Column(
                                children: [
                                  Stack(
                                    children: [
                                      CircleAvatar(
                                        radius: 38,
                                        backgroundColor: Colors.lightBlueAccent,
                                      ),
                                      Positioned(
                                        right: 6,
                                        child: CircleAvatar(
                                          radius: 11,
                                          backgroundColor: Colors.lightBlue,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 6,
                                  ),
                                  Container(
                                    width: 95,
                                    child: Text(
                                      therapistnames[index],
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
                        Column(
                          children: [
                            Padding(
                                padding: EdgeInsets.fromLTRB(7, 2, 2, 2),
                                child: Stack(
                                  children: [
                                    Container(
                                      width: 77,
                                      height: 77,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.black,
                                            width: 2,
                                          ),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(52))),
                                    ),
                                    Positioned.fill(
                                        child: Align(
                                      alignment: Alignment.center,
                                      child: Icon(
                                        Icons.add,
                                        size: 40,
                                      ),
                                    ))
                                  ],
                                )),
                            SizedBox(
                              height: 6,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                TherapistTabs(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

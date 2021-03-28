import 'package:flutter/material.dart';
import 'package:flutter_app/Models/therapist_model.dart';

import 'package:flutter_app/UI/Screens/NAVIGATIONS/EXPLORE/NavTherapist/therapist_detail.dart';

class InnerTherapistTile extends StatelessWidget {
  final TherapistClass therapistClass;
  final int index;
  InnerTherapistTile({this.therapistClass, this.index});

  @override
  Widget build(BuildContext context) {
    String language2;
    therapistClass.lang2 == null
        ? language2 = "only"
        : language2 = therapistClass.lang2;
    return InkWell(
      onTap: () {
        showModalBottomSheet(
            shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.only(
                    topLeft: const Radius.circular(10.0),
                    topRight: const Radius.circular(10.0))),
            isScrollControlled: true,
            context: context,
            builder: (BuildContext context) {
              return Container(
                child: FractionallySizedBox(
                  heightFactor: .8,
                  child: DraggableScrollableSheet(
                      maxChildSize: 1,
                      initialChildSize: 1,
                      minChildSize: 1,
                      expand: true,
                      builder: (context, scrollController) {
                        return SingleChildScrollView(
                            child: TherapistDetails(
                          therapistClass: therapistClass,
                        ));
                      }),
                ),
              );
            });
      },
      child: Container(
          padding: EdgeInsets.fromLTRB(15, 10, 0, 10),
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.blue,
                radius: 37,
              ),
              SizedBox(
                width: 30,
              ),
              Expanded(
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        therapistClass.title,
                        style: TextStyle(
                            fontSize: 19, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Text(
                        therapistClass.lang2 == null
                            ? "Language: ${therapistClass.lang1} $language2"
                            : "Language: ${therapistClass.lang1} , $language2",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                      Row(
                        children: [
                          Text(
                            "${therapistClass.members} members  | ",
                            style: TextStyle(color: Colors.black45),
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.amber[200],
                          ),
                          Text("${therapistClass.rating}")
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }
}

class TherapistTileList extends StatelessWidget {
  final List therapistList;
  final String title;
  TherapistTileList({this.therapistList, this.title});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            leading: BackButton(
              color: Colors.black,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            title: Text(
              title,
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
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
            margin: EdgeInsets.all(10),
            child: Container(
                child: Column(
              children: [
                SizedBox(
                  height: 4,
                ),
                SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(maxHeight: 560),
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      itemCount: therapistList.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            InnerTherapistTile(
                              therapistClass: therapistList[index],
                              index: index,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Divider(
                              color: Colors.black12,
                              height: 20,
                              thickness: 2,
                              indent: 25,
                              endIndent: 10,
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ],
            )),
          ),
        ));
  }
}

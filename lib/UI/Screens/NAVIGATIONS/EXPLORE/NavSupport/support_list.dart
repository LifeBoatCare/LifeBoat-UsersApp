import 'package:flutter/material.dart';

import 'package:flutter_app/Models/support_model.dart';
import 'package:flutter_app/UI/Screens/NAVIGATIONS/EXPLORE/NavSupport/support_detail.dart';

class SupportGroupTile extends StatelessWidget {
  final SupportGroupClass supportGroupClass;
  final int index;
  SupportGroupTile({
    this.supportGroupClass,
    this.index,
  });

  @override
  Widget build(BuildContext context) {
    String language;
    supportGroupClass.lang2 == null
        ? language = "only"
        : language = supportGroupClass.lang2;
    return InkWell(
      onTap: () {
        showModalBottomSheet(
            shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.only(
                    topLeft: const Radius.circular(16.0),
                    topRight: const Radius.circular(16.0))),
            isScrollControlled: true,
            context: context,
            builder: (BuildContext context) {
              return Container(
                child: FractionallySizedBox(
                  heightFactor: .7,
                  child: DraggableScrollableSheet(
                      maxChildSize: 1,
                      initialChildSize: 1,
                      minChildSize: 1, //set this as you want
                      //set this as you want
                      expand: true,
                      builder: (context, scrollController) {
                        return SingleChildScrollView(
                            child: SupportDetails(supportGroupClass));
                        //whatever you're returning, does not have to be a Container
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
                        supportGroupClass.groupname,
                        style: TextStyle(
                            fontSize: 19, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Text(
                        supportGroupClass.lang2 == null
                            ? "Language: ${supportGroupClass.lang1} $language"
                            : "Language: ${supportGroupClass.lang1} , $language",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                      Row(
                        children: [
                          Text(
                            "${supportGroupClass.members} members  | ",
                            style: TextStyle(color: Colors.black45),
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.amber[200],
                          ),
                          Text("${supportGroupClass.rating}")
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

class SupportGroupsListView extends StatelessWidget {
  final List groupList;
  final String title;
  SupportGroupsListView({this.groupList, this.title});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
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
                      itemCount: groupList.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            SupportGroupTile(
                              supportGroupClass: groupList[index],
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

import 'package:flutter/material.dart';
import 'package:flutter_app/Models/chats_model.dart';
import 'package:flutter_app/Models/upcoming_model.dart';

class MessageTile extends StatelessWidget {
  final MessageClass messageClass;
  MessageTile({this.messageClass});
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.fromLTRB(10, 15, 0, 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            messageClass.isOnline
                ? Stack(
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
                  )
                : CircleAvatar(
                    maxRadius: 38,
                    backgroundColor: Colors.lightBlueAccent,
                  ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 3,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          messageClass.username,
                          style: TextStyle(
                              fontSize: 19, fontWeight: FontWeight.bold),
                        ),
                        Text(messageClass.time),
                      ],
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Text(
                      messageClass.mssg,
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}

class MessageTileListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ListView.builder(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        itemCount: messageList.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              MessageTile(
                messageClass: messageList[index],
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
    );
  }
}

class UpcomingTile extends StatelessWidget {
  final UpcomingClass upcomingClass;
  UpcomingTile({this.upcomingClass});
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.fromLTRB(10, 15, 0, 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              maxRadius: 38,
              backgroundColor: Colors.lightBlueAccent,
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 3,
                    ),
                    Text(
                      upcomingClass.therapyTitle,
                      style:
                          TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Text(
                      upcomingClass.therapistName,
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Text(
                      "${upcomingClass.day} | ${upcomingClass.time}",
                      style:
                          TextStyle(fontSize: 13, fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}

class UpcomingTileListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ListView.builder(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        itemCount: upcomingList.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              UpcomingTile(
                upcomingClass: upcomingList[index],
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
    );
  }
}

class TherapistTabs extends StatefulWidget {
  @override
  _TherapistTabsState createState() => _TherapistTabsState();
}

class _TherapistTabsState extends State<TherapistTabs>
    with TickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
// TODO: implement initState
    super.initState();
    _tabController = new TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: <Widget>[
        Container(
          child: Column(
            children: <Widget>[
              Container(
                height: 40,
                margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
                child: TabBar(
                  tabs: [
                    Container(
                      padding: EdgeInsets.only(bottom: 15),
                      width: MediaQuery.of(context).size.width,
                      child: new Text(
                        'UPCOMING',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(bottom: 15),
                      width: MediaQuery.of(context).size.width,
                      child: new Text(
                        'CHATS',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16),
                      ),
                    )
                  ],
                  unselectedLabelColor: const Color(0xffacb3bf),
                  indicatorColor: Colors.black,
                  labelColor: Colors.black,
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicatorWeight: 3.0,
                  indicatorPadding: EdgeInsets.all(10),
                  isScrollable: false,
                  controller: _tabController,
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * .7,
                child:
                    TabBarView(controller: _tabController, children: <Widget>[
                  Container(
                    child: UpcomingTileListView(),
                  ),
                  Container(
                    child: MessageTileListView(),
                  )
                ]),
              )
            ],
          ),
        )
      ],
    ));
  }
}

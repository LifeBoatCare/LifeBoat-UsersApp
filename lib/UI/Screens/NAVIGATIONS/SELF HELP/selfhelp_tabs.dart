import 'package:flutter/material.dart';
import 'package:flutter_app/UI/Screens/NAVIGATIONS/SELF%20HELP/category_tiles.dart';

class SelfHelpTabs extends StatefulWidget {
  @override
  _SelfHelpTabsState createState() => _SelfHelpTabsState();
}

class _SelfHelpTabsState extends State<SelfHelpTabs>
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
                        'VIDEOS',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(bottom: 15),
                      width: MediaQuery.of(context).size.width,
                      child: new Text(
                        'READ',
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
                height: MediaQuery.of(context).size.height * .54,
                child:
                    TabBarView(controller: _tabController, children: <Widget>[
                  Container(
                    child: Column(
                      children: [
                        Flexible(
                          child: GridView.count(
                            physics: ClampingScrollPhysics(),
                            shrinkWrap: true,
                            // Create a grid with 2 columns. If you change the scrollDirection to
                            // horizontal, this produces 2 rows.
                            crossAxisCount: 2,
                            // Generate 100 widgets that display their index in the List.
                            children: List.generate(videos.length, (index) {
                              return Container(
                                  child: CategoryTile(
                                title: videos[index],
                              ));
                            }),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        Flexible(
                          child: GridView.count(
                            physics: ClampingScrollPhysics(),
                            shrinkWrap: true,
                            // Create a grid with 2 columns. If you change the scrollDirection to
                            // horizontal, this produces 2 rows.
                            crossAxisCount: 2,
                            // Generate 100 widgets that display their index in the List.
                            children: List.generate(videos.length, (index) {
                              return Container(
                                  child: CategoryTile(
                                title: videos[index],
                              ));
                            }),
                          ),
                        ),
                      ],
                    ),
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

List videos = [
  "TED Talks",
  "Loneliness",
  "Relationships",
  "TED Talks",
  "Loneliness",
];

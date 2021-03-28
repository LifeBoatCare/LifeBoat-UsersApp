import 'package:flutter/material.dart';
import 'package:flutter_app/Providers/support_provider.dart';
import 'package:flutter_app/UI/Screens/NAVIGATIONS/EXPLORE/NavSupport/support_catogory.dart';
import 'package:flutter_app/UI/Screens/NAVIGATIONS/EXPLORE/NavTherapist/therapist_catogory.dart';
import 'package:provider/provider.dart';

class ExploreTabs extends StatefulWidget {
  @override
  _ExploreTabsState createState() => _ExploreTabsState();
}

class _ExploreTabsState extends State<ExploreTabs>
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
                        'SUPPORT GROUPS',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(bottom: 15),
                      width: MediaQuery.of(context).size.width,
                      child: new Text(
                        'THERAPISTS',
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
                  ChangeNotifierProvider(
                    create: (ctx) => SupportCategories(),
                    child: Container(
                      child: SupportCategoryGridView(),
                    ),
                  ),
                  Container(
                    child: TherapistGridView(),
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

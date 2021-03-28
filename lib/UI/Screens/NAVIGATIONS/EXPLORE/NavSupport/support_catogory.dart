import 'package:flutter/material.dart';
import 'package:flutter_app/Models/support_model.dart';
import 'package:flutter_app/Providers/support_provider.dart';
import 'package:provider/provider.dart';

import 'package:flutter_app/UI/Screens/NAVIGATIONS/EXPLORE/NavSupport/support_list.dart';

class SupportCategoryTile extends StatelessWidget {
  final SupportCategoryClass supportCategoryClass;
  final String title;

  SupportCategoryTile({this.supportCategoryClass, this.title});
  @override
  Widget build(BuildContext context) {
    final reqSupportList = Provider.of<SupportCategories>(context).items;

    List reqSupportGroup;
    for (int i = 0; i < reqSupportList.length; i++) {
      if (reqSupportList[i].title == title) {
        reqSupportGroup = reqSupportList[i].groupList;
      }
    }

    print(reqSupportGroup[0]);
    print("............");
    print(supportgroupList1[1]);
    print("..........");
    print(supportgroupList1);
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SupportGroupsListView(
                groupList: supportCategoryClass.groupList,
                title: supportCategoryClass.title,
              ),
            ));
      },
      child: Column(
        children: [
          Expanded(
            child: Container(
              height: 200,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(6, 11, 6, 11),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey,
                  ),
                  width: MediaQuery.of(context).size.width * .41,
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(13, 0, 10, 20),
                    child: Text(
                      supportCategoryClass.title,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 2,
            width: 2,
          ),
        ],
      ),
    );
  }
}

class SupportCategoryGridView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final supportData = Provider.of<SupportCategories>(context);
    final categories = supportData.items;
    print(categories);
    return Container(
      height: MediaQuery.of(context).size.height,
      padding: EdgeInsets.all(9),
      child: Column(
        children: [
          Flexible(
            child: GridView.count(
              physics: BouncingScrollPhysics(),
              shrinkWrap: true,
              // Create a grid with 2 columns. If you change the scrollDirection to
              // horizontal, this produces 2 rows.
              crossAxisCount: 2,
              // Generate 100 widgets that display their index in the List.
              children: List.generate(categories.length, (index) {
                return SupportCategoryTile(
                  supportCategoryClass: categories[index],
                  title: categories[index].title,
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}

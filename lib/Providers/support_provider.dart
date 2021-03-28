import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter_app/Models/support_model.dart';

class SupportCategories with ChangeNotifier {
  List<SupportCategoryClass> _items = [
    SupportCategoryClass(title: "Relationship", groupList: supportgroupList1),
    SupportCategoryClass(title: "Loneliness", groupList: supportgroupList2),
    SupportCategoryClass(title: "Depression", groupList: supportgroupList3),
    SupportCategoryClass(title: "Social Anxiety", groupList: supportgroupList1),
    SupportCategoryClass(title: "Relationship", groupList: supportgroupList2),
    SupportCategoryClass(title: "Loneliness", groupList: supportgroupList3),
  ];

  List<SupportCategoryClass> get items {
    return [..._items];
  }

  void addSupportCategory() {
    //_items.add(value);
    notifyListeners();
  }
}

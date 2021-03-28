import 'package:flutter/material.dart';

class SupportCategoryClass {
  final String title;
  final List groupList;

  SupportCategoryClass({
    @required this.title,
    @required this.groupList,
  });
}

class SupportGroupClass {
  final String groupname;
  final String lang1;
  final int members;
  final double rating;
  final String lang2;
  final String docname;
  final String docfield;
  final String desc;
  final String date;
  final String time;

  SupportGroupClass({
    @required this.groupname,
    @required this.lang1,
    @required this.members,
    @required this.rating,
    @required this.docname,
    @required this.docfield,
    @required this.desc,
    @required this.date,
    @required this.time,
    this.lang2,
  });
}

List supportgroupList1 = [
  SupportGroupClass(
      groupname: "Hello Support Group",
      lang1: "Malayalam",
      members: 30,
      rating: 4.5,
      docname: "jeevan",
      docfield: "Mental Health",
      desc: "fhfhfhfh fvjmvjkvrjn",
      date: "4/5/2020",
      time: "5.00 pm",
      lang2: "English"),
  SupportGroupClass(
      groupname: "Reunite Support Group",
      lang1: "Tamil",
      members: 30,
      rating: 4.5,
      docname: "Ramesh",
      docfield: "Mental Health",
      desc:
          "Have any issues dont keep it with youself . It could explode. My sessions will help you in managing your mental issues.. ",
      date: "20/6/2021",
      time: "6.00 pm",
      lang2: "English"),
  SupportGroupClass(
    groupname: "Relations Group3 ",
    lang1: "English",
    members: 30,
    rating: 4.5,
    docname: "Jack",
    docfield: "Mental Health",
    desc:
        "Have any issues dont keep it with youself . It could explode. My sessions will help you in managing your mental issues.. ",
    date: "27/6/2021",
    time: "7.00 pm",
  ),
];

List supportgroupList2 = [
  SupportGroupClass(
      groupname: "Hello Support Group",
      lang1: "Malayalam",
      members: 30,
      rating: 4.5,
      docname: "jeevan",
      docfield: "Mental Health",
      desc: "fhfhfhfh fvjmvjkvrjn",
      date: "4/5/2020",
      time: "5.00 pm",
      lang2: "English"),
  SupportGroupClass(
      groupname: "Reunite Support Group",
      lang1: "Tamil",
      members: 30,
      rating: 4.5,
      docname: "Ramesh",
      docfield: "Mental Health",
      desc:
          "Have any issues dont keep it with youself . It could explode. My sessions will help you in managing your mental issues.. ",
      date: "20/6/2021",
      time: "6.00 pm",
      lang2: "English"),
];

List supportgroupList3 = [
  SupportGroupClass(
      groupname: "Hello Support Group",
      lang1: "Malayalam",
      members: 30,
      rating: 4.5,
      docname: "jeevan",
      docfield: "Mental Health",
      desc: "fhfhfhfh fvjmvjkvrjn",
      date: "4/5/2020",
      time: "5.00 pm",
      lang2: "English"),
];

List supportCategoryList = [
  SupportCategoryClass(title: "Relationship", groupList: supportgroupList1),
  SupportCategoryClass(title: "Loneliness", groupList: supportgroupList2),
  SupportCategoryClass(title: "Depression", groupList: supportgroupList3),
  SupportCategoryClass(title: "Social Anxiety", groupList: supportgroupList1),
  SupportCategoryClass(title: "Relationship", groupList: supportgroupList2),
  SupportCategoryClass(title: "Loneliness", groupList: supportgroupList3),
];

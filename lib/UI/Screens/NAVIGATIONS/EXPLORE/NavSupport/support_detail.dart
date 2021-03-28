import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:flutter_app/Models/support_model.dart';

class SupportDetails extends StatelessWidget {
  final SupportGroupClass supportGroupClass;
  SupportDetails(this.supportGroupClass);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      height: MediaQuery.of(context).size.height * .6,
      margin: EdgeInsets.all(30),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 2,
                  child: Text(
                    supportGroupClass.groupname,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 8,
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.fromLTRB(15, 6, 15, 6),
                    child: Text(
                      'Join Group',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      border: Border.all(color: Colors.black),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 25,
            ),
            Column(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    supportGroupClass.docname,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "${supportGroupClass.docfield}  | ",
                        style: TextStyle(color: Colors.black45),
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.amber[200],
                      ),
                      Text("${supportGroupClass.rating}")
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: Text(
                    supportGroupClass.desc,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 25,
            ),
            Divider(
              color: Colors.black12,
              height: 20,
              thickness: 2,
              indent: 2,
              endIndent: 2,
            ),
            Column(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "DATE & TIME",
                    style: TextStyle(
                        fontWeight: FontWeight.w700, letterSpacing: 2.0),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(10, 6, 10, 6),
                        decoration: new BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(4)),
                            boxShadow: [
                              new BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 8.0,
                                  offset: Offset(0, 1.0)),
                            ]),
                        child: Row(
                          children: [
                            Text(" |  "),
                            Text(supportGroupClass.date),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 50,
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(10, 6, 10, 6),
                        decoration: new BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(4)),
                            boxShadow: [
                              new BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 8.0,
                                  offset: Offset(0, 1.0)),
                            ]),
                        child: Row(
                          children: [
                            Text(" |  "),
                            Text(supportGroupClass.time)
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            Divider(
              color: Colors.black12,
              height: 20,
              thickness: 2,
              indent: 2,
              endIndent: 2,
            ),
            Column(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "LANGUAGES",
                    style: TextStyle(
                        fontWeight: FontWeight.w700, letterSpacing: 2.0),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(10, 6, 10, 6),
                        decoration: new BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(4)),
                            boxShadow: [
                              new BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 8.0,
                                  offset: Offset(0, 1.0)),
                            ]),
                        child: Row(
                          children: [
                            Text(" |  "),
                            Text(supportGroupClass.lang1),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 50,
                      ),
                      supportGroupClass.lang2 != null
                          ? Container(
                              padding: EdgeInsets.fromLTRB(10, 6, 10, 6),
                              decoration: new BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(4)),
                                  boxShadow: [
                                    new BoxShadow(
                                        color: Colors.grey,
                                        blurRadius: 8.0,
                                        offset: Offset(0, 1.0)),
                                  ]),
                              child: Row(
                                children: [
                                  Text(" |  "),
                                  Text(supportGroupClass.lang2)
                                ],
                              ),
                            )
                          : Container(),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

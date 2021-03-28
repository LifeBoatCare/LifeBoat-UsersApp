import 'package:flutter/material.dart';
import 'package:flutter_app/Models/therapist_model.dart';
import 'package:flutter_app/UI/Screens/NAVIGATIONS/EXPLORE/NavTherapist/therapy_booking_page.dart';

class TherapistDetails extends StatelessWidget {
  final TherapistClass therapistClass;
  TherapistDetails({this.therapistClass});
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
        height: MediaQuery.of(context).size.height * .8,
        margin: EdgeInsets.all(30),
        child: Column(
          children: [
            Expanded(
              child: Center(
                  child: Stack(children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Container(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 70,
                        ),
                        Text(
                          therapistClass.therapistname,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w800),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "${therapistClass.therapistcategory}  | ",
                              style: TextStyle(color: Colors.black45),
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.amber[200],
                            ),
                            Text(therapistClass.rating.toString()),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.timer),
                            Container(
                                child: Text(
                                    "${therapistClass.therapistexperience} yrs Experience"))
                          ],
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Divider(
                          color: Colors.black12,
                          height: 20,
                          thickness: 2,
                          indent: 85,
                          endIndent: 85,
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Container(
                          alignment: Alignment.center,
                          child: Text(
                            therapistClass.therapistdesc,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                  margin: EdgeInsets.fromLTRB(0, 48, 0, 25),
                  height: MediaQuery.of(context).size.height * .36,
                  decoration: BoxDecoration(
                    color: Colors.blue[100],
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                Align(
                    alignment: Alignment.topCenter,
                    child: SizedBox(
                      child: CircleAvatar(
                        radius: 55.0,
                        backgroundColor: Colors.black,
                        child: CircleAvatar(
                          child: Align(
                            alignment: Alignment.bottomRight,
                          ),
                          radius: 52.0,
                          backgroundColor: Colors.blue[300],
                        ),
                      ),
                    )),
              ])),
            ),
            SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  TherapistPageBottomTile(
                      therapistClass.reviewname1, therapistClass.reviewdesc1),
                  SizedBox(
                    width: 20,
                  ),
                  TherapistPageBottomTile(
                      therapistClass.reviewname2, therapistClass.reviewdesc2),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 24, 8, 4),
              child: Row(
                children: [
                  Column(
                    children: [
                      Container(
                        child: Text(
                          "Rs. 100/month",
                          style:
                              TextStyle(decoration: TextDecoration.lineThrough),
                        ),
                      ),
                      Container(
                        child: Text("Free Trial"),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Container(
                    height: 40,
                    width: MediaQuery.of(context).size.width * .4,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 2),
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: RaisedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TherapyBookingPage(
                                      therapistClass: therapistClass,
                                    )));
                      },
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child: Text("See Available Dates"),
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }
}

class TherapistPageBottomTile extends StatelessWidget {
  final String reviewname;
  final String desc;
  TherapistPageBottomTile(this.reviewname, this.desc);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .64,
      height: MediaQuery.of(context).size.height * .24,
      decoration: BoxDecoration(
        color: Colors.blue[100],
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(children: [
        Container(
          padding: EdgeInsets.all(20),
          margin: EdgeInsets.only(bottom: 50),
          child: CircleAvatar(
            radius: 30,
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 13, 5, 4),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 13,
                ),
                Container(
                  child: Text(
                    reviewname,
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                  ),
                ),
                SizedBox(
                  height: 3,
                ),
                Expanded(
                  child: Container(
                    width: MediaQuery.of(context).size.width * .33,
                    child: Text(desc),
                  ),
                )
              ],
            ),
          ),
        )
      ]),
    );
  }
}

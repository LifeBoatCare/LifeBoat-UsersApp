import 'package:flutter/material.dart';
import 'package:flutter_app/Models/therapist_model.dart';

class TherapyBookingPage extends StatefulWidget {
  final TherapistClass therapistClass;
  TherapyBookingPage({this.therapistClass});
  @override
  _TherapyBookingPageState createState() => _TherapyBookingPageState();
}

class _TherapyBookingPageState extends State<TherapyBookingPage> {
  void handleClick(String value) {
    switch (value) {
      case 'Logout':
        break;
      case 'Settings':
        break;
    }
  }

  bool isclickedbtn1 = false;
  bool isclickedbtn2 = false;
  bool isclickedbtn3 = false;
  bool isclickedbtn4 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: Colors.black,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.white,
        title: Text(
          "Therapy Booking",
          style: TextStyle(color: Colors.black),
        ),
        actions: <Widget>[
          PopupMenuButton<String>(
            icon: Icon(
              Icons.more_vert,
              color: Colors.black,
            ),
            onSelected: handleClick,
            itemBuilder: (BuildContext context) {
              return {'Logout', 'Settings'}.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 2.9,
              ),
              Container(
                padding: EdgeInsets.all(20),
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "TIMINGS",
                      style: TextStyle(letterSpacing: 2.0, fontSize: 16),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Container(
                      child: ExpansionTile(
                        title: Text('Morning',
                            style: TextStyle(color: Colors.black87)),
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                RaisedButton(
                                  onPressed: () {
                                    setState(() {
                                      isclickedbtn1 = !isclickedbtn1;
                                      isclickedbtn2 = false;
                                      isclickedbtn3 = false;
                                      isclickedbtn4 = false;
                                    });
                                  },
                                  color: isclickedbtn1
                                      ? Colors.blue[900]
                                      : Colors.white,
                                  child: Text(
                                      "|  ${widget.therapistClass.morntime1}",
                                      style: TextStyle(
                                          color: isclickedbtn1
                                              ? Colors.white
                                              : Colors.black)),
                                  elevation: 2.0,
                                ),
                                SizedBox(width: 20),
                                RaisedButton(
                                  onPressed: () {
                                    setState(() {
                                      isclickedbtn2 = !isclickedbtn2;
                                      isclickedbtn1 = false;
                                      isclickedbtn3 = false;
                                      isclickedbtn4 = false;
                                    });
                                  },
                                  color: isclickedbtn2
                                      ? Colors.blue[900]
                                      : Colors.white,
                                  child: Text(
                                      "| ${widget.therapistClass.morntime2}",
                                      style: TextStyle(
                                          color: isclickedbtn2
                                              ? Colors.white
                                              : Colors.black)),
                                  elevation: 2.0,
                                  hoverColor: Colors.grey,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      child: ExpansionTile(
                        title: Text(
                          'Evening',
                          style: TextStyle(color: Colors.black87),
                        ),
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                RaisedButton(
                                  onPressed: () {
                                    setState(() {
                                      isclickedbtn3 = !isclickedbtn3;
                                      isclickedbtn2 = false;
                                      isclickedbtn1 = false;
                                      isclickedbtn4 = false;
                                    });
                                  },
                                  color: isclickedbtn3
                                      ? Colors.blue[900]
                                      : Colors.white,
                                  child: Text(
                                      "| ${widget.therapistClass.eventime1}",
                                      style: TextStyle(
                                          color: isclickedbtn3
                                              ? Colors.white
                                              : Colors.black)),
                                  elevation: 2.0,
                                ),
                                SizedBox(width: 20),
                                RaisedButton(
                                  onPressed: () {
                                    setState(() {
                                      isclickedbtn4 = !isclickedbtn4;
                                      isclickedbtn2 = false;
                                      isclickedbtn3 = false;
                                      isclickedbtn1 = false;
                                    });
                                  },
                                  color: isclickedbtn4
                                      ? Colors.blue[900]
                                      : Colors.white,
                                  child: Text(
                                      "| ${widget.therapistClass.eventime2}",
                                      style: TextStyle(
                                          color: isclickedbtn4
                                              ? Colors.white
                                              : Colors.black)),
                                  elevation: 2.0,
                                  hoverColor: Colors.grey,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 23),
                    Container(
                      height: 45,
                      width: MediaQuery.of(context).size.width * .4,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 2),
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child: RaisedButton(
                        onPressed: () {},
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        child: Text("Confirm Booking"),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

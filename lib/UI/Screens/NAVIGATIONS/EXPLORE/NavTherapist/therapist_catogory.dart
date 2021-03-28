import 'package:flutter/material.dart';
import 'package:flutter_app/Models/therapist_model.dart';

import 'package:flutter_app/UI/Screens/NAVIGATIONS/EXPLORE/NavTherapist/therapist_list.dart';

class TherapistTile extends StatelessWidget {
  final TherapistCategory therapistCategory;
  TherapistTile(this.therapistCategory);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TherapistTileList(
                therapistList: therapistCategory.therapistList,
                title: therapistCategory.title,
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
                      therapistCategory.title,
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

class TherapistGridView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      padding: EdgeInsets.all(9),
      child: Column(
        children: [
          Flexible(
            child: GridView.count(
              physics: BouncingScrollPhysics(),
              shrinkWrap: true,
              crossAxisCount: 2,
              children: List.generate(therapistCategoryList.length, (index) {
                return TherapistTile(therapistCategoryList[index]);
              }),
            ),
          ),
        ],
      ),
    );
  }
}

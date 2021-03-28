import 'package:flutter/material.dart';

class CategoryTile extends StatelessWidget {
  final String title;
  CategoryTile({this.title});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Column(
        children: [
          Expanded(
            child: Container(
              height: MediaQuery.of(context).size.height * .3,
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
                      title,
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
        ],
      ),
    );
  }
}

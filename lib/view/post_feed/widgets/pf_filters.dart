import 'package:flutter/material.dart';

class PostFeedFilters extends StatelessWidget {
  const PostFeedFilters({Key? key}) : super(key: key);

  Widget _switchSection(
      {required IconData icon, bool selected = false, bool right = false}) {
    return Container(
        decoration: BoxDecoration(
          color: selected ? Colors.black : Colors.white,
          borderRadius: BorderRadius.circular(30),
        ),
        padding: const EdgeInsets.all(5),
        child: Padding(
          padding:
              EdgeInsets.only(top: 2, bottom: 2, left: right ? 2 : 8, right: 8),
          child: Icon(
            icon,
            size: 18,
            color: selected ? Colors.white : Colors.black,
          ),
        ));
  }

  Widget _eventsGroupsSwitch() {
    return Padding(
      padding: const EdgeInsets.only(right: 15),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _switchSection(icon: Icons.mood_rounded, selected: true),
            _switchSection(icon: Icons.people_rounded, right: true),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.none,
      margin: EdgeInsets.only(bottom: 10),
      height: 50,
      child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _eventsGroupsSwitch(),
              for (String s in ["sport", "kultur", "theater", "relax"])
                Padding(
                  padding: const EdgeInsets.only(right: 5),
                  child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                      child: Text("#$s"),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(color: Colors.grey.shade300),
                        color: Colors.white,
                      )),
                ),
            ],
          )),
    );
  }
}

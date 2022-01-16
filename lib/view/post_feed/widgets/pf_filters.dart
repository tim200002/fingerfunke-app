import 'package:flutter/material.dart';

class PostFeedFilters extends StatelessWidget {
  const PostFeedFilters({Key? key}) : super(key: key);

  Widget _switchSection({required IconData icon, bool selected = false}) {
    return Container(
        color: selected ? Colors.black : Colors.grey.shade200,
        padding: EdgeInsets.all(5),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
          child: Icon(
            icon,
            size: 20,
            color: selected ? Colors.white : Colors.black,
          ),
        ));
  }

  Widget _eventsGroupsSwitch() {
    return Padding(
      padding: const EdgeInsets.only(right: 15),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: Container(
          color: Colors.grey.shade300,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _switchSection(icon: Icons.mood_rounded, selected: true),
              _switchSection(icon: Icons.people_rounded),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  child: Chip(
                    label: Text("#$s"),
                    backgroundColor: Colors.grey.shade200,
                  ),
                ),
            ],
          )),
    );
  }
}

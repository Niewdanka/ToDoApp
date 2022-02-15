import 'package:flutter/material.dart';
import 'package:to_do_app/models/category.dart';

class ChooseCategory extends StatelessWidget {
  const ChooseCategory({
    Key? key,
    required this.selectedIndex,
    required this.i,
  }) : super(key: key);

  final int selectedIndex;
  final int i;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(7),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(right: 10),
            child: Icon(
              IconData(
                categories[i].icon,
                fontFamily: 'MaterialIcons',
              ),
              color: categories[selectedIndex] == categories[i]
                  ? Colors.white
                  : Colors.black,
            ),
          ),
          Text(
            categories[i].name,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: categories[selectedIndex] == categories[i]
                  ? Colors.white
                  : Colors.black,
            ),
          ),
        ],
      ),
      decoration: BoxDecoration(
        color: categories[selectedIndex] == categories[i]
            ? Color(categories[i].color)
            : Color(categories[i].color).withAlpha(40),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: Color(categories[i].color),
          width: 2,
        ),
      ),
    );
  }
}

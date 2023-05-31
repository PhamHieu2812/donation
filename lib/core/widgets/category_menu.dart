import 'package:donation/core/image_constants.dart';
import 'package:flutter/material.dart';

import 'category_menu_item.dart';

class CategoryMenu extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<CategoryMenu> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: const [
          CategoryMenuItem(
            path: ImageConstants.ic_edu,
            title: "Education",
            isSelected: true,
          ),
          CategoryMenuItem(
            path: ImageConstants.ic_pill,
            title: "Medical",
            isSelected: false,
          ),
          CategoryMenuItem(
            path: ImageConstants.ic_food,
            title: "Food",
            isSelected: false,
          ),
          CategoryMenuItem(
            path: ImageConstants.ic_accommodation,
            title: "Accommodation",
            isSelected: false,
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class CategoryDropDown extends StatefulWidget {
  const CategoryDropDown({
    Key key,
  }) : super(key: key);

  @override
  _CategoryDropDownState createState() => _CategoryDropDownState();
}

class _CategoryDropDownState extends State<CategoryDropDown> {
  var categories = ['Family', 'Health', 'Sports', 'Productivity'];
  var selected;

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.horizontal,
      children: <Widget>[
        DropdownButton(
          hint: Text('Choose your category'),
          value: selected,
          items: categories.map<DropdownMenuItem>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (value) {
            setState(() {
              selected = value;
            });
          },
        )
      ],
    );
  }
}

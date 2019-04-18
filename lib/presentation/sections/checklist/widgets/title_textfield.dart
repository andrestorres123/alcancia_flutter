import 'package:flutter/material.dart';

class TitleTextfield extends StatelessWidget {
  const TitleTextfield({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: Colors.white,
      decoration: InputDecoration(
        enabledBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
        focusedBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
        labelText: "Checklist name",
        labelStyle:
            Theme.of(context).textTheme.caption.copyWith(color: Colors.white),
      ),
      style: TextStyle(color: Colors.white),
    );
  }
}

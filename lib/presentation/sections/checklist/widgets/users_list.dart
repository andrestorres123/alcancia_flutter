import 'package:flutter/material.dart';

class UsersList extends StatelessWidget {
  const UsersList({
    Key key,
    @required this.users,
  }) : super(key: key);

  final List<String> users;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: Align(
              alignment: FractionalOffset.centerLeft,
              child: Text('Share (${users.length} people)')),
        ),
        SizedBox(
          height: 100,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: users.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: <Widget>[
                    CircleAvatar(
                      child: Text(
                        users[index].substring(0, 1),
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      users[index],
                      style: TextStyle(fontSize: 12),
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

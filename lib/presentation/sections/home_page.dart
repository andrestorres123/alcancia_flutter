import 'package:flutter/material.dart';

import '../themes.dart';

class HomePage extends StatelessWidget {
  Widget _buildNotificationsBadge() {
    return Positioned(
      top: 4,
      right: 2,
      child: SizedBox(
        height: 18,
        width: 18,
        child: CircleAvatar(
          backgroundColor: AlcanciaColors.green,
          child: Text(
            '3',
            style: TextStyle(fontSize: 12, color: Colors.white),
          ),
        ),
      ),
    );
  }

  Widget _buildNotificationsIcon() {
    return Stack(
      children: <Widget>[
        IconButton(
          icon: Icon(
            Icons.notifications,
            color: Colors.white,
          ),
        ),
        _buildNotificationsBadge()
      ],
    );
  }

  Widget _buildSettingsIcon() {
    return IconButton(
      icon: Icon(
        Icons.settings,
        color: Colors.white,
      ),
    );
  }

  List<Widget> _buildAppBarActions() {
    return [_buildNotificationsIcon(), _buildSettingsIcon()];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ALCANCIA'),
        actions: _buildAppBarActions(),
      ),
      body: Column(
        children: <Widget>[
          Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                leading: CircleAvatar(
                  child: Placeholder(),
                ),
                title: Text('Andres Torres'),
                subtitle: Text('andrestorres123'),
                trailing: CircleAvatar(
                  child: Placeholder(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

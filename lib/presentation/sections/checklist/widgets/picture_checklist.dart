import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PictureChecklist extends StatefulWidget {
  @override
  _PictureChecklistState createState() => _PictureChecklistState();
}

class _PictureChecklistState extends State<PictureChecklist> {
  File _image;

  Future getImage({ImageSource source = ImageSource.gallery}) async {
    var image = await ImagePicker.pickImage(source: source);

    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey,
      height: MediaQuery.of(context).size.height * 0.2,
      child: _image != null
          ? Image.file(
              _image,
              fit: BoxFit.cover,
            )
          : _noPictureContainer(),
    );
  }

  Widget _buildFab() {
    return FloatingActionButton(
      mini: true,
      child: Icon(
        Icons.camera_alt,
        color: Colors.white,
        size: 20,
      ),
      onPressed: () {
        showModalBottomSheet(
            context: context,
            builder: (context) {
              return Container(
                height: MediaQuery.of(context).size.height * 0.2,
                child: Scaffold(
                  body: Column(
                    children: <Widget>[
                      ListTile(
                        leading: Icon(Icons.camera_alt),
                        title: Text('Camera'),
                        onTap: () {
                          getImage(source: ImageSource.camera);
                          Navigator.pop(context);
                        },
                      ),
                      ListTile(
                        leading: Icon(Icons.picture_as_pdf),
                        title: Text('Gallery'),
                        onTap: () {
                          getImage(source: ImageSource.gallery);
                          Navigator.pop(context);
                        },
                      )
                    ],
                  ),
                ),
              );
            }).then((value) {});
      },
    );
  }

  Widget _noPictureContainer() {
    return Stack(
      children: <Widget>[
        Align(
          alignment: FractionalOffset.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(
                Icons.camera,
                color: Colors.white,
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                'Add a picture to make your\nchecklist more colorful',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 12),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Align(
              alignment: FractionalOffset.bottomRight, child: _buildFab()),
        )
      ],
    );
  }
}

// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class PopUp {
  Future<bool> greenAlertDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Done'),
            content: const Text(
              '✓ Added Successfully',
              style: TextStyle(
                color: Colors.green,
              ),
            ),
            actions: <Widget>[
              FlatButton(
                child: const Text('Ok'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }

  Future<bool> redAlertDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Faild'),
            content: const Text(
              '⤫ Invalid',
              style: TextStyle(
                color: Colors.red,
              ),
            ),
            actions: <Widget>[
              FlatButton(
                child: const Text('Ok'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }
}

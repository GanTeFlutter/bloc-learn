import 'package:flutter/material.dart';

class CustomShowDialog extends StatelessWidget {
  final String title;
  final String aciklama;
  final String disableText;
  final String enableText;

  const CustomShowDialog(
      {super.key,
      required this.title,
      required this.aciklama,
      required this.disableText,
      required this.enableText});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(aciklama),
      actions: <Widget>[
        TextButton(
          style: TextButton.styleFrom(
            textStyle: Theme.of(context).textTheme.labelLarge,
          ),
          child: Text(disableText),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          style: TextButton.styleFrom(
            textStyle: Theme.of(context).textTheme.labelLarge,
          ),
          child: Text(enableText),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}

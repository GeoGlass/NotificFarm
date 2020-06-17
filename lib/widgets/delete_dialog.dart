import 'package:flutter/material.dart';
import 'package:form_sus/theme/colors.dart';

class DeleteDialog extends StatelessWidget {
  final String title;
  final String content;
  final String confirmText;
  final String cancelText;
  final Function confirmFunc;
  final Function cancelFunc;
  const DeleteDialog(
      {Key key,
      this.title,
      this.content,
      this.confirmText,
      this.cancelText,
      this.confirmFunc,
      this.cancelFunc})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color _scaffColor = Theme.of(context).scaffoldBackgroundColor;

    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(6.0)),
      ),
      
      title: Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Icon(Icons.warning, color: kPrimary1,),
          Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: Text(title, textAlign: TextAlign.center,),
          )
        ],
      ),
      content: Text(content),
      actions: <Widget>[
        RaisedButton(
          color: kPrimary1,
          child: Text(
            cancelText,
            style: TextStyle(color: _scaffColor),
          ),
          onPressed: cancelFunc ?? null,
        ),
        RaisedButton(
          color: kPrimary1,
          child: Text(
            confirmText,
            style: TextStyle(color: _scaffColor),
          ),
          onPressed: confirmFunc ?? null,
        ),
      ],
    );
  }
}

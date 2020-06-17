import 'package:flutter/material.dart';
import 'package:form_sus/theme/colors.dart';

class CustomDropdownButton<T> extends StatefulWidget {
  final String hintText;
  final String value;
  final Function onChange;
  final List<String> list;
  CustomDropdownButton({
    Key key,
    this.hintText,
    this.value,
    this.onChange,
    this.list,
  }) : super(key: key);

  @override
  _CustomDropdownButtonState<T> createState() =>
      _CustomDropdownButtonState<T>();
}

class _CustomDropdownButtonState<T> extends State<CustomDropdownButton<T>> {
  @override
  Widget build(BuildContext context) {
    Color _textColor = Theme.of(context).scaffoldBackgroundColor;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 0, horizontal: 12),
      //alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
          color: kPrimary1,
          borderRadius: BorderRadius.zero,
          ),
      child: Theme(
        data: ThemeData(
          canvasColor: kPrimary1,
        ),
        child: DropdownButton<String>(
          value: widget.value,
          hint: Text(
            widget.hintText,
            style: TextStyle(color: _textColor),
          ),
          /* underline: Container(
            height: 0,
          ), */
          icon: Icon(
            Icons.keyboard_arrow_down,
            color: Colors.white,
          ),
          iconSize: 24,
          elevation: 16,
          onChanged: widget.onChange,
          items: widget.list
              .map<DropdownMenuItem<String>>(
                (e) => DropdownMenuItem<String>(
                  value: e,
                  child: Text(
                    e,
                    style: TextStyle(color: _textColor),
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}

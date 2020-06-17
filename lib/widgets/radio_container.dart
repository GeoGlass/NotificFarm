import 'package:flutter/material.dart';
import 'package:form_sus/theme/colors.dart';

class RadioContainer extends StatelessWidget {
  final String title;
  final String groupValue;
  final List<String> radiosList;
  final Function onChangedRadio;
  const RadioContainer(
      {Key key,
      this.title,
      this.radiosList,
      this.groupValue,
      this.onChangedRadio})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6.0),
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: kInputFillColor,
        border: Border.all(color: kPrimary2, width: 1.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(color: kPrimary1),
          ),
          LayoutBuilder(
            builder: (context, constraints) => Wrap(
              direction: Axis.horizontal,
              alignment: WrapAlignment.start,
              runAlignment: WrapAlignment.spaceBetween,
              runSpacing: constraints.minWidth,
              spacing: constraints.minWidth,
              children: <Widget>[
                ...radiosList.map(
                  (String radio) => Container(
                    width: constraints.maxWidth / 2,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Radio(
                          value: radio,
                          groupValue: groupValue,
                          onChanged: onChangedRadio,
                          activeColor: kPrimary1,
                        ),
                        Flexible(child: Text(radio))
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

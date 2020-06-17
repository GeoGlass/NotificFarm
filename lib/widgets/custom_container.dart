import 'package:flutter/material.dart';
import 'package:form_sus/theme/colors.dart';

class CustomContainer extends StatelessWidget {
  final String title;
  final String subtitle;
  final Widget child;
  final Color color;
  const CustomContainer({
    Key key,
    this.title = 'Title',
    this.subtitle = 'Subtitle',
    this.child,
    this.color = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {      

    return Container(
      margin: EdgeInsets.all(8.0),
      child: LayoutBuilder(builder: (context, constraints) {
        return Stack(
          overflow: Overflow.visible,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: color,
                border: Border.all(color: kPrimary2, width: 1.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    //color: Colors.red[100],
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(subtitle),
                        Divider(
                          color: kPrimary2,
                          thickness: 2,
                          height: 6,
                        ),
                      ],
                    ),
                  ),
                  child,
                ],
              ),
            ),
            Positioned(
              left: 10,
              top: -8,
              child: Container(
                color: color,
                padding: const EdgeInsets.symmetric(horizontal: 6.0),
                child: Text(
                  title,
                  style:
                      TextStyle(color: kPrimary1, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}

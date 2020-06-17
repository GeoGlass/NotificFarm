import 'package:flutter/material.dart';
import 'package:form_sus/services/data_manager_provider.dart';
import 'package:form_sus/theme/colors.dart';
import 'package:provider/provider.dart';

class CheckboxContainer extends StatelessWidget {
  const CheckboxContainer({Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<DataProvider>(
      builder: (context, dataProv, child) => Container(
        margin: const EdgeInsets.symmetric(vertical: 6.0),
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: kInputFillColor,
          border: Border.all(color: kPrimary2, width: 1.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Manifestações Clínicas associadas ao evento adverso. *',
              style: TextStyle(color: kPrimary1),
            ),
            LayoutBuilder(
              builder: (context, constraints) => Wrap(
                direction: Axis.horizontal,
                alignment: WrapAlignment.start,
                runAlignment: WrapAlignment.spaceBetween,
                runSpacing: constraints.minWidth,
                children: <Widget>[
                  ...dataProv.getMandifests.keys.map((String key) => Container(
                        width: constraints.maxWidth / 2,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Checkbox(
                              activeColor: kPrimary1,
                              checkColor: Colors.white,
                              value: dataProv.getMandifests[key],
                              onChanged: (val) {
                                print("Val: $val");
                                dataProv.updateManifestCkeckbox = key;                                
                              },
                            ),
                            Flexible(child: Text(key))
                          ],
                        ),
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

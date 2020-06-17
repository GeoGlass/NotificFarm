import 'package:flutter/material.dart';
import 'package:form_sus/services/page_manager_provider.dart';
import 'package:form_sus/services/data_manager_provider.dart';
import 'package:form_sus/theme/colors.dart';
import 'package:form_sus/widgets/custom_container.dart';
import 'package:form_sus/widgets/custom_textformfield.dart';
import 'package:form_sus/widgets/radio_container.dart';
import 'package:provider/provider.dart';

class NotificacaoScreen extends StatefulWidget {
  const NotificacaoScreen({Key key}) : super(key: key);

  @override
  _NotificacaoScreenState createState() => _NotificacaoScreenState();
}

class _NotificacaoScreenState extends State<NotificacaoScreen> {

  @override
  Widget build(BuildContext context) {
    print("NotificacaoPage render");
    Color _scaffColor = Theme.of(context).scaffoldBackgroundColor;

    return Column(
      children: <Widget>[
        CustomContainer(
          title: "Identificação da Notificação",
          subtitle: "Dados do Notificação",
          color: _scaffColor,
          child: Consumer<DataProvider>(
                builder: (context, dataProv, child) => ListView(
              shrinkWrap: true,
              primary: false,
              children: <Widget>[
                CustomTextFormField(
                  controller: dataProv.motivoCtrl,
                  labelText: " Produto Motivo da Notificação: ",
                  textInputType: TextInputType.text,
                  validator: (value) => null,
                ),
                 RadioContainer(
                    title:
                        'O que será Notificado Queixa Técnica(QT) ou Evento Adverso(EA):',
                    radiosList: [
                      'Queixa Técnica',
                      'Evento Adverso',
                    ],
                    groupValue: dataProv.getQTOrEAGroup,
                    onChangedRadio: (val) {
                      dataProv.setQtOrEaValue = val;
                    },
                  ),
              ],
            ),
          ),
        ),
        Consumer2<PageProvider, DataProvider>(
          builder: (context, pageProv, dataProv, child) => RaisedButton(
            color: kPrimary1,
            child: Text(
              "Próximo",
              style: TextStyle(color: _scaffColor),
            ),
            onPressed: () {
              pageProv.saveData({
                'motivo': dataProv.motivoCtrl.text,
                'qeOUea': dataProv.getQTOrEAGroup ?? ''
              });
              pageProv.nextPage();
            },
          ),
        ),
      ],
    );
  }
}



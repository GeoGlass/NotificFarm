import 'package:flutter/material.dart';
import 'package:form_sus/services/page_manager_provider.dart';
import 'package:form_sus/services/data_manager_provider.dart';
import 'package:form_sus/theme/colors.dart';
import 'package:form_sus/util/uf_list.dart';
import 'package:form_sus/widgets/custom_container.dart';
import 'package:form_sus/widgets/custom_dropdown.dart';
import 'package:form_sus/widgets/custom_textformfield.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:form_sus/widgets/radio_container.dart';
import 'package:provider/provider.dart';

class NotificadorScreen extends StatefulWidget {
  const NotificadorScreen({Key key}) : super(key: key);

  @override
  _NotificadorScreenState createState() => _NotificadorScreenState();
}

class _NotificadorScreenState extends State<NotificadorScreen> {
  final GlobalKey<FormState> _notcdorFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    print("NotificadorScreen render");

    Color _whiteColor = Theme.of(context).scaffoldBackgroundColor;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          CustomContainer(
            title: "Identificação do Notificador",
            subtitle: "Dados do Notificador",
            color: _whiteColor,
            child: Form(
              key: _notcdorFormKey,
              child: Consumer<DataProvider>(
                builder: (context, dataProv, child) => ListView(
                  shrinkWrap: true,
                  primary: false,
                  children: <Widget>[
                    CustomTextFormField(
                      controller: dataProv.nomeCtrl,
                      labelText: "Nome Completo do Notificador: *",
                      textInputType: TextInputType.text,
                      validator: (value) =>
                          (value.isEmpty) ? "Informe o nome completo" : null,
                    ),
                    CustomTextFormField(
                      controller: dataProv.cityCtrl,
                      labelText: "Cidade: *",
                      textInputType: TextInputType.text,
                      validator: (value) =>
                          (value.isEmpty) ? "Informe a cidade *" : null,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6.0),
                      child: Row(
                        children: <Widget>[
                          CustomDropdownButton(
                            hintText: "Sigla da UF: *",
                            value: dataProv.getUfValue,
                            list: UFLIST,
                            onChange: (String newValue) {
                              print("UF newValue: $newValue");
                              dataProv.setUfValue = newValue;
                              /*  setState(() {
                                  print("UF newValue: $newValue");
                                  _ufValue = newValue;
                                }); */
                            },
                          ),
                        ],
                      ),
                    ),
                    CustomTextFormField(
                      controller: dataProv.telCtrl,
                      labelText: "Telefone: *",
                      textInputType: TextInputType.number,
                      textInputFormatter: [
                        MaskedInputFormater('(00) 00000-0000')
                      ],
                      validator: (value) => (value.isEmpty || value.length < 15)
                          ? "Informe seu telefone"
                          : null,
                    ),
                    CustomTextFormField(
                      controller: dataProv.emailCtrl,
                      labelText: "E-mail: *",
                      textInputType: TextInputType.emailAddress,
                      validator: (value) {
                        bool emailValid = RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(value);
                        if (value.isEmpty) {
                          return 'Informe o E-mail';
                        } else if (!emailValid) return 'E-mail inválido';
                      },
                    ),
                    RadioContainer(
                      title: 'Categoria do Notificador: *',
                      radiosList: [
                        'Médico',
                        'Enfermeiro',
                        'Nutricionista',
                        'Farmacêutico',
                        'Cidadão',
                        'Outro'
                      ],
                      groupValue: dataProv.getCategoriaGroup,
                      onChangedRadio: (val) {
                        dataProv.setCategoriaRadio = val;
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            child: Consumer2<PageProvider, DataProvider>(
              builder: (context, pageProv, dataProv, child) => RaisedButton(
                color: kPrimary1,
                child: Text(
                  "Próximo",
                  style: TextStyle(color: _whiteColor),
                ),
                onPressed: () {
                  _validate(pageProv: pageProv, dataProv: dataProv);
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  void _validate({PageProvider pageProv, DataProvider dataProv}) {
    if (_notcdorFormKey.currentState.validate()) {
      if (dataProv.getUfValue == null) {
        Scaffold.of(context)
            .showSnackBar(pageProv.pageSnackbar('Informe a UF'));
      } else if (dataProv.getCategoriaGroup == null) {
        Scaffold.of(context).showSnackBar(
            pageProv.pageSnackbar('Informe a categoria do notificador'));
      } else {
        pageProv.saveData({
          'nome': dataProv.nomeCtrl.text,
          'cidade': dataProv.cityCtrl.text,
          'uf': dataProv.getUfValue,
          'tel': dataProv.telCtrl.text,
          'email': dataProv.emailCtrl.text.toLowerCase().trim(),
          'categoria': dataProv.getCategoriaGroup
        });
        pageProv.nextPage();
      }
    }
  }
}

import 'package:flutter/material.dart';
import 'package:form_sus/services/data_manager_provider.dart';
import 'package:form_sus/services/page_manager_provider.dart';
import 'package:form_sus/theme/colors.dart';
import 'package:form_sus/widgets/custom_container.dart';
import 'package:form_sus/widgets/custom_textformfield.dart';
import 'package:form_sus/widgets/radio_container.dart';
import 'package:provider/provider.dart';

class InfoAdicionalScreen extends StatefulWidget {
  const InfoAdicionalScreen({Key key}) : super(key: key);

  @override
  _InfoAdicionalScreenState createState() => _InfoAdicionalScreenState();
}

class _InfoAdicionalScreenState extends State<InfoAdicionalScreen> {
  @override
  Widget build(BuildContext context) {
    print("InfoAdicionalScreen render");
    Color _whiteColor = Theme.of(context).scaffoldBackgroundColor;

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          CustomContainer(
            title: 'Informações Adicionais',
            subtitle: 'Dados do evento adverso',
            color: _whiteColor,
            child: Consumer<DataProvider>(
              builder: (context, dataProv, child) => ListView(
                shrinkWrap: true,
                primary: false,
                children: <Widget>[
                  CustomTextFormField(
                    controller: dataProv.iaLocalAquisProdCtrl,
                    labelText:
                        "Local de Aquisição do Produto (nome e endereço): ",
                    textInputType: TextInputType.text,
                    validator: (value) => null,
                  ),
                  RadioContainer(
                    title: 'O produto apresentou alteração?',
                    radiosList: [
                      'SIM',
                      'NÃO',
                    ],
                    groupValue: dataProv.getIAProdApresAlteracaoGroup,
                    onChangedRadio: (val) {
                      dataProv.setIAProdApresAlteracaoValue = val;
                    },
                  ),
                  RadioContainer(
                    title:
                        'Houve comunicação à empresa fabricante ou importadora:',
                    radiosList: [
                      'SIM',
                      'NÃO',
                    ],
                    groupValue: dataProv.getIAHouveComunicEmpGroup,
                    onChangedRadio: (val) {
                      dataProv.setIAHouveComunicEmpValue = val;
                    },
                  ),
                  RadioContainer(
                    title:
                        'O evento adverso foi comunicado ao órgão de Vigilância Sanitária ou Vigilância Epidemiológica local?',
                    radiosList: [
                      'SIM',
                      'NÃO',
                    ],
                    groupValue: dataProv.getIAEventAdvComunicVigilGroup,
                    onChangedRadio: (val) {
                      dataProv.setIAEventAdvComunicVigilValue = val;
                    },
                  ),
                  RadioContainer(
                    title:
                        'Existem amostras íntegras para a coleta e que podem ser entregues à Vigilância Sanitária?',
                    radiosList: [
                      'SIM',
                      'NÃO',
                    ],
                    groupValue: dataProv.getIAExistAmostrasIntegGroup,
                    onChangedRadio: (val) {
                      dataProv.setIAExistAmostrasIntegValue = val;
                    },
                  ),
                  RadioContainer(
                    title:
                        'O paciente/usuário recebeu atendimento em serviço de saúde.',
                    radiosList: [
                      'SIM',
                      'NÃO',
                    ],
                    groupValue: dataProv.getIAPcteRecebAtendGroup,
                    onChangedRadio: (val) {
                      dataProv.setIAPcteRecebAtendValue = val;
                    },
                  ),
                ],
              ),
            ),
          ),
          Container(
            child: Consumer2<PageProvider, DataProvider>(
              builder: (context, pageProv, dataProv, child) =>
                  !pageProv.isSaving
                      ? RaisedButton(
                          color: kPrimary1,
                          child: Text(
                            "Registrar",
                            style: TextStyle(color: _whiteColor),
                          ),
                          onPressed: () {
                            _validate(pageProv: pageProv, dataProv: dataProv);
                            //pageProv.nextPage();
                          })
                      : CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(kPrimary1),
                        ),
            ),
          )
        ],
      ),
    );
  }

  void _validate({PageProvider pageProv, DataProvider dataProv}) {
    pageProv.saveData({
      'iaLocalAquisProd': dataProv.iaLocalAquisProdCtrl.text,
      'iaProdApresAlteracao': dataProv.getIAProdApresAlteracaoGroup ?? '',
      'iaHouveComunicEmp': dataProv.getIAHouveComunicEmpGroup ?? '',
      'iaEventAdvComunicVigil': dataProv.getIAEventAdvComunicVigilGroup ?? '',
      'iaExistAmostrasInteg': dataProv.getIAExistAmostrasIntegGroup ?? '',
      'iaPcteRecebAtend': dataProv.getIAPcteRecebAtendGroup ?? '',
    });
    pageProv.registerNotificacao(onSuccess: () {
      Navigator.pop(context);
    }, onFail: () {
      Scaffold.of(context).showSnackBar(pageProv
          .pageSnackbar('Falha ao registar notificação. Tente novamente.'));
    });
  }
}

import 'package:flutter/material.dart';
import 'package:form_sus/services/page_manager_provider.dart';
import 'package:form_sus/services/data_manager_provider.dart';
import 'package:form_sus/theme/colors.dart';
import 'package:form_sus/widgets/custom_container.dart';
import 'package:form_sus/widgets/custom_textformfield.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:form_sus/widgets/radio_container.dart';
import 'package:provider/provider.dart';

class PacienteScreen extends StatefulWidget {
  const PacienteScreen({Key key}) : super(key: key);

  @override
  _PacienteScreenState createState() => _PacienteScreenState();
}

class _PacienteScreenState extends State<PacienteScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    print("PacienteScreen render");
    Color _whiteColor = Theme.of(context).scaffoldBackgroundColor;

    return SingleChildScrollView(
      child: Column(
        children: [
          CustomContainer(
            title: 'Identificação do Paciente/Usuário',
            subtitle:
                'identificação do paciente/usuário que sofreu o evento adverso',
            color: _whiteColor,
            child: Form(
              key: _formKey,
              child: Consumer<DataProvider>(
                builder: (context, dataProv, child) => ListView(
                  shrinkWrap: true,
                  primary: false,
                  children: [
                    CustomTextFormField(
                      controller: dataProv.paNomeCtrl,
                      labelText: "Nome (ou iniciais do Nome): *",
                      textInputType: TextInputType.text,
                      validator: (value) =>
                          (value.isEmpty) ? "Informe o nome ou iniciais" : null,
                    ),
                    CustomTextFormField(
                      controller: dataProv.paIdadeCtrl,
                      labelText: " Idade do Paciente/Usuário: * ",
                      textInputType: TextInputType.number,
                      maxLength: 2,
                      validator: (value) =>
                          (value.isEmpty) ? "Informe a idade" : null,
                    ),
                    RadioContainer(
                      title: 'Sexo: *',
                      radiosList: [
                        'Feminino',
                        'Masculino',
                      ],
                      groupValue: dataProv.getSexoGroup,
                      onChangedRadio: (val) {
                        dataProv.setSexoValue = val;
                      },
                    ),
                    CustomTextFormField(
                      controller: dataProv.paProfissaoCtrl,
                      labelText: "Profissão",
                      textInputType: TextInputType.text,
                      validator: (value) => null,
                    ),
                    CustomTextFormField(
                      controller: dataProv.paMunicipioCtrl,
                      labelText: "Município de Residência: *",
                      textInputType: TextInputType.text,
                      validator: (value) =>
                          (value.isEmpty) ? "Informe o Município" : null,
                    ),
                    CustomTextFormField(
                      controller: dataProv.paTelCtrl,
                      labelText: " Telefone : *",
                      textInputType: TextInputType.number,
                      textInputFormatter: [
                        MaskedInputFormater('(00) 00000-0000')
                      ],
                      validator: (value) => (value.isEmpty || value.length < 15)
                          ? "Informe o telefone do paciente/usuário"
                          : null,
                    ),
                    CustomTextFormField(
                      controller: dataProv.paEmailCtrl,
                      labelText: "E-mail: *",
                      textInputType: TextInputType.emailAddress,
                      validator: (value) =>
                          (value.isEmpty) ? "Informe o um E-mail" : null,
                    ),
                    RadioContainer(
                      title:
                          'Existência de doenças concomitantes ao evento adverso: *',
                      radiosList: [
                        'SIM',
                        'NÃO',
                      ],
                      groupValue: dataProv.getDoencaGroup,
                      onChangedRadio: (val) {
                        dataProv.setDoencaValue = val;
                      },
                    ),
                    RadioContainer(
                      title:
                          'Selecione um desfecho para o Evento Adverso relatado (só pode selecionar um): *',
                      radiosList: [
                        'Recuperado',
                        'Em recuperação',
                        'Desconhecido',
                        'Recuperado com sequelas',
                        'Óbito',
                        'Outros'
                      ],
                      groupValue: dataProv.getDesfechoGroup,
                      onChangedRadio: (val) {
                        dataProv.setDesfechoValue = val;
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
                    //pageProv.nextPage();
                  }),
            ),
          )
        ],
      ),
    );
  }

  void _validate({PageProvider pageProv, DataProvider dataProv}) {
    if (_formKey.currentState.validate()) {
      if (dataProv.getSexoGroup == null) {
        Scaffold.of(context).showSnackBar(SnackBar(
            duration: Duration(milliseconds: 2000),
            content: Text(
              "Informe o campo Sexo",
              textAlign: TextAlign.center,
            )));
      } else if (dataProv.getDoencaGroup == null) {
        Scaffold.of(context).showSnackBar(SnackBar(
            duration: Duration(milliseconds: 2000),
            content: Text(
              "Informe se existe doenças concomitantes",
              textAlign: TextAlign.center,
            )));
      } else if (dataProv.getDesfechoGroup == null) {
        Scaffold.of(context).showSnackBar(SnackBar(
            duration: Duration(milliseconds: 2000),
            content: Text(
              "Informe um desfecho",
              textAlign: TextAlign.center,
            )));
      } else {
        pageProv.saveData({
          'paNome': dataProv.paNomeCtrl.text,
          'paIdade': int.parse(dataProv.paIdadeCtrl.text),
          'paSexo': dataProv.getSexoGroup,
          'paProfissao': dataProv.paProfissaoCtrl.text ??= null,
          'paMunicipio': dataProv.paMunicipioCtrl.text,
          'paTel': dataProv.paTelCtrl.text,
          'paEmail': dataProv.paEmailCtrl.text.toLowerCase().trim(),
          'paDoencas': dataProv.getDoencaGroup,
          'paDesfecho': dataProv.getDesfechoGroup,
        });
        pageProv.nextPage();
      }
    }
  }
}

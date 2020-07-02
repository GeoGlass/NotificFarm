import 'package:flutter/material.dart';
import 'package:form_sus/services/data_manager_provider.dart';
import 'package:form_sus/services/page_manager_provider.dart';
import 'package:form_sus/theme/colors.dart';
import 'package:form_sus/widgets/checkbox_container.dart';
import 'package:form_sus/widgets/custom_container.dart';
import 'package:form_sus/widgets/custom_textformfield.dart';
import 'package:form_sus/widgets/radio_container.dart';
import 'package:provider/provider.dart';

class EventoAdversoScreen extends StatefulWidget {
  const EventoAdversoScreen({Key key}) : super(key: key);

  @override
  _EventoAdversoScreenState createState() => _EventoAdversoScreenState();
}

class _EventoAdversoScreenState extends State<EventoAdversoScreen> {
  final GlobalKey<FormState> _eaFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    print("EventoAdversoScreen render");
    Color _whiteColor = Theme.of(context).scaffoldBackgroundColor;

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          CustomContainer(
            title: 'Evento Adverso',
            subtitle: 'Especificações do Evento Adverso',
            color: _whiteColor,
            child: Form(
              key: _eaFormKey,
              child: Consumer<DataProvider>(
                builder: (context, dataProv, child) => ListView(
                  shrinkWrap: true,
                  primary: false,
                  children: <Widget>[
                    CustomTextFormField(
                      controller: dataProv.eaDescCtrl,
                      labelText:
                          "Descrição detalhada do Evento Adverso observado. *",
                      textInputType: TextInputType.text,
                      validator: (value) =>
                          (value.isEmpty) ? "Informe a descrição" : null,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6.0),
                      child: CustomTextFormField(
                        controller: dataProv.eadataInicioCtrl,
                        labelText: 'Data de Inicio dos Sintomas: *',
                        validator: (value) => (value.isEmpty)
                            ? "Informe data de inicio dos sintomas "
                            : null,
                        maxLength: 10,
                        readOnly: true,
                        onTap: () async {
                          final DateTime picked = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2020, 1),
                              lastDate: DateTime(2101));
                          if (picked != null) {
                            dataProv.eadataInicioCtrl.text =
                                "${picked.day.toString().padLeft(2, '0')}/${picked.month.toString().padLeft(2, '0')}/${picked.year}";
                          }
                        },
                      ),
                    ),
                    CheckboxContainer(),
                    RadioContainer(
                      title:
                          'Houve quanto tempo entre o consumo do alimento e o aparecimento do evento adverso? *',
                      radiosList: [
                        'Horas',
                        'Dias',
                        'Meses',
                        'Anos',
                      ],
                      groupValue: dataProv.getTempoConsumoAlimentoGroup,
                      onChangedRadio: (val) {
                        dataProv.setTempoConsumoAlimentoValue = val;
                      },
                    ),
                    CustomTextFormField(
                      controller: dataProv.eaTempoUsoProdutoCtrl,
                      labelText:
                          "Há quanto tempo faz uso do produto(alimento)? *",
                      textInputType: TextInputType.text,
                      validator: (value) => (value.isEmpty)
                          ? "Informe o tempo de uso do produto/alimento"
                          : null,
                    ),
                    RadioContainer(
                      title: 'Houve suspensão do consumo do produto? *',
                      radiosList: [
                        'SIM',
                        'NÃO',
                      ],
                      groupValue: dataProv.getSuspensaoConsumoProdutoGroup,
                      onChangedRadio: (val) {
                        dataProv.setSuspensaoConsumoProdutoValue = val;
                      },
                    ),
                    RadioContainer(
                      title:
                          'Consumiu o alimento concomitante com algum medicamento?',
                      radiosList: [
                        'SIM',
                        'NÃO',
                      ],
                      groupValue:
                          dataProv.getConsumiuAlimentoComMedicamentoGroup,
                      onChangedRadio: (val) {
                        dataProv.setConsumiuAlimentoComMedicamentoValue = val;
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
                    })),
          )
        ],
      ),
    );
  }

  void _validate({PageProvider pageProv, DataProvider dataProv}) {
    if (_eaFormKey.currentState.validate()) {
      if (dataProv.getCheckedManifest.isEmpty) {
        Scaffold.of(context).showSnackBar(pageProv
            .pageSnackbar('Selecione ao menos uma Manifestação Clínica'));
      } else if (dataProv.getTempoConsumoAlimentoGroup == null) {
        Scaffold.of(context).showSnackBar(pageProv.pageSnackbar(
            'Informe o tempo entre o consumo do alimento e o aparecimento do evento adverso'));
      } else if (dataProv.getSuspensaoConsumoProdutoGroup == null) {
        Scaffold.of(context).showSnackBar(pageProv
            .pageSnackbar('Informe se houve suspensão do consumo do produto'));
      } else {
        pageProv.saveData({
          'eaDescDetalhada': dataProv.eaDescCtrl.text,
          'eaDataInicioSintomas': dataProv.eadataInicioCtrl.text,
          'eaCheckedManifests': dataProv.getCheckedManifest,
          'eaTempoConsumoAlimento': dataProv.getTempoConsumoAlimentoGroup,
          'eaTempoUsoProduto': dataProv.eaTempoUsoProdutoCtrl.text,
          'eaSuspensaoConsumoProduto': dataProv.getSuspensaoConsumoProdutoGroup,
          'eaConsumiuAlimentoComMedicamento':
              dataProv.getConsumiuAlimentoComMedicamentoGroup ?? '',
        });
        pageProv.nextPage();
      }
    }
  }
}

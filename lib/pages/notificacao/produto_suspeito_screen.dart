import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/formatters/masked_input_formatter.dart';
import 'package:form_sus/services/data_manager_provider.dart';
import 'package:form_sus/services/page_manager_provider.dart';
import 'package:form_sus/theme/colors.dart';
import 'package:form_sus/widgets/custom_container.dart';
import 'package:form_sus/widgets/custom_textformfield.dart';
import 'package:form_sus/widgets/radio_container.dart';
import 'package:provider/provider.dart';

class ProdutoSuspeitoScreen extends StatefulWidget {
  const ProdutoSuspeitoScreen({Key key}) : super(key: key);

  @override
  _ProdutoSuspeitoScreenState createState() => _ProdutoSuspeitoScreenState();
}

class _ProdutoSuspeitoScreenState extends State<ProdutoSuspeitoScreen> {
  final GlobalKey<FormState> _psFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    print("ProdutoSuspeitoScreen render");
    Color _whiteColor = Theme.of(context).scaffoldBackgroundColor;

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          CustomContainer(
            title: 'Produto/Alimento suspeito',
            subtitle: 'Especificações do alimento/produto que causou EA',
            color: _whiteColor,
            child: Form(
              key: _psFormKey,
              child: Consumer<DataProvider>(
                builder: (context, dataProv, child) => ListView(
                  shrinkWrap: true,
                  primary: false,
                  children: <Widget>[
                    CustomTextFormField(
                      controller: dataProv.psNomeComercialCtrl,
                      labelText: "Nome comercial do Produto: *",
                      textInputType: TextInputType.text,
                      validator: (value) => (value.isEmpty)
                          ? "Informe o nome comercial do produto"
                          : null,
                    ),
                    CustomTextFormField(
                      controller: dataProv.psMarcaCtrl,
                      labelText: "Marca do Produto: *",
                      textInputType: TextInputType.text,
                      validator: (value) =>
                          (value.isEmpty) ? "Informe a marca do produto" : null,
                    ),
                    RadioContainer(
                      title: 'Forma de apresentação do produto na embalagem?',
                      radiosList: [
                        'Pó',
                        'Líquido',
                        'Cápsula',
                        'Sachê',
                        'Outro',
                      ],
                      groupValue: dataProv.getPSFormaApresProdEmbGroup,
                      onChangedRadio: (val) {
                        dataProv.setPSFormaApresProdEmbValue = val;
                      },
                    ),
                    CustomTextFormField(
                        controller: dataProv.psNomeEmpresaCtrl,
                        labelText: "Nome da Empresa Fabricante:",
                        textInputType: TextInputType.text,
                        validator: (value) => null),
                    RadioContainer(
                      title: 'Origem do Produto:',
                      radiosList: [
                        'Nacional',
                        'Importado',
                      ],
                      groupValue: dataProv.getPSOrigemProdGroup,
                      onChangedRadio: (val) {
                        dataProv.setPSOrigemProdValue = val;
                      },
                    ),
                    CustomTextFormField(
                        controller: dataProv.psCnpjCtrl,
                        labelText: "Número do CNPJ da empresa fabricante:",
                        textInputType: TextInputType.number,
                        textInputFormatter: [
                          MaskedInputFormater('00.000.000/0000-00')
                        ],
                        validator: (value) => null),
                    RadioContainer(
                      title: 'Consta o número do Registro/MS no rótulo?',
                      radiosList: [
                        'SIM',
                        'NÃO',
                      ],
                      groupValue: dataProv.getPSNumRegRotuloGroup,
                      onChangedRadio: (val) {
                        dataProv.setPSNumRegRotuloValue = val;
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6.0),
                      child: CustomTextFormField(
                        controller: dataProv.psDataFabCtrl,
                        labelText: 'Data de Fabricação:',
                        maxLength: 10,
                        readOnly: true,
                        onTap: () async {
                          final DateTime picked = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2020, 1),
                              lastDate: DateTime(2101));
                          if (picked != null) {
                            dataProv.psDataFabCtrl.text =
                                "${picked.day.toString().padLeft(2, '0')}/${picked.month.toString().padLeft(2, '0')}/${picked.year}";
                          }
                        },
                      ),
                    ),
                    CustomTextFormField(
                      controller: dataProv.psNumLoteCtrl,
                      labelText: "Número do Lote: *",
                      textInputType: TextInputType.number,
                      validator: (value) =>
                          (value.isEmpty) ? "Informe o número do lote" : null,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6.0),
                      child: CustomTextFormField(
                        controller: dataProv.psDataValidadeCtrl,
                        labelText: 'Data da Validade: *',
                        maxLength: 10,
                        readOnly: true,
                        validator: (value) =>
                            (value.isEmpty) ? "Informe data de validade" : null,
                        onTap: () async {
                          final DateTime picked = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2020, 1),
                              lastDate: DateTime(2101));
                          if (picked != null) {
                            dataProv.psDataValidadeCtrl.text =
                                "${picked.day.toString().padLeft(2, '0')}/${picked.month.toString().padLeft(2, '0')}/${picked.year}";
                          }
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6.0),
                      child: CustomTextFormField(
                        controller: dataProv.psDataCompraProdCtrl,
                        labelText: 'Data da Compra do Produto: ',
                        maxLength: 10,
                        readOnly: true,
                        onTap: () async {
                          final DateTime picked = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2020, 1),
                              lastDate: DateTime(2101));
                          if (picked != null) {
                            dataProv.psDataCompraProdCtrl.text =
                                "${picked.day.toString().padLeft(2, '0')}/${picked.month.toString().padLeft(2, '0')}/${picked.year}";
                          }
                        },
                      ),
                    ),
                  ],
                ),
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
                            "Próximo",
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
    if (_psFormKey.currentState.validate()) {
      pageProv.saveData({
        'psNomeComercialProd': dataProv.psNomeComercialCtrl.text,
        'psMarcaProd': dataProv.psMarcaCtrl.text,
        'psFormaApresProdEmb': dataProv.getPSFormaApresProdEmbGroup ?? '',
        'psNomeEmpresaFab': dataProv.psNomeEmpresaCtrl.text,
        'psOrigemProd': dataProv.getPSOrigemProdGroup ?? '',
        'psCNPJempresaFab': dataProv.psCnpjCtrl.text,
        'psNumRegRotulo': dataProv.getPSNumRegRotuloGroup ?? '',
        'psDataFab': dataProv.psDataFabCtrl.text,
        'psNumLote': int.parse(dataProv.psNumLoteCtrl.text),
        'psDataValidade': dataProv.psDataValidadeCtrl.text,
        'psDataCompraProd': dataProv.psDataCompraProdCtrl.text,
      });
      pageProv.nextPage();
    }
  }
}

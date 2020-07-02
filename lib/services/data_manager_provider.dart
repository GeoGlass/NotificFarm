import 'package:flutter/material.dart';

class DataProvider with ChangeNotifier {
//*************************************** NotificadorScreen ***************************************//

  final TextEditingController _nomeCtrl = TextEditingController();
  final TextEditingController _cityCtrl = TextEditingController();
  final TextEditingController _emailCtrl = TextEditingController();
  final TextEditingController _telCtrl = TextEditingController();

  String _ufValue;
  String _categoriaRadioGroupValue;

  TextEditingController get nomeCtrl => _nomeCtrl;
  TextEditingController get cityCtrl => _cityCtrl;
  TextEditingController get emailCtrl => _emailCtrl;
  TextEditingController get telCtrl => _telCtrl;
  String get getUfValue => _ufValue;
  String get getCategoriaGroup => _categoriaRadioGroupValue;

  set setUfValue(String val) {
    _ufValue = val;
    notifyListeners();
  }

  set setCategoriaRadio(String val) {
    _categoriaRadioGroupValue = val;
    notifyListeners();
  }

//*************************************** NotificacaoScreen ***************************************//
  final TextEditingController _motivoCtrl = TextEditingController();
  String _qTOrEARadioGroupValue;

  TextEditingController get motivoCtrl => _motivoCtrl;
  String get getQTOrEAGroup => _qTOrEARadioGroupValue;

  set setQtOrEaValue(String val) {
    _qTOrEARadioGroupValue = val;
    notifyListeners();
  }

//*************************************** PacienteScreen ***************************************//
  final TextEditingController _paNomeCtrl = TextEditingController();
  final TextEditingController _paIdadeCtrl = TextEditingController();
  final TextEditingController _paProfissaoCtrl = TextEditingController();
  final TextEditingController _paMunicipioCtrl = TextEditingController();
  final TextEditingController _paTelCtrl = TextEditingController();
  final TextEditingController _paEmailCtrl = TextEditingController();
  String _sexoRadioGroupValue;
  String _doencaRadioGroupValue;
  String _desfechoRadioGroupValue;

  TextEditingController get paNomeCtrl => _paNomeCtrl;
  TextEditingController get paIdadeCtrl => _paIdadeCtrl;
  TextEditingController get paProfissaoCtrl => _paProfissaoCtrl;
  TextEditingController get paMunicipioCtrl => _paMunicipioCtrl;
  TextEditingController get paTelCtrl => _paTelCtrl;
  TextEditingController get paEmailCtrl => _paEmailCtrl;
  String get getSexoGroup => _sexoRadioGroupValue;
  String get getDoencaGroup => _doencaRadioGroupValue;
  String get getDesfechoGroup => _desfechoRadioGroupValue;

  set setSexoValue(String val) {
    _sexoRadioGroupValue = val;
    notifyListeners();
  }

  set setDoencaValue(String val) {
    _doencaRadioGroupValue = val;
    notifyListeners();
  }

  set setDesfechoValue(String val) {
    _desfechoRadioGroupValue = val;
    notifyListeners();
  }

//*************************************** EventoAdversoScreen ***************************************//
  final TextEditingController _eaDescCtrl = TextEditingController();
  final TextEditingController _eaDataInicioCtrl = TextEditingController();
  final TextEditingController _eaTempoUsoProdutoCtrl = TextEditingController();

  Map<String, bool> _manifest = {
    'Vômito': false,
    'Febre': false,
    'Náuseas': false,
    'Diarreia': false,
    'Reação Alérgica': false,
    'Cefaleia': false,
    'Insônia': false,
    'Convulsão': false,
    'Outras': false,
  };

  String _tempoConsumoAlimentoRadioGroupValue;
  String _suspensaoConsumoProdutoRadioGroupValue;
  String _consumiuAlimentoComMedicamentoRadioGroupValue;

  TextEditingController get eaDescCtrl => _eaDescCtrl;
  TextEditingController get eadataInicioCtrl => _eaDataInicioCtrl;
  TextEditingController get eaTempoUsoProdutoCtrl => _eaTempoUsoProdutoCtrl;

  Map<String, bool> get getMandifests => _manifest;
  String get getTempoConsumoAlimentoGroup =>
      _tempoConsumoAlimentoRadioGroupValue;
  String get getSuspensaoConsumoProdutoGroup =>
      _suspensaoConsumoProdutoRadioGroupValue;
  String get getConsumiuAlimentoComMedicamentoGroup =>
      _consumiuAlimentoComMedicamentoRadioGroupValue;

  List<String> get getCheckedManifest {
    List<String> temp = [];

    _manifest.forEach((key, value) {
      if (value == true) temp.add(key);
    });

    return temp;
  }

  set updateManifestCkeckbox(String key) {
    _manifest.update(key, (value) => !value);
    print(_manifest);
    notifyListeners();
  }

  set setTempoConsumoAlimentoValue(String val) {
    _tempoConsumoAlimentoRadioGroupValue = val;
    notifyListeners();
  }

  set setSuspensaoConsumoProdutoValue(String val) {
    _suspensaoConsumoProdutoRadioGroupValue = val;
    notifyListeners();
  }

  set setConsumiuAlimentoComMedicamentoValue(String val) {
    _consumiuAlimentoComMedicamentoRadioGroupValue = val;
    notifyListeners();
  }

//*************************************** ProdutoSuspeitoScreen ***************************************//
  final TextEditingController _psNomeComercialCtrl = TextEditingController();
  final TextEditingController _psMarcaCtrl = TextEditingController();
  final TextEditingController _psNomeEmpresaCtrl = TextEditingController();
  final TextEditingController _psCnpjCtrl = TextEditingController();
  final TextEditingController _psDataFabCtrl = TextEditingController();
  final TextEditingController _psNumLoteCtrl = TextEditingController();
  final TextEditingController _psDataValidadeCtrl = TextEditingController();
  final TextEditingController _psDataCompraProdCtrl = TextEditingController();

  String _formaApresProdEmb;
  String _origemProd;
  String _numRegRotulo;

  TextEditingController get psNomeComercialCtrl => _psNomeComercialCtrl;
  TextEditingController get psMarcaCtrl => _psMarcaCtrl;
  TextEditingController get psNomeEmpresaCtrl => _psNomeEmpresaCtrl;
  TextEditingController get psCnpjCtrl => _psCnpjCtrl;
  TextEditingController get psDataFabCtrl => _psDataFabCtrl;
  TextEditingController get psNumLoteCtrl => _psNumLoteCtrl;
  TextEditingController get psDataValidadeCtrl => _psDataValidadeCtrl;
  TextEditingController get psDataCompraProdCtrl => _psDataCompraProdCtrl;

  String get getPSFormaApresProdEmbGroup => _formaApresProdEmb;
  String get getPSOrigemProdGroup => _origemProd;
  String get getPSNumRegRotuloGroup => _numRegRotulo;

  set setPSFormaApresProdEmbValue(String val) {
    _formaApresProdEmb = val;
    notifyListeners();
  }

  set setPSOrigemProdValue(String val) {
    _origemProd = val;
    notifyListeners();
  }

  set setPSNumRegRotuloValue(String val) {
    _numRegRotulo = val;
    notifyListeners();
  }

//*************************************** InfoAdicionalScreen ***************************************//
  final TextEditingController _iaLocalAquisProdCtrl = TextEditingController();

  String _prodApresAlteracao;
  String _houveComunicEmp;
  String _eventAdvComunicVigil;
  String _existAmostrasInteg;
  String _pcteRecebAtend;

  TextEditingController get iaLocalAquisProdCtrl => _iaLocalAquisProdCtrl;

  get getIAProdApresAlteracaoGroup => _prodApresAlteracao;
  get getIAHouveComunicEmpGroup => _houveComunicEmp;
  get getIAEventAdvComunicVigilGroup => _eventAdvComunicVigil;
  get getIAExistAmostrasIntegGroup => _existAmostrasInteg;
  get getIAPcteRecebAtendGroup => _pcteRecebAtend;

  set setIAProdApresAlteracaoValue(String val) {
    _prodApresAlteracao = val;
    notifyListeners();
  }

  set setIAHouveComunicEmpValue(String val) {
    _houveComunicEmp = val;
    notifyListeners();
  }

  set setIAEventAdvComunicVigilValue(String val) {
    _eventAdvComunicVigil = val;
    notifyListeners();
  }

  set setIAExistAmostrasIntegValue(String val) {
    _existAmostrasInteg = val;
    notifyListeners();
  }

  set setIAPcteRecebAtendValue(String val) {
    _pcteRecebAtend = val;
    notifyListeners();
  }
}

import 'package:flutter/material.dart';
import 'package:form_sus/models/notificacao.dart';
import 'package:form_sus/pages/notificacao/evento_adverso_screen.dart';
import 'package:form_sus/pages/notificacao/info_adicional_screen.dart';
import 'package:form_sus/pages/notificacao/notificacao_screen.dart';
import 'package:form_sus/pages/notificacao/notificador_screen.dart';
import 'package:form_sus/pages/notificacao/paciente_screen.dart';
import 'package:form_sus/pages/notificacao/produto_suspeito_screen.dart';
import 'package:form_sus/services/fb_repository.dart';

enum MyPage {
  NOTIFICADOR,
  NOTIFICACAO,
  PACIENTE,
  EVENTADVERSO,
  PRODUTOSUSP,
  INFOADICIONAL
}

class PageProvider with ChangeNotifier {
  PageController _pageController;
  MyPage _page;
  PageProvider() {
    print("PageProvider init");
    _page = MyPage.NOTIFICADOR;
    _pageController = PageController(
      initialPage: _page.index,
      keepPage: true,
    );
  }

  SnackBar pageSnackbar(String title) {
    return SnackBar(
        duration: Duration(milliseconds: 3000),
        content: Text(
          title,
          textAlign: TextAlign.center,
        ));
  }

//*************************************** VARS ***************************************//

  //String _categoriaRadioGroupValue;

  //MODELS
  //Notificacaom _notificacao = Notificacaom();
  Map<String, dynamic> _data = Map<String, dynamic>();
  bool _isSaving = false;

//*************************************** FUNCTIONS ***************************************//
  nextPage() {
    //if (_page.index < 5) _page = MyPage.values[_page.index + 1];
    _page = MyPage.values[_page.index + 1];
    _pageController.animateToPage(_page.index,
        duration: Duration(milliseconds: 500), curve: Curves.ease);
    notifyListeners();
  }

  prevPage() {
    //_page = MyPage.values[_page.index - 1];
    _page = MyPage.values[_page.index - 1];
    _pageController.animateToPage(_page.index,
        duration: Duration(milliseconds: 500), curve: Curves.ease);
    notifyListeners();
  }

  saveData(Map<String, dynamic> data) {
    //_notificacao = Notificacaom.fromObj(data);
    _data.addAll(data);
    print("MAP: $_data");
    /* _notificacao.saveData(data);
    print("MODEL: $_notificacao"); */
  }

  registerNotificacao({Function onSuccess, Function onFail}) async {
    try {
      setIsSaving = true;
      await FirebaseRepository().saveDocument(_data);
      onSuccess();
    } catch (e) {
      print("Erro ao registar notificação!");
      setIsSaving = false;
      onFail();
    }
  }

  /* saveModel(Object model) {
    switch (model.runtimeType) {
      case Notificador:
        print("É notificador!");
        _notificacao = model;
        print("Salvando Notificador Model: $_notificador");
        print("Notificador toJson: ${_notificador.toJson()}");
        break;
      default:
        print("Nao identificado");
        throw FormatException("Model não identificado.");
    }
  } */

//*************************************** GETTERS ***************************************//
  PageController get getPageController => _pageController;
  bool get isNotificadorPage => _page == MyPage.NOTIFICADOR;
  bool get isSaving => _isSaving;

  //String get getCatNotificadorRadio => _categoriaRadioGroupValue;

  //Notificacaom get getNotificadorModel => _notificacao;
  String get getPageName {
    switch (_page) {
      case MyPage.NOTIFICADOR:
        return "Identificação do Notificador";
        break;
      case MyPage.NOTIFICACAO:
        return "Identificação Notificação";
        break;
      case MyPage.PACIENTE:
        return "Identificação do Paciente";
        break;
      case MyPage.EVENTADVERSO:
        return "Evento Adverso";
        break;
      case MyPage.PRODUTOSUSP:
        return "Produto/Alimento Suspeito";
        break;
      case MyPage.INFOADICIONAL:
        return "Info. Adicionais";
        break;
      default:
        return "";
    }
  }

  Widget get getPage {
    switch (_page) {
      case MyPage.NOTIFICADOR:
        return NotificadorScreen();
        break;
      case MyPage.NOTIFICACAO:
        return NotificacaoScreen();
        break;
      case MyPage.PACIENTE:
        return PacienteScreen();
        break;
      case MyPage.EVENTADVERSO:
        return EventoAdversoScreen();
        break;
      case MyPage.PRODUTOSUSP:
        return ProdutoSuspeitoScreen();
        break;
      case MyPage.INFOADICIONAL:
        return InfoAdicionalScreen();
        break;
      default:
        return Center(
          child: Text("PAGE NOT FOUND!"),
        );
    }
  }

//*************************************** SETTERS ***************************************//
  set setIsSaving(bool val) {
    _isSaving = val;
    notifyListeners();
  }
}

class ModelException implements Exception {
  String cause;
  ModelException([this.cause]);

  @override
  toString() {
    if (cause != null) return 'ModelException: $cause';

    return 'ModelException';
  }
}

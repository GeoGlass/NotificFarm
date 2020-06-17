import 'package:flutter/material.dart';
import 'package:form_sus/pages/notificacao/evento_adverso_screen.dart';
import 'package:form_sus/pages/notificacao/info_adicional_screen.dart';
import 'package:form_sus/pages/notificacao/notificacao_screen.dart';
import 'package:form_sus/pages/notificacao/notificador_screen.dart';
import 'package:form_sus/pages/notificacao/paciente_screen.dart';
import 'package:form_sus/pages/notificacao/produto_suspeito_screen.dart';
import 'package:form_sus/services/page_manager_provider.dart';
import 'package:form_sus/services/data_manager_provider.dart';
import 'package:provider/provider.dart';

class RegistroNotificacaoPage extends StatelessWidget {
  const RegistroNotificacaoPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<PageProvider>(
          create: (_) => PageProvider(),
        ),
        ChangeNotifierProvider<DataProvider>(
          create: (_) => DataProvider(),
        ),
      ],
      child: Consumer<PageProvider>(
        builder: (context, pageProv, child) => Scaffold(
          appBar: AppBar(
            leading: !pageProv.isNotificadorPage
                ? IconButton(
                    icon: Icon(Icons.keyboard_return),
                    onPressed: () {
                      print("return page");
                      pageProv.prevPage();
                    })
                : null,
            title: Text(
              pageProv.getPageName,
            ),
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.only(top: 12),
            child: PageView(
              controller: pageProv.getPageController,
              physics: NeverScrollableScrollPhysics(),
              children: <Widget>[
                NotificadorScreen(),
                NotificacaoScreen(),
                PacienteScreen(),
                EventoAdversoScreen(),
                ProdutoSuspeitoScreen(),
                InfoAdicionalScreen()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

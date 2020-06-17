import 'package:flutter/material.dart';
import 'package:form_sus/models/notificacao.dart';
import 'package:form_sus/pages/home/open_registro.dart';
import 'package:form_sus/services/fb_repository.dart';
import 'package:form_sus/theme/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:form_sus/widgets/delete_dialog.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FirebaseRepository repository = FirebaseRepository();
    return Scaffold(
      appBar: AppBar(
        title: Text("Notificações"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.help),
            color: kInputFillColor,
            onPressed: () {
              showAboutDialog(
                  context: context,
                  applicationVersion: '1.0.0',
                  applicationLegalese: 'Desenvolvido por: ',
                  children: <Widget>[
                    Text("George V. Glass Machado",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        )),
                    Text(
                      "E-mail: geo.glass@hotmail.com",
                      style: TextStyle(
                          color: kPrimary2,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic),
                    ),
                    Text(
                      "Tel: 77 9 9858-9856",
                      style: TextStyle(
                          color: kPrimary2,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic),
                    ),
                  ]);
              /* showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(6.0)),
                  ),
                  title: Text(
                    "Desenvolvido por: ",
                    style: TextStyle(color: kPrimary1),
                  ),
                  content: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("George V. Glass Machado",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          )),
                      Text(
                        "E-mail: geo.glass@hotmail.com",
                        style: TextStyle(
                            color: kPrimary2,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic),
                      ),
                      Text(
                        "Tel: 77 9 9858-9856",
                        style: TextStyle(
                            color: kPrimary2,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic),
                      ),
                    ],
                  ),
                ),
              ); */
            },
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: kPrimary1,
        tooltip: 'Criar Notificação',
        onPressed: () {
          Navigator.pushNamed(context, '/create-registro');
        },
      ),
      body: Center(
        child: StreamBuilder<QuerySnapshot>(
          stream: repository.getStream(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) return Text('Error: ${snapshot.error}');
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return _loading();
              default:
                return snapshot.data.documents.isNotEmpty
                    ? ListView(
                        children: snapshot.data.documents
                            .map((DocumentSnapshot document) {
                          Notificacaom _notificacao =
                              Notificacaom.fromDocument(document);
                          return Card(
                            child: ListTile(
                              title: Text(
                                _notificacao.nome,
                                style: TextStyle(color: kPrimary1),
                              ),
                              subtitle: Text('pcte: ${_notificacao.paNome}'),
                              trailing: Text(
                                _notificacao.paDesfecho,
                                style: TextStyle(
                                    color: kPrimary1,
                                    fontStyle: FontStyle.italic),
                              ),
                              onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => OpenRegistro(
                                          notificacaom: _notificacao,
                                        )),
                              ),
                              onLongPress: () {
                                print("onLongPress");
                                showDialog(
                                    context: context,
                                    builder: (context) => DeleteDialog(
                                          title: 'Excluir',
                                          content:
                                              'Realmente deseja excluir este registro?',
                                          confirmText: 'Confirmar',
                                          cancelText: 'Cancelar',
                                          confirmFunc: () async {
                                            print("Confirmar delete Dialog");
                                            await FirebaseRepository()
                                                .deleteDocument(
                                                    _notificacao.id);
                                            Navigator.pop(context);
                                          },
                                          cancelFunc: () =>
                                              Navigator.pop(context),
                                        ));
                              },
                            ),
                          );
                        }).toList(),
                      )
                    : Text("Sem registro de notificação.");
            }
          },
        ),
      ),
    );
  }

  Widget _loading() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
            margin: const EdgeInsets.only(bottom: 10.0),
            child: Text(
              "Carregando registros...",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 18.0,
                  color: kPrimary1,
                  fontWeight: FontWeight.bold),
            )),
        CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(kPrimary1),
        ),
      ],
    );
  }
}

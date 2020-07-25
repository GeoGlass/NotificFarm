# Introdução

Este app foi desenvolvido a partir de um [formulário](http://formsus.datasus.gov.br/site/formulario.php?id_aplicacao=31480) solicitado por uma universitária do curso de Farmácia.  

O aplicativo foi desenvolvido com o framework Flutter e Firebase Cloud Firestore como backend. Para o gerenciamento de estados dos dados e 
telas foi utilizado o [Provider](https://pub.dev/packages/provider).

## Como funciona

Ao abrir o aplicativo é apresentado uma splash screen antes de terminar a inicialização. A tela principal mostra um lista de todas as notificações armazenadas no `Firestore`. 

![abertura](screenshots/Abertura.gif)

Ao pressionar o botão `+` o usuário é direcionado a uma nova tela para o preenchimento do formulário. Os campos com `*` são abrigatórios.

![form](screenshots/PreenchendoForm.gif) ![formCompleto](screenshots/PreenchendoFormCompleto.gif)

Após criado o registro, o usuário é direcionado a tela principal com uma lista de todos os registros salvos no Firestore. Ao pressionar em um registro, é aberto uma tela com as informações do mesmo.

![acessandoRegistros](screenshots/AcessandoRegistros.gif)

Ao manter pressionado qualquer registro, é apresentado um `Dialog` de confirmação para a exclusão do mesmo.

![apagandoRegistro](screenshots/ApagandoRegistro.gif)
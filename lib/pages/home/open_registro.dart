import 'package:flutter/material.dart';
import 'package:form_sus/models/notificacao.dart';
import 'package:form_sus/theme/colors.dart';
import 'package:form_sus/widgets/custom_container.dart';

class OpenRegistro extends StatelessWidget {
  final Notificacaom notificacaom;
  const OpenRegistro({Key key, @required this.notificacaom}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color _whiteColor = Theme.of(context).scaffoldBackgroundColor;
    TextStyle _dataStyle = Theme.of(context).textTheme.subtitle1;
    return Scaffold(
      appBar: AppBar(
        title: Text(notificacaom.paNome),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 12.0),
          child: Column(
            children: <Widget>[
              CustomContainer(
                title: 'Identificação do Notificador',
                subtitle: 'Dados do Notificador',
                color: _whiteColor,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    CustomText(
                      title: 'Nome: ',
                      data: notificacaom.nome,
                    ),
                    CustomText(
                      title: 'Cidade: ',
                      data: '${notificacaom.cidade} - ${notificacaom.uf}',
                    ),
                    CustomText(
                      title: 'Categoria: ',
                      data: notificacaom.categoria,
                    ),
                    CustomText(
                      title: 'Telefone: ',
                      data: notificacaom.tel,
                    ),
                    CustomText(
                      title: 'E-mail: ',
                      data: notificacaom.email,
                    ),
                  ],
                ),
              ),
              CustomContainer(
                title: 'Identificação da Notificação',
                subtitle: 'Dados da Notificação',
                color: _whiteColor,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    CustomText(
                      title: 'Motivo: ',
                      data: notificacaom.motivo,
                    ),
                    CustomText(
                      title: 'QT/QA: ',
                      data: notificacaom.qeOUea,
                    ),
                  ],
                ),
              ),
              CustomContainer(
                title:
                    'Identificação do Paciente/Usuário que sofreu o evento adverso',
                subtitle: 'Identificação do paciente',
                color: _whiteColor,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    CustomText(
                      title: 'Nome: ',
                      data: notificacaom.paNome,
                    ),
                    CustomText(
                      title: 'Idade: ',
                      data: notificacaom.paIdade.toString(),
                    ),
                    CustomText(
                      title: 'Sexo: ',
                      data: notificacaom.paSexo,
                    ),
                    CustomText(
                      title: 'Profissão: ',
                      data: notificacaom.paProfissao,
                    ),
                    CustomText(
                      title: 'Município: ',
                      data: notificacaom.paMunicipio,
                    ),
                    CustomText(
                      title: 'Telefone: ',
                      data: notificacaom.paTel,
                    ),
                    CustomText(
                      title: 'Doenças concomitantes: ',
                      data: notificacaom.paDoencas,
                    ),
                    CustomText(
                      title: 'Telefone: ',
                      data: notificacaom.paTel,
                    ),
                    CustomText(
                      title: 'Desfecho: ',
                      data: notificacaom.paDesfecho,
                    ),
                  ],
                ),
              ),
              CustomContainer(
                title: 'Evento Adverso',
                subtitle: 'Especificações do Evento Adverso',
                color: _whiteColor,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    CustomText(
                      title: 'Descrição detalhada do EA observado: ',
                      data: notificacaom.eaDescDetalhada,
                    ),
                    CustomText(
                      title: 'Data de Inicio dos Sintomas: ',
                      data: notificacaom.eaDataInicioSintomas,
                    ),
                    CustomText(
                      title: 'Manifestações Clínicas associadas ao evento adverso: ',
                      data: notificacaom.eaCheckedManifests.toString(),
                    ),                    
                    CustomText(
                      title:
                          'Tempo entre o consumo do alimento e o aparecimento do evento adverso: ',
                      data: notificacaom.eaTempoConsumoAlimento,
                    ),
                    CustomText(
                      title: 'Tempo faz uso do produto(alimento): ',
                      data: notificacaom.eaTempoUsoProduto,
                    ),
                    CustomText(
                      title: 'Suspensão do consumo do produto: ',
                      data: notificacaom.eaSuspensaoConsumoProduto,
                    ),
                    CustomText(
                      title:
                          'Consumiu o alimento concomitante com algum medicamento: ',
                      data: notificacaom.eaConsumiuAlimentoComMedicamento,
                    ),
                  ],
                ),
              ),
              CustomContainer(
                title: 'Produto/Alimento suspeito',
                subtitle: 'Especificações do alimento/produto que causou EA',
                color: _whiteColor,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    CustomText(
                      title: 'Nome comercial do Produto: ',
                      data: notificacaom.psNomeComercialProd,
                    ),
                    CustomText(
                      title: 'Marca do Produto: ',
                      data: notificacaom.psMarcaProd,
                    ),
                    CustomText(
                      title: 'Forma de apresentação do produto na embalagem: ',
                      data: notificacaom.psFormaApresProdEmb,
                    ),
                    CustomText(
                      title: 'Nome da Empresa Fabricante: ',
                      data: notificacaom.psNomeEmpresaFab,
                    ),
                    CustomText(
                      title: 'Origem do Produto: ',
                      data: notificacaom.psOrigemProd,
                    ),
                    CustomText(
                      title: 'Número do CNPJ da empresa fabricante: ',
                      data: notificacaom.psCNPJempresaFab,
                    ),                 
                    CustomText(
                      title: 'Número do Registro/MS no rótulo: ',
                      data: notificacaom.psNumRegRotulo,
                    ),   
                    CustomText(
                      title: 'Data de Fabricação: ',
                      data: notificacaom.psDataFab,
                    ),   
                    CustomText(
                      title: 'Número do Lote: ',
                      data: notificacaom.psNumLote.toString(),
                    ),   
                    CustomText(
                      title: 'Data da Validade: ',
                      data: notificacaom.psDataValidade,
                    ),   
                    CustomText(
                      title: 'Data da Compra do Produto: ',
                      data: notificacaom.psDataCompraProd,
                    ),   
                   
                 
                    
                  ],
                ),
              ),
              CustomContainer(
                title: 'Informações Adicionais',
                subtitle: 'Dados do evento adverso',
                color: _whiteColor,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    CustomText(
                      title: 'Local de Aquisição do Produto: ',
                      data: notificacaom.iaLocalAquisProd,
                    ),
                    CustomText(
                      title: 'Produto apresentou alteração: ',
                      data: notificacaom.iaProdApresAlteracao,
                    ),
                    CustomText(
                      title: 'Comunicação à empresa fabricante ou importadora: ',
                      data: notificacaom.iaHouveComunicEmp,
                    ),
                    CustomText(
                      title: 'Evento adverso foi comunicado ao órgão de Vigilância Sanitária ou Vigilância Epidemiológica local: ',
                      data: notificacaom.iaEventAdvComunicVigil,
                    ),                   
                    CustomText(
                      title: 'Existe amostras íntegras para a coleta e que podem ser entregues à Vigilância Sanitária: ',
                      data: notificacaom.iaExistAmostrasInteg,
                    ),                   
                    CustomText(
                      title: 'O paciente/usuário recebeu atendimento em serviço de saúde: ',
                      data: notificacaom.iaPcteRecebAtend,
                    ),                   
                  
                   
                  
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomText extends StatelessWidget {
  final String title;
  final String data;
  const CustomText({Key key, this.title, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle _dataStyle = Theme.of(context).textTheme.subtitle1;
    TextStyle _keyStyle =
        Theme.of(context).textTheme.subtitle1.apply(fontWeightDelta: 4);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: RichText(
        text: TextSpan(
          style: _keyStyle,
          children: <TextSpan>[
            TextSpan(text: title), //'Data de Inicio dos Sintomas:'
            TextSpan(
                text: data,
                style: _dataStyle), //notificacaom.eaDataInicioSintomas
          ],
        ),
      ),
    );
  }
}

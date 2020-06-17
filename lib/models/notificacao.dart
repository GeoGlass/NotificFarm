import 'package:cloud_firestore/cloud_firestore.dart';

class Notificacaom {
  String id;

  //Notificador
  String nome;
  String cidade;
  String uf;
  String tel;
  String email;
  String categoria;

  //Notificação
  String motivo;
  String qeOUea;

  //Paciente
  String paNome;
  int paIdade;
  String paSexo;
  String paProfissao;
  String paMunicipio;
  String paTel;
  String paEmail;
  String paDoencas;
  String paDesfecho;

  //Evento Adverso
  String eaDescDetalhada;
  String eaDataInicioSintomas;
  List eaCheckedManifests;
  String eaTempoConsumoAlimento;
  String eaTempoUsoProduto;
  String eaSuspensaoConsumoProduto;
  String eaConsumiuAlimentoComMedicamento;

  //Produto Suspeito
  String psNomeComercialProd;
  String psMarcaProd;
  String psFormaApresProdEmb;
  String psNomeEmpresaFab;
  String psOrigemProd;
  String psCNPJempresaFab;
  String psNumRegRotulo;
  String psDataFab;
  int psNumLote;
  String psDataValidade;
  String psDataCompraProd;

  //Informações Adicionais
  String iaLocalAquisProd;  
  String iaProdApresAlteracao;  
  String iaHouveComunicEmp;  
  String iaEventAdvComunicVigil;  
  String iaExistAmostrasInteg;  
  String iaPcteRecebAtend;    

  Notificacaom({
    this.id,
    this.nome,
    this.cidade,
    this.uf,
    this.tel,
    this.email,
    this.categoria,
    this.motivo,
    this.qeOUea,
    this.paNome,
    this.paIdade,
    this.paSexo,
    this.paProfissao,
    this.paMunicipio,
    this.paTel,
    this.paEmail,
    this.paDoencas,
    this.paDesfecho,
    this.eaDescDetalhada,
    this.eaDataInicioSintomas,
    this.eaCheckedManifests,
    this.eaTempoConsumoAlimento,
    this.eaTempoUsoProduto,
    this.eaSuspensaoConsumoProduto,
    this.eaConsumiuAlimentoComMedicamento,
    this.psNomeComercialProd,
    this.psMarcaProd,
    this.psFormaApresProdEmb,
    this.psNomeEmpresaFab,
    this.psOrigemProd,
    this.psCNPJempresaFab,
    this.psNumRegRotulo,
    this.psDataFab,
    this.psNumLote,
    this.psDataValidade,
    this.psDataCompraProd,
    this.iaLocalAquisProd,
    this.iaProdApresAlteracao,
    this.iaHouveComunicEmp,
    this.iaEventAdvComunicVigil,
    this.iaExistAmostrasInteg,
    this.iaPcteRecebAtend,
  });  

  factory Notificacaom.fromDocument(DocumentSnapshot snapshot) => Notificacaom(
        id: snapshot.documentID,
        nome: snapshot['nome'],
        cidade: snapshot['cidade'],
        uf: snapshot['uf'],
        tel: snapshot['tel'],
        email: snapshot['email'],
        categoria: snapshot['categoria'],
        motivo: snapshot['motivo'],
        qeOUea: snapshot['qeOUea'] ?? 'nulo',
        paNome: snapshot['paNome'],
        paIdade: snapshot['paIdade'],
        paSexo: snapshot['paSexo'],
        paProfissao: snapshot['paProfissao'],
        paMunicipio: snapshot['paMunicipio'],
        paTel: snapshot['paTel'],
        paEmail: snapshot['paEmail'],
        paDoencas: snapshot['paDoencas'],
        paDesfecho: snapshot['paDesfecho'],
        eaDescDetalhada: snapshot['eaDescDetalhada'],
        eaDataInicioSintomas: snapshot['eaDataInicioSintomas'],
        eaCheckedManifests: snapshot['eaCheckedManifests'],
        eaTempoConsumoAlimento: snapshot['eaTempoConsumoAlimento'],
        eaTempoUsoProduto: snapshot['eaTempoUsoProduto'],
        eaSuspensaoConsumoProduto: snapshot['eaSuspensaoConsumoProduto'],
        eaConsumiuAlimentoComMedicamento: snapshot['eaConsumiuAlimentoComMedicamento'],
        psNomeComercialProd: snapshot['psNomeComercialProd'],
        psMarcaProd: snapshot['psNomeComercialProd'],
        psFormaApresProdEmb: snapshot['psNomeComercialProd'],
        psNomeEmpresaFab: snapshot['psNomeEmpresaFab'],
        psOrigemProd: snapshot['psOrigemProd'],
        psCNPJempresaFab: snapshot['psCNPJempresaFab'],
        psNumRegRotulo: snapshot['psNumRegRotulo'],
        psDataFab: snapshot['psDataFab'],
        psNumLote: snapshot['psNumLote'],
        psDataValidade: snapshot['psDataValidade'],
        psDataCompraProd: snapshot['psDataCompraProd'],
        iaLocalAquisProd: snapshot['iaLocalAquisProd'],
        iaProdApresAlteracao: snapshot['iaProdApresAlteracao'],
        iaHouveComunicEmp: snapshot['iaHouveComunicEmp'],
        iaEventAdvComunicVigil: snapshot['iaEventAdvComunicVigil'],
        iaExistAmostrasInteg: snapshot['iaExistAmostrasInteg'],
        iaPcteRecebAtend: snapshot['iaPcteRecebAtend'],
      );

  Map<String, dynamic> toJson() => {
        "nome": nome,
        "cidade": cidade,
        "uf": uf,
        "tel": tel,
        "email": email,
        "categoria": categoria,
        "motivo": motivo,
        "qeOUea": qeOUea,
        "paNome": paNome,
        "paIdade": paIdade,
        "paSexo": paSexo,
        "paProfissao": paProfissao,
        "paMunicipio": paMunicipio,
        "paTel": paTel,
        "paEmail": paEmail,
        "paDoencas": paDoencas,
        "paDesfecho": paDesfecho,
        "eaDescDetalhada": eaDescDetalhada,
        "eaDataInicioSintomas": eaDataInicioSintomas,
        "eaCheckedManifests": eaCheckedManifests,
        "eaTempoConsumoAlimento": eaTempoConsumoAlimento,
        "eaTempoUsoProduto": eaTempoUsoProduto,
        "eaSuspensaoConsumoProduto": eaSuspensaoConsumoProduto,
        "eaConsumiuAlimentoComMedicamento": eaConsumiuAlimentoComMedicamento,
        "psNomeComercialProd": psNomeComercialProd,
        "psMarcaProd": psMarcaProd,
        "psFormaApresProdEmb": psFormaApresProdEmb,
        "psNomeEmpresaFab": psNomeEmpresaFab,
        "psOrigemProd": psOrigemProd,
        "psCNPJempresaFab": psCNPJempresaFab,
        "psNumRegRotulo": psNumRegRotulo,
        "psDataFab": psDataFab,
        "psNumLote": psNumLote,
        "psDataValidade": psDataValidade,
        "psDataCompraProd": psDataCompraProd,
        "iaLocalAquisProd": iaLocalAquisProd,
        "iaProdApresAlteracao": iaProdApresAlteracao,
        "iaHouveComunicEmp": iaHouveComunicEmp,
        "iaEventAdvComunicVigil": iaEventAdvComunicVigil,
        "iaExistAmostrasInteg": iaExistAmostrasInteg,
        "iaPcteRecebAtend": iaPcteRecebAtend,
      };  

  @override
  String toString() {
    return 'Notificador - nome: $nome, cidade: $cidade, uf: $uf, tel: $tel, ' +
        'email: $email, categoria: $categoria, motivo: $motivo, qeOUqa: $qeOUea, ' +
        'paNome: $paNome, paIdade: $paIdade, paSexo: $paSexo, paProfissao: $paProfissao, telPaciente: $paTel, ' +
        'paMunicipio: $paMunicipio, paTel: $paTel, paEmail: $paEmail, ' +
        'paDoencas: $paDoencas, paDesfecho: $paDesfecho, eaDescDetalhada: $eaDescDetalhada, eaDataInicioSintomas: $eaDataInicioSintomas, ' +
        'eaCheckedManifests: $eaCheckedManifests, eaTempoConsumoAlimento: $eaTempoConsumoAlimento, eaTempoUsoProduto: $eaTempoUsoProduto ' + 
        'eaSuspensaoConsumoProduto: $eaSuspensaoConsumoProduto, eaConsumiuAlimentoComMedicamento: $eaConsumiuAlimentoComMedicamento ' +
        'psNomeComercialProd: $psNomeComercialProd, psMarcaProd: $psMarcaProd, psFormaApresProdEmb: $psFormaApresProdEmb, ' +
        'psNomeEmpresaFab: $psNomeEmpresaFab, psOrigemProd: $psOrigemProd, psCNPJempresaFab: $psCNPJempresaFab, ' +
        'psNumRegRotulo: $psNumRegRotulo, psDataFab: $psDataFab, psNumLote: $psNumLote, psDataValidade: $psDataValidade ' +
        'psDataCompraProd: $psDataCompraProd, iaLocalAquisProd: $iaLocalAquisProd, iaProdApresAlteracao: $iaProdApresAlteracao, ' +
        'iaHouveComunicEmp: $iaHouveComunicEmp, iaEventAdvComunicVigil: $iaEventAdvComunicVigil, ' +
        'iaExistAmostrasInteg: $iaExistAmostrasInteg, iaPcteRecebAtend: $iaPcteRecebAtend';
  }
}

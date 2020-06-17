class Notificador {
  String nome;
  String cidade;
  String uf;
  String tel;
  String email;
  String categoria;

  Notificador({
    this.nome,
    this.cidade,
    this.uf,
    this.tel,
    this.email,
    this.categoria,
  });

  factory Notificador.fromObj(Map<String, dynamic> obj) => Notificador(
        nome: obj['nome'],
        cidade: obj['cidade'],
        uf: obj['uf'],
        tel: obj['tel'],
        email: obj['email'],
        categoria: obj['categoria'],
      );

  Map<String, dynamic> toJson() => {
        "nome": nome,
        "cidade": cidade,
        "uf": uf,
        "tel": tel,
        "email": email,
        "categoria": categoria,
    };

  @override
  String toString() {
    return ' Notificador - nome: $nome, cidade: $cidade, uf: $uf, tel: $tel, email: $email, categoria: $categoria';
  }
}

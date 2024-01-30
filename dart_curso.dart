void main() {
  String nome = "Laranja";
  double peso = 100.2;
  String cor = "Verde e Amarela";
  int diasDesdeColheita = 40;
  bool? isMadura;

  funcEstaMadura(diasDesdeColheita);
  mostrarMadura(nome, diasDesdeColheita, cor: cor);
  funcEstaMadura(diasDesdeColheita);
  
  Alimento alimento = Alimento(nome, peso, cor);
  Fruta fruta = Fruta(nome, peso, cor, 1);
  
  alimento.printAlimento();
  fruta.fazerSuco();
  fruta.printAlimento();
  fruta.separarIngredientes();
  fruta.fazerMassa();
  fruta.assar();
}

bool funcEstaMadura(int dias) {
  return dias >= 30;
}

void mostrarMadura(String nome, int dias, {required String cor}) {
  if (funcEstaMadura(dias)) {
    print("A $nome está madura.");
  } else {
    print("A $nome não está madura.");
  }

  print("A $nome é $cor.");
}

int funcQuantosDiasMadura(int dias) {
  int diasParaMadura = 30;
  int quantosDiasFaltam = diasParaMadura - dias;
  return quantosDiasFaltam;
}

abstract class Bolo {
  void separarIngredientes();
  void fazerMassa();
  void assar();
}

class Alimento {
  String nome;
  double peso;
  String cor;

  Alimento(this.nome, this.peso, this.cor);

  void printAlimento() {
    print("Este/a $nome pesa $peso gramas e é $cor.");
  }
}

class Fruta extends Alimento implements Bolo {
  int diaDesdeColheita;
  bool? isMadura;

  Fruta(String nome, double peso, String cor, this.diaDesdeColheita,
      {this.isMadura})
      : super(nome, peso, cor);

  void fazerSuco() {
    print("Você fez um belo suco de $nome");
  }

  @override
  void separarIngredientes() {
    print("Catar a fruta");
  }

  @override
  void fazerMassa() {
    print("Mistura, mistura.");
  }

  @override
  void assar() {
    print("Por no forno!");
  }
}

class Legume extends Alimento implements Bolo {
  bool isPrecisaCozinhar;

  Legume(String nome, double peso, String cor, this.isPrecisaCozinhar)
      : super(nome, peso, cor);

  void cozinhar() {
    (isPrecisaCozinhar)
        ? print("Pronto, o $nome está cozinhado!")
        : print("Nem precisou cozinhar");
  }

  @override
  void assar() {
    print("Assar o legume.");
  }

  @override
  void fazerMassa() {
    print("Preparar a massa do legume.");
  }

  @override
  void separarIngredientes() {
    print("Separar ingredientes do legume.");
  }
}

class Citricas extends Fruta {
  double nivelAzedo;

  Citricas(String nome, double peso, String cor, int diaDesdeColheita,
      this.nivelAzedo)
      : super(nome, peso, cor, diaDesdeColheita);

  void existeRefri(bool existe) {
    (existe)
        ? print("Existe refri de $nome")
        : print("Não existe refri de $nome");
  }

  @override
  void fazerMassa() {
    print("Tirar sementes");
    super.fazerMassa();
  }
}

class Nozes extends Fruta {
  double porcentagemOleoNatural;

  Nozes(String nome, double peso, String cor, int diaDesdeColheita,
      this.porcentagemOleoNatural)
      : super(nome, peso, cor, diaDesdeColheita);

  @override
  void fazerMassa() {
    print("Tirar a casca");
    super.fazerMassa();
  }
}

class Boletim {
  final List<ItensBoletim> items;

  const Boletim({
    required this.items,
  });
}

class ItensBoletim {
  final String disciplinas;
  final double notaBim1;
  final double notaBim2;
  final double notaBim3;
  final double notaBim4;
  final int faltaBim1;
  final int faltaBim2;
  final int faltaBim3;
  final int faltaBim4;

  const ItensBoletim({
    required this.disciplinas,
    required this.notaBim1,
    required this.notaBim2,
    required this.notaBim3,
    required this.notaBim4,
    required this.faltaBim1,
    required this.faltaBim2,
    required this.faltaBim3,
    required this.faltaBim4,
  });
}

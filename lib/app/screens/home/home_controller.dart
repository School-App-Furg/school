import 'package:mobx/mobx.dart';
import 'package:school/app/core/models/notas.dart';
part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  @observable
  List<Aluno> notas = [];

  @action
  buscarAlunos() {
    notas = [Aluno(name: 'joão', nota: 9), Aluno(name: 'maria', nota: 10)];
  }
}

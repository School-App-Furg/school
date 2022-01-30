import 'package:mobx/mobx.dart';

part 'school_report_generator_controller.g.dart';

class SchoolReportGeneratorController = _SchoolReportGeneratorControllerBase
    with _$SchoolReportGeneratorController;

abstract class _SchoolReportGeneratorControllerBase with Store {
  //lista de ids de estudantes selecionados
  @observable
  List<String> studentsSelected = [];

  //recebe os valores selecionados no multiSelect dos students
  @action
  setStudentsSelected(List values) {
    studentsSelected.clear();
    values.forEach(
      (element) {
        studentsSelected.add(element);
      },
    );
  }
}

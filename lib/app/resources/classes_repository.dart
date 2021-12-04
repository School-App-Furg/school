import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobx/mobx.dart';
import '../core/models/subject_teacher.dart';
import '../core/models/classes.dart';

class ClassesRepository {
  FirebaseFirestore firestoreInstance = FirebaseFirestore.instance;

  //Retorna a lista de turmas cadastrada em uma determinada escola
  Future<ObservableList<Classes>?> getClassesBySchoolId(
      String id, String cycle) async {
    ObservableList<Classes>? list = ObservableList<Classes>();
    try {
      QuerySnapshot<Map<String, dynamic>> snapshot = await firestoreInstance
          .collection('classes')
          .where('schoolId', isEqualTo: id)
          .where('cycleId', isEqualTo: cycle)
          .get();
      snapshot.docs.forEach(
        (element) async {
          List<SubjectTeacher> listSubjectsTeacher =
              await getSubjetTeacher(element.id);
          Classes turma = Classes.fromJson(
            json.encode(
              element.data(),
            ),
          );
          list.add(
            Classes(
                schoolId: turma.cycleId,
                name: turma.name,
                room: turma.room,
                cycleId: turma.cycleId,
                level: turma.level,
                subjectTeacher: listSubjectsTeacher),
          );
        },
      );
    } catch (error) {
      throw Exception(error);
    }
    return list;
  }

  //retorna a lista de disciplinas e o seu professor cadastrado de cada turma
  Future<List<SubjectTeacher>> getSubjetTeacher(String id) async {
    List<SubjectTeacher>? list = [];
    try {
      QuerySnapshot<Map<String, dynamic>> snapshot = await firestoreInstance
          .collection('classes')
          .doc(id)
          .collection('subjectTeacher')
          .get();
      snapshot.docs.forEach(
        (element) async {
          list.add(
            SubjectTeacher.fromJson(
              json.encode(
                element.data(),
              ),
            ),
          );
        },
      );
    } catch (error) {
      throw Exception(error);
    }
    return list;
  }

  //cadastro de turmas
  Future<bool> insertClass(Classes classe) async {
    try {
      await firestoreInstance.collection('classes').add(classe.toMap());
      return true;
    } catch (e) {
      throw Exception(e);
    }
  }
}

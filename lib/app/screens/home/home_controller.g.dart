// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  final _$notasAtom = Atom(name: '_HomeControllerBase.notas');

  @override
  List<Aluno> get notas {
    _$notasAtom.reportRead();
    return super.notas;
  }

  @override
  set notas(List<Aluno> value) {
    _$notasAtom.reportWrite(value, super.notas, () {
      super.notas = value;
    });
  }

  @override
  String toString() {
    return '''
notas: ${notas}
    ''';
  }
}

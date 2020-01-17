// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hormonios_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HormoniosController on _HormoniosBase, Store {
  final _$mostrarCalendarioAtom =
      Atom(name: '_HormoniosBase.mostrarCalendario');

  @override
  bool get mostrarCalendario {
    _$mostrarCalendarioAtom.context.enforceReadPolicy(_$mostrarCalendarioAtom);
    _$mostrarCalendarioAtom.reportObserved();
    return super.mostrarCalendario;
  }

  @override
  set mostrarCalendario(bool value) {
    _$mostrarCalendarioAtom.context.conditionallyRunInAction(() {
      super.mostrarCalendario = value;
      _$mostrarCalendarioAtom.reportChanged();
    }, _$mostrarCalendarioAtom, name: '${_$mostrarCalendarioAtom.name}_set');
  }

  final _$_HormoniosBaseActionController =
      ActionController(name: '_HormoniosBase');

  @override
  void mudarPaginaHormonios() {
    final _$actionInfo = _$_HormoniosBaseActionController.startAction();
    try {
      return super.mudarPaginaHormonios();
    } finally {
      _$_HormoniosBaseActionController.endAction(_$actionInfo);
    }
  }
}

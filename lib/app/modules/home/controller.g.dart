// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Controller on ControllerBase, Store {
  final _$counterAtom = Atom(name: 'ControllerBase.counter');

  @override
  int get counter {
    _$counterAtom.context.enforceReadPolicy(_$counterAtom);
    _$counterAtom.reportObserved();
    return super.counter;
  }

  @override
  set counter(int value) {
    _$counterAtom.context.conditionallyRunInAction(() {
      super.counter = value;
      _$counterAtom.reportChanged();
    }, _$counterAtom, name: '${_$counterAtom.name}_set');
  }

  final _$mostrarPaginaAtom = Atom(name: 'ControllerBase.mostrarPagina');

  @override
  Pages get mostrarPagina {
    _$mostrarPaginaAtom.context.enforceReadPolicy(_$mostrarPaginaAtom);
    _$mostrarPaginaAtom.reportObserved();
    return super.mostrarPagina;
  }

  @override
  set mostrarPagina(Pages value) {
    _$mostrarPaginaAtom.context.conditionallyRunInAction(() {
      super.mostrarPagina = value;
      _$mostrarPaginaAtom.reportChanged();
    }, _$mostrarPaginaAtom, name: '${_$mostrarPaginaAtom.name}_set');
  }

  final _$textAtom = Atom(name: 'ControllerBase.text');

  @override
  String get text {
    _$textAtom.context.enforceReadPolicy(_$textAtom);
    _$textAtom.reportObserved();
    return super.text;
  }

  @override
  set text(String value) {
    _$textAtom.context.conditionallyRunInAction(() {
      super.text = value;
      _$textAtom.reportChanged();
    }, _$textAtom, name: '${_$textAtom.name}_set');
  }

  final _$ControllerBaseActionController =
      ActionController(name: 'ControllerBase');

  @override
  dynamic increment() {
    final _$actionInfo = _$ControllerBaseActionController.startAction();
    try {
      return super.increment();
    } finally {
      _$ControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void mudarPaginaHormonios() {
    final _$actionInfo = _$ControllerBaseActionController.startAction();
    try {
      return super.mudarPaginaHormonios();
    } finally {
      _$ControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic mudarTexto(String textNovo) {
    final _$actionInfo = _$ControllerBaseActionController.startAction();
    try {
      return super.mudarTexto(textNovo);
    } finally {
      _$ControllerBaseActionController.endAction(_$actionInfo);
    }
  }
}

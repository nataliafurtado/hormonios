// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lista_homonios_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ListaHomoniosController on _ListaHomoniosBase, Store {
  final _$medicamentosListaAtom =
      Atom(name: '_ListaHomoniosBase.medicamentosLista');

  @override
  List<Medicamento> get medicamentosLista {
    _$medicamentosListaAtom.context.enforceReadPolicy(_$medicamentosListaAtom);
    _$medicamentosListaAtom.reportObserved();
    return super.medicamentosLista;
  }

  @override
  set medicamentosLista(List<Medicamento> value) {
    _$medicamentosListaAtom.context.conditionallyRunInAction(() {
      super.medicamentosLista = value;
      _$medicamentosListaAtom.reportChanged();
    }, _$medicamentosListaAtom, name: '${_$medicamentosListaAtom.name}_set');
  }

  final _$medicamentosAtom = Atom(name: '_ListaHomoniosBase.medicamentos');

  @override
  Medicamento get medicamentos {
    _$medicamentosAtom.context.enforceReadPolicy(_$medicamentosAtom);
    _$medicamentosAtom.reportObserved();
    return super.medicamentos;
  }

  @override
  set medicamentos(Medicamento value) {
    _$medicamentosAtom.context.conditionallyRunInAction(() {
      super.medicamentos = value;
      _$medicamentosAtom.reportChanged();
    }, _$medicamentosAtom, name: '${_$medicamentosAtom.name}_set');
  }

  final _$getMedicamentosAsyncAction = AsyncAction('getMedicamentos');

  @override
  Future<dynamic> getMedicamentos() {
    return _$getMedicamentosAsyncAction.run(() => super.getMedicamentos());
  }

  final _$getMedicamentoAsyncAction = AsyncAction('getMedicamento');

  @override
  Future<dynamic> getMedicamento(int i) {
    return _$getMedicamentoAsyncAction.run(() => super.getMedicamento(i));
  }

  final _$_ListaHomoniosBaseActionController =
      ActionController(name: '_ListaHomoniosBase');

  @override
  void increment() {
    final _$actionInfo = _$_ListaHomoniosBaseActionController.startAction();
    try {
      return super.increment();
    } finally {
      _$_ListaHomoniosBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String carregaTituloDaLista(Medicamento med) {
    final _$actionInfo = _$_ListaHomoniosBaseActionController.startAction();
    try {
      return super.carregaTituloDaLista(med);
    } finally {
      _$_ListaHomoniosBaseActionController.endAction(_$actionInfo);
    }
  }
}

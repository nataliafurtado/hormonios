// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calendario_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CalendarioController on _CalendarioBase, Store {
  final _$rrAtom = Atom(name: '_CalendarioBase.rr');

  @override
  int get rr {
    _$rrAtom.context.enforceReadPolicy(_$rrAtom);
    _$rrAtom.reportObserved();
    return super.rr;
  }

  @override
  set rr(int value) {
    _$rrAtom.context.conditionallyRunInAction(() {
      super.rr = value;
      _$rrAtom.reportChanged();
    }, _$rrAtom, name: '${_$rrAtom.name}_set');
  }

  final _$eventsAtom = Atom(name: '_CalendarioBase.events');

  @override
  Map<DateTime, List> get events {
    _$eventsAtom.context.enforceReadPolicy(_$eventsAtom);
    _$eventsAtom.reportObserved();
    return super.events;
  }

  @override
  set events(Map<DateTime, List> value) {
    _$eventsAtom.context.conditionallyRunInAction(() {
      super.events = value;
      _$eventsAtom.reportChanged();
    }, _$eventsAtom, name: '${_$eventsAtom.name}_set');
  }

  final _$medicamentosListaAtom =
      Atom(name: '_CalendarioBase.medicamentosLista');

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

  final _$carregarCalendarioAsyncAction = AsyncAction('carregarCalendario');

  @override
  Future<void> carregarCalendario() {
    return _$carregarCalendarioAsyncAction
        .run(() => super.carregarCalendario());
  }

  final _$getMedicamentosAsyncAction = AsyncAction('getMedicamentos');

  @override
  Future<dynamic> getMedicamentos() {
    return _$getMedicamentosAsyncAction.run(() => super.getMedicamentos());
  }

  final _$_CalendarioBaseActionController =
      ActionController(name: '_CalendarioBase');

  @override
  void incremet() {
    final _$actionInfo = _$_CalendarioBaseActionController.startAction();
    try {
      return super.incremet();
    } finally {
      _$_CalendarioBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _carregaEventos() {
    final _$actionInfo = _$_CalendarioBaseActionController.startAction();
    try {
      return super._carregaEventos();
    } finally {
      _$_CalendarioBaseActionController.endAction(_$actionInfo);
    }
  }
}

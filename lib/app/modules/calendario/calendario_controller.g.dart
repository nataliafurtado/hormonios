// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calendario_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CalendarioController on _CalendarioBase, Store {
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

  final _$calendarioSemanaAtom = Atom(name: '_CalendarioBase.calendarioSemana');

  @override
  CalendarioSemana get calendarioSemana {
    _$calendarioSemanaAtom.context.enforceReadPolicy(_$calendarioSemanaAtom);
    _$calendarioSemanaAtom.reportObserved();
    return super.calendarioSemana;
  }

  @override
  set calendarioSemana(CalendarioSemana value) {
    _$calendarioSemanaAtom.context.conditionallyRunInAction(() {
      super.calendarioSemana = value;
      _$calendarioSemanaAtom.reportChanged();
    }, _$calendarioSemanaAtom, name: '${_$calendarioSemanaAtom.name}_set');
  }

  final _$carregarCalendarioAsyncAction = AsyncAction('carregarCalendario');

  @override
  Future<void> carregarCalendario(DateTime data) {
    return _$carregarCalendarioAsyncAction
        .run(() => super.carregarCalendario(data));
  }

  final _$getMedicamentosAsyncAction = AsyncAction('getMedicamentos');

  @override
  Future<dynamic> getMedicamentos() {
    return _$getMedicamentosAsyncAction.run(() => super.getMedicamentos());
  }
}

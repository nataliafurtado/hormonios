// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tomarmedicamento_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TomarmedicamentoController on _TomarmedicamentoControllerBase, Store {
  final _$avisoStatusAtom =
      Atom(name: '_TomarmedicamentoControllerBase.avisoStatus');

  @override
  AvisoStatus get avisoStatus {
    _$avisoStatusAtom.context.enforceReadPolicy(_$avisoStatusAtom);
    _$avisoStatusAtom.reportObserved();
    return super.avisoStatus;
  }

  @override
  set avisoStatus(AvisoStatus value) {
    _$avisoStatusAtom.context.conditionallyRunInAction(() {
      super.avisoStatus = value;
      _$avisoStatusAtom.reportChanged();
    }, _$avisoStatusAtom, name: '${_$avisoStatusAtom.name}_set');
  }

  final _$notificacaoAtom =
      Atom(name: '_TomarmedicamentoControllerBase.notificacao');

  @override
  Notificacao get notificacao {
    _$notificacaoAtom.context.enforceReadPolicy(_$notificacaoAtom);
    _$notificacaoAtom.reportObserved();
    return super.notificacao;
  }

  @override
  set notificacao(Notificacao value) {
    _$notificacaoAtom.context.conditionallyRunInAction(() {
      super.notificacao = value;
      _$notificacaoAtom.reportChanged();
    }, _$notificacaoAtom, name: '${_$notificacaoAtom.name}_set');
  }

  final _$carregaStatusAvisoAsyncAction = AsyncAction('carregaStatusAviso');

  @override
  Future<void> carregaStatusAviso(String id) {
    return _$carregaStatusAvisoAsyncAction
        .run(() => super.carregaStatusAviso(id));
  }

  final _$adiarAsyncAction = AsyncAction('adiar');

  @override
  Future adiar(DateTime novaHora, AvisoStatus avisoStatusPassado) {
    return _$adiarAsyncAction
        .run(() => super.adiar(novaHora, avisoStatusPassado));
  }

  final _$_TomarmedicamentoControllerBaseActionController =
      ActionController(name: '_TomarmedicamentoControllerBase');

  @override
  dynamic pular(int indexPularEnum, AvisoStatus avisoStatusPassado) {
    final _$actionInfo =
        _$_TomarmedicamentoControllerBaseActionController.startAction();
    try {
      return super.pular(indexPularEnum, avisoStatusPassado);
    } finally {
      _$_TomarmedicamentoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic tomar(DateTime hora, AvisoStatus avisoStatusPassado) {
    final _$actionInfo =
        _$_TomarmedicamentoControllerBaseActionController.startAction();
    try {
      return super.tomar(hora, avisoStatusPassado);
    } finally {
      _$_TomarmedicamentoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic tomarTodos(DateTime hora) {
    final _$actionInfo =
        _$_TomarmedicamentoControllerBaseActionController.startAction();
    try {
      return super.tomarTodos(hora);
    } finally {
      _$_TomarmedicamentoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic pularTodos(int indexPularEnum) {
    final _$actionInfo =
        _$_TomarmedicamentoControllerBaseActionController.startAction();
    try {
      return super.pularTodos(indexPularEnum);
    } finally {
      _$_TomarmedicamentoControllerBaseActionController.endAction(_$actionInfo);
    }
  }
}

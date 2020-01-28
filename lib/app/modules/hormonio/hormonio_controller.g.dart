// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hormonio_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HormonioController on _HormonioBase, Store {
  Computed<String> _$carregaObservacoesComputed;

  @override
  String get carregaObservacoes => (_$carregaObservacoesComputed ??=
          Computed<String>(() => super.carregaObservacoes))
      .value;
  Computed<String> _$carregardosagemComputed;

  @override
  String get carregardosagem => (_$carregardosagemComputed ??=
          Computed<String>(() => super.carregardosagem))
      .value;

  final _$novoMedicamentroAtom = Atom(name: '_HormonioBase.novoMedicamentro');

  @override
  Medicamento get novoMedicamentro {
    _$novoMedicamentroAtom.context.enforceReadPolicy(_$novoMedicamentroAtom);
    _$novoMedicamentroAtom.reportObserved();
    return super.novoMedicamentro;
  }

  @override
  set novoMedicamentro(Medicamento value) {
    _$novoMedicamentroAtom.context.conditionallyRunInAction(() {
      super.novoMedicamentro = value;
      _$novoMedicamentroAtom.reportChanged();
    }, _$novoMedicamentroAtom, name: '${_$novoMedicamentroAtom.name}_set');
  }

  final _$quantidadeDsagemAtom = Atom(name: '_HormonioBase.quantidadeDsagem');

  @override
  int get quantidadeDsagem {
    _$quantidadeDsagemAtom.context.enforceReadPolicy(_$quantidadeDsagemAtom);
    _$quantidadeDsagemAtom.reportObserved();
    return super.quantidadeDsagem;
  }

  @override
  set quantidadeDsagem(int value) {
    _$quantidadeDsagemAtom.context.conditionallyRunInAction(() {
      super.quantidadeDsagem = value;
      _$quantidadeDsagemAtom.reportChanged();
    }, _$quantidadeDsagemAtom, name: '${_$quantidadeDsagemAtom.name}_set');
  }

  final _$medidaDOsagemAtom = Atom(name: '_HormonioBase.medidaDOsagem');

  @override
  String get medidaDOsagem {
    _$medidaDOsagemAtom.context.enforceReadPolicy(_$medidaDOsagemAtom);
    _$medidaDOsagemAtom.reportObserved();
    return super.medidaDOsagem;
  }

  @override
  set medidaDOsagem(String value) {
    _$medidaDOsagemAtom.context.conditionallyRunInAction(() {
      super.medidaDOsagem = value;
      _$medidaDOsagemAtom.reportChanged();
    }, _$medidaDOsagemAtom, name: '${_$medidaDOsagemAtom.name}_set');
  }

  final _$observacaoSelecionadaAtom =
      Atom(name: '_HormonioBase.observacaoSelecionada');

  @override
  String get observacaoSelecionada {
    _$observacaoSelecionadaAtom.context
        .enforceReadPolicy(_$observacaoSelecionadaAtom);
    _$observacaoSelecionadaAtom.reportObserved();
    return super.observacaoSelecionada;
  }

  @override
  set observacaoSelecionada(String value) {
    _$observacaoSelecionadaAtom.context.conditionallyRunInAction(() {
      super.observacaoSelecionada = value;
      _$observacaoSelecionadaAtom.reportChanged();
    }, _$observacaoSelecionadaAtom,
        name: '${_$observacaoSelecionadaAtom.name}_set');
  }

  final _$observacaoEscritaAtom = Atom(name: '_HormonioBase.observacaoEscrita');

  @override
  String get observacaoEscrita {
    _$observacaoEscritaAtom.context.enforceReadPolicy(_$observacaoEscritaAtom);
    _$observacaoEscritaAtom.reportObserved();
    return super.observacaoEscrita;
  }

  @override
  set observacaoEscrita(String value) {
    _$observacaoEscritaAtom.context.conditionallyRunInAction(() {
      super.observacaoEscrita = value;
      _$observacaoEscritaAtom.reportChanged();
    }, _$observacaoEscritaAtom, name: '${_$observacaoEscritaAtom.name}_set');
  }

  final _$_HormonioBaseActionController =
      ActionController(name: '_HormonioBase');

  @override
  void increment() {
    final _$actionInfo = _$_HormonioBaseActionController.startAction();
    try {
      return super.increment();
    } finally {
      _$_HormonioBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic zerarDosagem() {
    final _$actionInfo = _$_HormonioBaseActionController.startAction();
    try {
      return super.zerarDosagem();
    } finally {
      _$_HormonioBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic zerarObservacao() {
    final _$actionInfo = _$_HormonioBaseActionController.startAction();
    try {
      return super.zerarObservacao();
    } finally {
      _$_HormonioBaseActionController.endAction(_$actionInfo);
    }
  }
}

enum PularEnum {
  medNaoEstaProximo,
  esqueci,
  estavaOcupada,
  naoPrecisaEssaDose,
  reacoesNegativas,
  paraEconomizar,
  outros
}

// static List<String> listTextButtons = [
//   'Medicamento não esta próximo',
//   'Esqueci',
//   'Estava ocupada',
//   'Não precisa tomar essa dose',
//   'Reações negativas / Efeito colateral',
//   'Para economizar',
//   'Outros',
// ];

class PularEnumConverter {
  String converter(PularEnum hh) {
    // print(hh);
    // print('hh');
    if (hh == PularEnum.medNaoEstaProximo) {
      return "Medicamento não esta próximo";
    } else if (hh == PularEnum.esqueci) {
      return "Esqueci";
    } else if (hh == PularEnum.estavaOcupada) {
      return "Estava ocupada";
    } else if (hh == PularEnum.naoPrecisaEssaDose) {
      return "Não precisa tomar essa dose";
    } else if (hh == PularEnum.reacoesNegativas) {
      return "Reações negativas / Efeito colateral";
    } else if (hh == PularEnum.paraEconomizar) {
      return "Para economizar";
    } else if (hh == PularEnum.outros) {
      return "Outros";
    }
    return 'NA';
  }

  PularEnum enumConverter(String enumString) {
    if (enumString == 'PularEnum.medNaoEstaProximo') {
      return PularEnum.medNaoEstaProximo;
    } else if (enumString == 'PularEnum.esqueci') {
      return PularEnum.esqueci;
    } else if (enumString == 'PularEnum.estavaOcupada') {
      return PularEnum.estavaOcupada;
    } else if (enumString == 'PularEnum.naoPrecisaEssaDose') {
      return PularEnum.naoPrecisaEssaDose;
    } else if (enumString == 'PularEnum.reacoesNegativas') {
      return PularEnum.reacoesNegativas;
    } else if (enumString == 'PularEnum.paraEconomizar') {
      return PularEnum.paraEconomizar;
    } else if (enumString == 'PularEnum.outros') {
      return PularEnum.outros;
    }

    return PularEnum.outros;
  }

//  static List<String> listaDePularEnums (){
// PularEnum.values
//  }
// static List<String> listTextButtons = [
//   'Medicamento não esta próximo',
//   'Esqueci',
//   'Estava ocupada',
//   'Não precisa tomar essa dose',
//   'Reações negativas / Efeito colateral',
//   'Para economizar',
//   'Outros',
// ];

}

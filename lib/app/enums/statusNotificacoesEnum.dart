enum StatusNotificacoesEnum { enviada, aberta, adiada, cancelada }

class StatusNotificacoesEnumConverter {
  String converter(StatusNotificacoesEnum hh) {
    // print(hh);
    // print('hh');
    if (hh == StatusNotificacoesEnum.enviada) {
      return "ENVIADA";
    } else if (hh == StatusNotificacoesEnum.aberta) {
      return "ABERTA";
    } else if (hh == StatusNotificacoesEnum.adiada) {
      return "ADIADA";
    } else if (hh == StatusNotificacoesEnum.cancelada) {
      return "CANCELADA";
    }

    return 'NA';
  }

  StatusNotificacoesEnum enumConverter(String enumString) {
    if (enumString == 'StatusNotificacoesEnum.enviada') {
      return StatusNotificacoesEnum.enviada;
    } else if (enumString == 'StatusNotificacoesEnum.aberta') {
      return StatusNotificacoesEnum.aberta;
    } else if (enumString == 'StatusNotificacoesEnum.adiada') {
      return StatusNotificacoesEnum.adiada;
    } else if (enumString == 'StatusNotificacoesEnum.cancelada') {
      return StatusNotificacoesEnum.cancelada;
    }

    return StatusNotificacoesEnum.enviada;
  }
}

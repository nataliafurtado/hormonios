enum StatusAvisoEnum { antesDeAvisar, cancelado, ingerido, atrasado }

class StatusAvisoEnumConverter {
  String converter(StatusAvisoEnum hh) {
    // print(hh);
    // print('hh');
    if (hh == StatusAvisoEnum.antesDeAvisar) {
      return "ANTES DE AVISAR";
    } else if (hh == StatusAvisoEnum.cancelado) {
      return "CANCELADO";
    } else if (hh == StatusAvisoEnum.ingerido) {
      return "INGERIDO";
    } else if (hh == StatusAvisoEnum.atrasado) {
      return "ATRASADO";
    }

    return 'NA';
  }

  StatusAvisoEnum enumConverter(String enumString) {
    if (enumString == 'statusAvisoEnum.antesDeAvisar') {
      return StatusAvisoEnum.antesDeAvisar;
    } else if (enumString == 'statusAvisoEnum.cancelado') {
      return StatusAvisoEnum.cancelado;
    } else if (enumString == 'statusAvisoEnum.ingerido') {
      return StatusAvisoEnum.ingerido;
    } else if (enumString == 'statusAvisoEnum.atrasado') {
      return StatusAvisoEnum.atrasado;
    }

    return StatusAvisoEnum.antesDeAvisar;
  }
}
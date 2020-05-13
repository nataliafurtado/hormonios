enum StatusAvisoEnum { antesDeAvisar, pulado, ingerido, atrasado }

class StatusAvisoEnumConverter {
  String converter(StatusAvisoEnum hh) {
    // print(hh);
    // print('hh');
    if (hh == StatusAvisoEnum.antesDeAvisar) {
      return "ANTES DE AVISAR";
    } else if (hh == StatusAvisoEnum.pulado) {
      return "PULADO";
    } else if (hh == StatusAvisoEnum.ingerido) {
      return "INGERIDO";
    } else if (hh == StatusAvisoEnum.atrasado) {
      return "ATRASADO";
    }

    return 'NA';
  }

  StatusAvisoEnum enumConverter(String enumString) {
    if (enumString == 'StatusAvisoEnum.antesDeAvisar') {
      return StatusAvisoEnum.antesDeAvisar;
    } else if (enumString == 'StatusAvisoEnum.pulado') {
      return StatusAvisoEnum.pulado;
    } else if (enumString == 'StatusAvisoEnum.ingerido') {
      return StatusAvisoEnum.ingerido;
    } else if (enumString == 'StatusAvisoEnum.atrasado') {
      return StatusAvisoEnum.atrasado;
    }

    return StatusAvisoEnum.antesDeAvisar;
  }
}

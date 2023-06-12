enum School {
  ests,
  ese,
  esce,
  estb,
  ess,
  sede,
  na,
}

extension SchoolExtension on School {
  String get name {
    switch (this) {
      case School.ests:
        return 'ESTS';
      case School.ese:
        return 'ESE';
      case School.esce:
        return 'ESCE';
      case School.estb:
        return 'ESTB';
      case School.ess:
        return 'ESS';
      case School.na:
        return 'NA';
      case School.sede:
        return 'Edíficio sede';
      default:
        return '';
    }
  }
}

List<String> getSchoolNames() {
  return School.values.map((school) => school.name).toList();
}

String getComplexString(School school){
  switch(school){
    case School.sede:
      return 'Edífico Sede';
    case School.ests:
      return 'Edífico da Escola Superior de Tecnologia de Setúbal';
    case School.ese:
      return 'Edífico da Escola Superior de Educação';
    case School.esce:
      return 'Edífico da Escola Superior de Ciências Empresariais';
    case School.estb:
      return 'Edífico da Escola Superior de Tecnologia do Barreiro';
    case School.ess:
      return 'Edífico da Escola Superior de Saúde';
    case School.na:
      return 'Não existe informação.';
    default:
      return 'Não existe informação.';
      
  }
}

String getCampus(School school){
  switch(school){
    case School.sede:
      return 'Campus do IPS Estefanilha';
    case School.na:
      return 'Não existe informação';
    case School.estb:
      return 'Campus do Barreiro';
    default:
      return 'Campus de Setúbal';
  }
}

School getSchool(String string) {
  switch (string) {
    case "School.ese":
      return School.ese;
    case "School.ests":
      return School.ests;
    case "School.estb":
      return School.estb;
    case "School.esce":
      return School.esce;
    case "School.ess":
      return School.ess;
    case "School.sede":
      return School.sede;
    default:
      return School.na;
  }
}

School getSchoolByName(String string) {
  switch (string) {
    case "ESE":
      return School.ese;
    case "ESTS":
      return School.ests;
    case "ESTB":
      return School.estb;
    case "ESCE":
      return School.esce;
    case "ESS":
      return School.ess;
    case "Edíficio sede":
      return School.sede;
    default:
      return School.na;
  }
}

enum School {
  ests,
  ese,
  esce,
  estb,
  ess,
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
      default:
        return '';
    }
  }
}

List<String> getSchoolNames() {
  return School.values.map((school) => school.name).toList();
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
    default:
      return School.na;
  }
}

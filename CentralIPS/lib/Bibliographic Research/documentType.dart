enum DocumentType {
  analitico,
  ficcao,
  monografia,
  relatorio,
  teses,
}

extension DocumentTypeExtension on DocumentType {
  String get name {
    switch (this) {
      case DocumentType.analitico:
        return "Analítico";
      case DocumentType.ficcao:
        return "Ficção";
      case DocumentType.monografia:
        return "Monografia";
      case DocumentType.relatorio:
        return "Relatório";
      case DocumentType.teses:
        return "Teses";
      default:
        return '';
    }
  }

  String displayString() => name;
  
}
List<String> getDocumentTypeNames() {
  return DocumentType.values.map((documentType) => documentType.name).toList();
}

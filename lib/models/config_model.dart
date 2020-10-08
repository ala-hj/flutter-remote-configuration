import 'package:cloud_firestore/cloud_firestore.dart';

class ConfigurationModel {
  final String docID;
  final String version;
  final bool darkTheme;
  final String colorHexa;
  final int gridColumn;

  ConfigurationModel(
      {this.docID,
      this.version,
      this.darkTheme,
      this.colorHexa,
      this.gridColumn});

  factory ConfigurationModel.fromDocumentSnapshot(DocumentSnapshot event) {
    return ConfigurationModel(
        version: event.data()['version'],
        darkTheme: event.data()['darkTheme'],
        colorHexa: event.data()['colorHexa'],
        gridColumn: event.data()['gridColumn']);
  }
}

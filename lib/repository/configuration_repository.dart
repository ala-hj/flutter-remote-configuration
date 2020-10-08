import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:remote_application/models/config_model.dart';

class ConfigRepository extends GetxService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
// Nice initial the function before the widgets draw
  init<ConfigRepository>() {
    configStream();
    return this;
  }

// stream function that returns ConfigurationModel by getting the event as map and returns an object.
  Stream<ConfigurationModel> configStream() {
    return _firestore
        .collection('config')
        .doc('UI_application')
        .snapshots()
        .map((event) => ConfigurationModel.fromDocumentSnapshot(event));
  }
}

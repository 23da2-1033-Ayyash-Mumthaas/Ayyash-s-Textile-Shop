import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:textile_mobile_app/core/constants/firestore_paths.dart';
import 'package:textile_mobile_app/data/models/app_settings_model.dart';
import 'package:textile_mobile_app/data/models/offer_model.dart';

class FirestoreSettingsDataSource {
  FirestoreSettingsDataSource(this._db);

  final FirebaseFirestore _db;

  Stream<AppSettingsModel> watchAppSettings() {
    return _db
        .collection(FirestorePaths.settings)
        .doc(FirestorePaths.settingsAppDoc)
        .snapshots()
        .map((doc) {
          if (!doc.exists || doc.data() == null) {
            return const AppSettingsModel();
          }
          return AppSettingsModel.fromJson({...doc.data()!, 'id': doc.id});
        });
  }

  Stream<List<OfferModel>> watchActiveOffers() {
    return _db
        .collection(FirestorePaths.offers)
        .where('isActive', isEqualTo: true)
        .snapshots()
        .map(
          (snap) => snap.docs
              .map((d) => OfferModel.fromJson({...d.data(), 'id': d.id}))
              .toList(),
        );
  }

  Stream<List<OfferModel>> watchAllOffers() {
    return _db
        .collection(FirestorePaths.offers)
        .orderBy('isActive', descending: true)
        .snapshots()
        .map(
          (snap) => snap.docs
              .map((d) => OfferModel.fromJson({...d.data(), 'id': d.id}))
              .toList(),
        );
  }

  Future<void> upsertOffer(OfferModel offer) async {
    final data = offer.toJson()
      ..remove('id')
      ..remove('startsAt')
      ..remove('endsAt');
    await _db
        .collection(FirestorePaths.offers)
        .doc(offer.id)
        .set(data, SetOptions(merge: true));
  }
}

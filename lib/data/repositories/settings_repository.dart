import 'package:textile_mobile_app/data/datasources/firestore_settings_datasource.dart';
import 'package:textile_mobile_app/data/models/app_settings_model.dart';
import 'package:textile_mobile_app/data/models/offer_model.dart';

class SettingsRepository {
  SettingsRepository(this._dataSource);

  final FirestoreSettingsDataSource _dataSource;

  Stream<AppSettingsModel> watchAppSettings() => _dataSource.watchAppSettings();

  Stream<List<OfferModel>> watchActiveOffers() =>
      _dataSource.watchActiveOffers();

  Stream<List<OfferModel>> watchAllOffers() => _dataSource.watchAllOffers();

  Future<void> upsertOffer(OfferModel offer) => _dataSource.upsertOffer(offer);
}

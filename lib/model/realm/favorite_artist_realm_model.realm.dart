// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_artist_realm_model.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
class FavoriteArtistRealmModel extends _FavoriteArtistRealmModel
    with RealmEntity, RealmObjectBase, RealmObject {
  FavoriteArtistRealmModel(
    String artistId,
    int order,
  ) {
    RealmObjectBase.set(this, 'artistId', artistId);
    RealmObjectBase.set(this, 'order', order);
  }

  FavoriteArtistRealmModel._();

  @override
  String get artistId =>
      RealmObjectBase.get<String>(this, 'artistId') as String;
  @override
  set artistId(String value) => RealmObjectBase.set(this, 'artistId', value);

  @override
  int get order => RealmObjectBase.get<int>(this, 'order') as int;
  @override
  set order(int value) => RealmObjectBase.set(this, 'order', value);

  @override
  Stream<RealmObjectChanges<FavoriteArtistRealmModel>> get changes =>
      RealmObjectBase.getChanges<FavoriteArtistRealmModel>(this);

  @override
  Stream<RealmObjectChanges<FavoriteArtistRealmModel>> changesFor(
          [List<String>? keyPaths]) =>
      RealmObjectBase.getChangesFor<FavoriteArtistRealmModel>(this, keyPaths);

  @override
  FavoriteArtistRealmModel freeze() =>
      RealmObjectBase.freezeObject<FavoriteArtistRealmModel>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      'artistId': artistId.toEJson(),
      'order': order.toEJson(),
    };
  }

  static EJsonValue _toEJson(FavoriteArtistRealmModel value) => value.toEJson();
  static FavoriteArtistRealmModel _fromEJson(EJsonValue ejson) {
    if (ejson is! Map<String, dynamic>) return raiseInvalidEJson(ejson);
    return switch (ejson) {
      {
        'artistId': EJsonValue artistId,
        'order': EJsonValue order,
      } =>
        FavoriteArtistRealmModel(
          fromEJson(artistId),
          fromEJson(order),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(FavoriteArtistRealmModel._);
    register(_toEJson, _fromEJson);
    return const SchemaObject(ObjectType.realmObject, FavoriteArtistRealmModel,
        'FavoriteArtistRealmModel', [
      SchemaProperty('artistId', RealmPropertyType.string, primaryKey: true),
      SchemaProperty('order', RealmPropertyType.int),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}

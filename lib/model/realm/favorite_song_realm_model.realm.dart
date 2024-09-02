// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_song_realm_model.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
class FavoriteSongRealmModel extends _FavoriteSongRealmModel
    with RealmEntity, RealmObjectBase, RealmObject {
  FavoriteSongRealmModel(
    String songId,
    int order,
  ) {
    RealmObjectBase.set(this, 'songId', songId);
    RealmObjectBase.set(this, 'order', order);
  }

  FavoriteSongRealmModel._();

  @override
  String get songId => RealmObjectBase.get<String>(this, 'songId') as String;
  @override
  set songId(String value) => RealmObjectBase.set(this, 'songId', value);

  @override
  int get order => RealmObjectBase.get<int>(this, 'order') as int;
  @override
  set order(int value) => RealmObjectBase.set(this, 'order', value);

  @override
  Stream<RealmObjectChanges<FavoriteSongRealmModel>> get changes =>
      RealmObjectBase.getChanges<FavoriteSongRealmModel>(this);

  @override
  Stream<RealmObjectChanges<FavoriteSongRealmModel>> changesFor(
          [List<String>? keyPaths]) =>
      RealmObjectBase.getChangesFor<FavoriteSongRealmModel>(this, keyPaths);

  @override
  FavoriteSongRealmModel freeze() =>
      RealmObjectBase.freezeObject<FavoriteSongRealmModel>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      'songId': songId.toEJson(),
      'order': order.toEJson(),
    };
  }

  static EJsonValue _toEJson(FavoriteSongRealmModel value) => value.toEJson();
  static FavoriteSongRealmModel _fromEJson(EJsonValue ejson) {
    if (ejson is! Map<String, dynamic>) return raiseInvalidEJson(ejson);
    return switch (ejson) {
      {
        'songId': EJsonValue songId,
        'order': EJsonValue order,
      } =>
        FavoriteSongRealmModel(
          fromEJson(songId),
          fromEJson(order),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(FavoriteSongRealmModel._);
    register(_toEJson, _fromEJson);
    return const SchemaObject(ObjectType.realmObject, FavoriteSongRealmModel,
        'FavoriteSongRealmModel', [
      SchemaProperty('songId', RealmPropertyType.string, primaryKey: true),
      SchemaProperty('order', RealmPropertyType.int),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}

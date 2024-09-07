// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'playlist_realm_model.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
class PlaylistRealmModel extends _PlaylistRealmModel
    with RealmEntity, RealmObjectBase, RealmObject {
  PlaylistRealmModel(
    ObjectId id,
    String name,
    int order, {
    Iterable<String> songIds = const [],
  }) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'name', name);
    RealmObjectBase.set(this, 'order', order);
    RealmObjectBase.set<RealmList<String>>(
        this, 'songIds', RealmList<String>(songIds));
  }

  PlaylistRealmModel._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, 'id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, 'id', value);

  @override
  String get name => RealmObjectBase.get<String>(this, 'name') as String;
  @override
  set name(String value) => RealmObjectBase.set(this, 'name', value);

  @override
  int get order => RealmObjectBase.get<int>(this, 'order') as int;
  @override
  set order(int value) => RealmObjectBase.set(this, 'order', value);

  @override
  RealmList<String> get songIds =>
      RealmObjectBase.get<String>(this, 'songIds') as RealmList<String>;
  @override
  set songIds(covariant RealmList<String> value) =>
      throw RealmUnsupportedSetError();

  @override
  Stream<RealmObjectChanges<PlaylistRealmModel>> get changes =>
      RealmObjectBase.getChanges<PlaylistRealmModel>(this);

  @override
  Stream<RealmObjectChanges<PlaylistRealmModel>> changesFor(
          [List<String>? keyPaths]) =>
      RealmObjectBase.getChangesFor<PlaylistRealmModel>(this, keyPaths);

  @override
  PlaylistRealmModel freeze() =>
      RealmObjectBase.freezeObject<PlaylistRealmModel>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      'id': id.toEJson(),
      'name': name.toEJson(),
      'order': order.toEJson(),
      'songIds': songIds.toEJson(),
    };
  }

  static EJsonValue _toEJson(PlaylistRealmModel value) => value.toEJson();
  static PlaylistRealmModel _fromEJson(EJsonValue ejson) {
    if (ejson is! Map<String, dynamic>) return raiseInvalidEJson(ejson);
    return switch (ejson) {
      {
        'id': EJsonValue id,
        'name': EJsonValue name,
        'order': EJsonValue order,
      } =>
        PlaylistRealmModel(
          fromEJson(id),
          fromEJson(name),
          fromEJson(order),
          songIds: fromEJson(ejson['songIds']),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(PlaylistRealmModel._);
    register(_toEJson, _fromEJson);
    return const SchemaObject(
        ObjectType.realmObject, PlaylistRealmModel, 'PlaylistRealmModel', [
      SchemaProperty('id', RealmPropertyType.objectid, primaryKey: true),
      SchemaProperty('name', RealmPropertyType.string),
      SchemaProperty('order', RealmPropertyType.int),
      SchemaProperty('songIds', RealmPropertyType.string,
          collectionType: RealmCollectionType.list),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}

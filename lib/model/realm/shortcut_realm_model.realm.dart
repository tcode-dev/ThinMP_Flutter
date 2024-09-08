// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shortcut_realm_model.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
class ShortcutRealmModel extends _ShortcutRealmModel
    with RealmEntity, RealmObjectBase, RealmObject {
  ShortcutRealmModel(
    ObjectId id,
    String itemId,
    int type,
    int order,
  ) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'itemId', itemId);
    RealmObjectBase.set(this, 'type', type);
    RealmObjectBase.set(this, 'order', order);
  }

  ShortcutRealmModel._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, 'id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, 'id', value);

  @override
  String get itemId => RealmObjectBase.get<String>(this, 'itemId') as String;
  @override
  set itemId(String value) => RealmObjectBase.set(this, 'itemId', value);

  @override
  int get type => RealmObjectBase.get<int>(this, 'type') as int;
  @override
  set type(int value) => RealmObjectBase.set(this, 'type', value);

  @override
  int get order => RealmObjectBase.get<int>(this, 'order') as int;
  @override
  set order(int value) => RealmObjectBase.set(this, 'order', value);

  @override
  Stream<RealmObjectChanges<ShortcutRealmModel>> get changes =>
      RealmObjectBase.getChanges<ShortcutRealmModel>(this);

  @override
  Stream<RealmObjectChanges<ShortcutRealmModel>> changesFor(
          [List<String>? keyPaths]) =>
      RealmObjectBase.getChangesFor<ShortcutRealmModel>(this, keyPaths);

  @override
  ShortcutRealmModel freeze() =>
      RealmObjectBase.freezeObject<ShortcutRealmModel>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      'id': id.toEJson(),
      'itemId': itemId.toEJson(),
      'type': type.toEJson(),
      'order': order.toEJson(),
    };
  }

  static EJsonValue _toEJson(ShortcutRealmModel value) => value.toEJson();
  static ShortcutRealmModel _fromEJson(EJsonValue ejson) {
    if (ejson is! Map<String, dynamic>) return raiseInvalidEJson(ejson);
    return switch (ejson) {
      {
        'id': EJsonValue id,
        'itemId': EJsonValue itemId,
        'type': EJsonValue type,
        'order': EJsonValue order,
      } =>
        ShortcutRealmModel(
          fromEJson(id),
          fromEJson(itemId),
          fromEJson(type),
          fromEJson(order),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(ShortcutRealmModel._);
    register(_toEJson, _fromEJson);
    return const SchemaObject(
        ObjectType.realmObject, ShortcutRealmModel, 'ShortcutRealmModel', [
      SchemaProperty('id', RealmPropertyType.objectid, primaryKey: true),
      SchemaProperty('itemId', RealmPropertyType.string),
      SchemaProperty('type', RealmPropertyType.int),
      SchemaProperty('order', RealmPropertyType.int),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}

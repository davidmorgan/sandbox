// API types: generated from schema, changes when schema changes.

import 'common.dart';

List<State> pool = <State>[];
State newState() {
  if (pool.isEmpty) return State();
  return pool.removeLast();
}

void returnState(State state) {
  pool.add(state);
}

// State accumulated while parsing and wrapped with extension objects.
class State {
  String? string1;
  String? string2;
  String? string3;
  String? string4;
  String? string5;

  int? int1;

  // Nested state for nested objects.
  State? state1;
}

// Deserialization.

extension type DataExchange(State state) {
  String get name => state.string1!;
  String get displayName => state.string2!;
  String get description => state.string3!;
  String get primaryContact => state.string4!;
  String get documentation => state.string5!;
  int get listingCount => state.int1!;
  SharingEnvironmentConfig get sharingEnvironmentConfig =>
      SharingEnvironmentConfig(state.state1!);

  void dispose() => returnState(state);
}

extension type SharingEnvironmentConfig(State state) {
  String get name => state.string1!;

  void dispose() => returnState(state);
}

// Serialization.

extension type DataExchangeWriter._(JsonWriter writer) {
  DataExchangeWriter(this.writer) {
    writer.startObject();
  }
  void name(String name) => writer.writeString('name', name);
  void displayName(String displayName) =>
      writer.writeString('displayName', displayName);
  void description(String description) =>
      writer.writeString('description', description);
  void primaryContact(String primaryContact) =>
      writer.writeString('primaryContact', primaryContact);
  void documentation(String documentation) =>
      writer.writeString('documentation', documentation);
  void listingCount(int listingCount) =>
      writer.writeInt('listingCount', listingCount);
  void sharingEnvironmentConfig() =>
      writer.writeKey('sharingEnvironmentConfig');
  SharingEnvironmentConfigWriter get sharingEnvironmentConfigWriter =>
      SharingEnvironmentConfigWriter(writer);
  void done() {
    writer.endObject();
  }
}

extension type SharingEnvironmentConfigWriter._(JsonWriter writer) {
  SharingEnvironmentConfigWriter(this.writer) {
    writer.startObject();
  }
  void name(String name) => writer.writeString('name', name);
  void done() => writer.endObject();
}

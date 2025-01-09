import 'package:serialize/app_model.dart' as app;
import 'package:serialize/serializers.dart';
import 'package:test/test.dart';

void main() {
  test('deserializes', () {
    expect(
      deserialize('''{
  "name": "foo",
  "displayName": "Foo",
  "description": "very foo",
  "primaryContact": "me",
  "documentation": "TODO",
  "listingCount": 3,
  "sharingEnvironmentConfig": {
    "name": "bar"
  }
}
''').toString(),
      '\'DataExchange(\n'
      '    name: foo,\n'
      '    displayName: Foo,\n'
      '    description: very foo,\n'
      '    primaryContact: me,\n'
      '    documentation: TODO,\n'
      '    listingCount: 3,\n'
      '    sharingEnvironmentConfig: \'SharingEnvironmentConfig(\n'
      '    name: bar,\n'
      '))',
    );
  });

  test('serializes', () {
    expect(
      serialize(
        app.DataExchange(
          name: 'foo',
          displayName: 'Foo',
          description: 'very foo',
          primaryContact: 'me',
          documentation: 'TODO',
          listingCount: 3,
          sharingEnvironmentConfig: app.SharingEnvironmentConfig(name: 'bar'),
        ),
      ),
      '{"name":"foo","displayName":"Foo","description":"very foo",'
      '"primaryContact":"me","documentation":"TODO",'
      '"listingCount":3,"sharingEnvironmentConfig":{"name":"bar"}}',
    );
  });
}

import 'api_model.dart' as api;
import 'api_serializers.dart' as api_serializers;
import 'app_model.dart' as app;
import 'common.dart';

app.DataExchange deserialize(String string) {
  return deserializeDataExchange(api_serializers.deserialize(string));
}

String serialize(app.DataExchange dataExchange) {
  final buffer = StringBuffer();
  final writer = JsonWriter(buffer);
  serializeDataExchange(dataExchange, api.DataExchangeWriter(writer));
  return buffer.toString();
}

app.DataExchange deserializeDataExchange(api.DataExchange dataExchange) {
  try {
    return app.DataExchange(
      name: dataExchange.name,
      displayName: dataExchange.displayName,
      description: dataExchange.description,
      primaryContact: dataExchange.primaryContact,
      documentation: dataExchange.documentation,
      listingCount: dataExchange.listingCount,
      sharingEnvironmentConfig: deserializeSharingEnvironmentConfig(
        dataExchange.sharingEnvironmentConfig,
      ),
    );
  } finally {
    dataExchange.dispose();
  }
}

void serializeDataExchange(
  app.DataExchange dataExchange,
  api.DataExchangeWriter writer,
) {
  writer.name(dataExchange.name);
  writer.displayName(dataExchange.displayName);
  writer.description(dataExchange.description);
  writer.primaryContact(dataExchange.primaryContact);
  writer.documentation(dataExchange.documentation);
  writer.listingCount(dataExchange.listingCount);
  writer.sharingEnvironmentConfig();
  serializeSharingEnvironmentConfig(
    dataExchange.sharingEnvironmentConfig,
    writer.sharingEnvironmentConfigWriter,
  );
  writer.done();
}

app.SharingEnvironmentConfig deserializeSharingEnvironmentConfig(
  api.SharingEnvironmentConfig sharingEnvironmentConfig,
) {
  try {
    return app.SharingEnvironmentConfig(name: sharingEnvironmentConfig.name);
  } finally {
    sharingEnvironmentConfig.dispose();
  }
}

void serializeSharingEnvironmentConfig(
  app.SharingEnvironmentConfig sharingEnvironmentConfig,
  api.SharingEnvironmentConfigWriter writer,
) {
  writer.name(sharingEnvironmentConfig.name);
  writer.done();
}

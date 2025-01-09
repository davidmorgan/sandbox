import 'dart:convert';

import 'api_model.dart' as api;

api.DataExchange deserialize(String string) {
  // TODO(davidmorgan): walk the data, don't decode up front.
  final data = json.decode(string) as Map<String, Object?>;
  return api.DataExchange(_decodeDataExchange(data));
}

api.State _decodeDataExchange(Map<String, Object?> data) {
  final state = api.newState();
  state.string1 = data['name'] as String?;
  state.string2 = data['displayName'] as String?;
  state.string3 = data['description'] as String?;
  state.string4 = data['primaryContact'] as String?;
  state.string5 = data['documentation'] as String?;
  state.int1 = data['listingCount'] as int?;
  state.state1 = _decodeSharingEnvironmentConfig(
    data['sharingEnvironmentConfig'] as Map<String, Object?>?,
  );
  return state;
}

api.State? _decodeSharingEnvironmentConfig(Map<String, Object?>? data) {
  if (data == null) return null;
  final state = api.newState();
  state.string1 = data['name'] as String?;
  return state;
}

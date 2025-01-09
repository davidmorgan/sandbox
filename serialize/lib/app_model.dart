// Value types: generated once from starting schema, then owned by the app author.

class DataExchange {
  final String name;
  final String displayName;
  final String description;
  final String primaryContact;
  final String documentation;
  final int listingCount;
  final SharingEnvironmentConfig sharingEnvironmentConfig;

  DataExchange({
    required this.name,
    required this.displayName,
    required this.description,
    required this.primaryContact,
    required this.documentation,
    required this.listingCount,
    required this.sharingEnvironmentConfig,
  });

  @override
  String toString() => ''''DataExchange(
    name: $name,
    displayName: $displayName,
    description: $description,
    primaryContact: $primaryContact,
    documentation: $documentation,
    listingCount: $listingCount,
    sharingEnvironmentConfig: $sharingEnvironmentConfig)''';
}

class SharingEnvironmentConfig {
  final String name;

  SharingEnvironmentConfig({required this.name});

  @override
  String toString() => ''''SharingEnvironmentConfig(
    name: $name,
)''';
}

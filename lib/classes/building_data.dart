class BuildingData {
  int buildingId;
  String city;
  String country;
  String postalCode;
  String state;
  String streetName;
  String streetNumber;

  BuildingData({
    required this.buildingId,
    required this.city,
    required this.country,
    required this.postalCode,
    required this.state,
    required this.streetName,
    required this.streetNumber,
  });

  factory BuildingData.fromJson(Map<String, dynamic> json) {
    return BuildingData(
      buildingId: json['buildingId'] as int,
      city: json['city'] as String,
      country: json['country'] as String,
      postalCode: json['postalCode'] as String,
      state: json['state'] as String,
      streetName: json['streetName'] as String,
      streetNumber: json['streetNumber'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'buildingId': buildingId,
      'city': city,
      'country': country,
      'postalCode': postalCode,
      'state': state,
      'streetName': streetName,
      'streetNumber': streetNumber,
    };
  }
}

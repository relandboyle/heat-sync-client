class BuildingData {
  String buildingId;
  String city;
  String country;
  String postalCode;
  String state;
  String streetName;
  String streetNumber;
  String fullAddress; // New field

  BuildingData({
    required this.buildingId,
    required this.city,
    required this.country,
    required this.postalCode,
    required this.state,
    required this.streetName,
    required this.streetNumber,
    required this.fullAddress,
  });

  factory BuildingData.fromJson(Map<String, dynamic> json) {
    return BuildingData(
      buildingId: json['buildingId'] as String,
      city: json['city'] as String,
      country: json['country'] as String,
      postalCode: json['postalCode'] as String,
      state: json['state'] as String,
      streetName: json['streetName'] as String,
      streetNumber: json['streetNumber'] as String,
      fullAddress: json['fullAddress'] as String,
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
      'fullAddress': fullAddress,
    };
  }
}
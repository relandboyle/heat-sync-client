class UnitData {
  int unitId;
  String tenantName;
  String unitNumber;
  int buildingId;

  UnitData({
    required this.unitId,
    required this.tenantName,
    required this.unitNumber,
    required this.buildingId,
  });

  factory UnitData.fromJson(Map<String, dynamic> json) {
    return UnitData(
      unitId: json['unitId'] as int,
      tenantName: json['tenantName'] as String,
      unitNumber: json['unitNumber'] as String,
      buildingId: json['buildingId'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'unitId': unitId,
      'tenantName': tenantName,
      'unitNumber': unitNumber,
      'buildingId': buildingId,
    };
  }
}

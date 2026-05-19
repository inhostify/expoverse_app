class StallModel {
  final String id;
  final String exhibitionId;
  final String stallNumber;
  final String size;
  final double pricePerDay;
  final int status;
  final List<String> materialsIncluded;

  StallModel({
    required this.id,
    required this.exhibitionId,
    required this.stallNumber,
    required this.size,
    required this.pricePerDay,
    required this.status,
    required this.materialsIncluded,
  });

  factory StallModel.fromJson(Map<String, dynamic> json) {
    return StallModel(
      id: json['id'] as String,
      exhibitionId: json['exhibition_id'] as String,
      stallNumber: json['stall_number'] as String,
      size: json['size'] as String,
      pricePerDay: (json['price_per_day'] as num).toDouble(),
      status: json['status'] as int,
      materialsIncluded: (json['materials_included'] as List<dynamic>).map((e) => e as String).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'exhibition_id': exhibitionId,
      'stall_number': stallNumber,
      'size': size,
      'price_per_day': pricePerDay,
      'status': status,
      'materials_included': materialsIncluded,
    };
  }
}

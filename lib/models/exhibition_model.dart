class ExhibitionModel {
  final String id;
  final String title;
  final String location;
  final DateTime startDate;
  final DateTime endDate;
  final String description;
  final String bannerUrl;
  final String organizerName;
  final double startingPrice;
  final List<String> tags;

  ExhibitionModel({
    required this.id,
    required this.title,
    required this.location,
    required this.startDate,
    required this.endDate,
    required this.description,
    required this.bannerUrl,
    required this.organizerName,
    required this.startingPrice,
    required this.tags,
  });

  factory ExhibitionModel.fromJson(Map<String, dynamic> json) {
    return ExhibitionModel(
      id: json['id'] as String,
      title: json['title'] as String,
      location: json['location'] as String,
      startDate: DateTime.parse(json['start_date'] as String),
      endDate: DateTime.parse(json['end_date'] as String),
      description: json['description'] as String,
      bannerUrl: json['banner_url'] as String,
      organizerName: json['organizer_name'] as String,
      startingPrice: (json['starting_price'] as num).toDouble(),
      tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'location': location,
      'start_date': startDate.toIso8601String(),
      'end_date': endDate.toIso8601String(),
      'description': description,
      'banner_url': bannerUrl,
      'organizer_name': organizerName,
      'starting_price': startingPrice,
      'tags': tags,
    };
  }
}

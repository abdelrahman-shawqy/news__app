import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
part 'Sources_response_model.g.dart';
class SourcesResponseModel extends Equatable {

  SourcesResponseModel({required this.status, required this.sources});
  final String status;
  final List<SourceModel> sources;

  factory SourcesResponseModel.fromJson(Map<String, dynamic> json) {
    return SourcesResponseModel(
      status: json['status'] as String,
      sources: (json['sources'] as List).map((e) {
        return SourceModel.fromJson(e);
      }).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'sources': sources.map((SourceModel e) {
        return e.toJson();
      }).toList(),
    };
  }

  @override
  List<Object?> get props => [status, sources];
}


@HiveType(typeId: 0)
class SourceModel extends HiveObject with EquatableMixin {
  SourceModel({
    required this.id,
    required this.name,
    required this.description,
    required this.url,
    required this.category,
    required this.language,
    required this.country,
  });

  @HiveField(0)
  final String id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String description;
  @HiveField(3)
  final String url;
  @HiveField(4)
  final String category;
  @HiveField(5)
  final String language;
  @HiveField(6)
  final String country;

  factory SourceModel.fromJson(Map<String, dynamic> json) {
    return SourceModel(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      category: json['category'] as String,
      country: json['country'] as String,
      language: json['language'] as String,
      url: json['url'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'category': category,
      'country': country,
      'language': language,
      'url': url,
    };
  }

  @override
  List<Object?> get props => [
    id,
    name,
    description,
    category,
    country,
    language,
    url,
  ];
}

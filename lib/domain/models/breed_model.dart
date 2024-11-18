import 'package:freezed_annotation/freezed_annotation.dart';

part 'breed_model.freezed.dart';
part 'breed_model.g.dart';

@freezed
class BreedModel with _$BreedModel {
  const factory BreedModel({
    @Default(WeightModel()) WeightModel weight,
    @Default("") String id,
    @Default("") String name,
    @Default("") String cfa_url,
    @Default("") String vetstreet_url,
    @Default("") String vcahospitals_url,
    @Default("") String temperament,
    @Default("") String origin,
    @Default("") String country_codes,
    @Default("") String country_code,
    @Default("") String description,
    @Default("") String life_span,
    @Default(0) int indoor,
    @Default(0) int lap,
    @Default("") String alt_names,
    @Default(0) int adaptability,
    @Default(0) int affection_level,
    @Default(0) int child_friendly,
    @Default(0) int dog_friendly,
    @Default(0) int energy_level,
    @Default(0) int grooming,
    @Default(0) int health_issues,
    @Default(0) int intelligence,
    @Default(0) int shedding_level,
    @Default(0) int social_needs,
    @Default(0) int stranger_friendly,
    @Default(0) int vocalisation,
    @Default(0) int experimental,
    @Default(0) int hairless,
    @Default(0) int natural,
    @Default(0) int rare,
    @Default(0) int rex,
    @Default(0) int suppressed_tail,
    @Default(0) int short_legs,
    @Default("") String wikipedia_url,
    @Default(0) int hypoallergenic,
    @Default("") String reference_image_id,
  }) = _BreedModel;

  factory BreedModel.fromJson(Map<String, dynamic> json) =>
      _$BreedModelFromJson(json);
}

@freezed
class WeightModel with _$WeightModel {
  const factory WeightModel({
    @Default("") String imperial,
    @Default("") String metric,
  }) = _WeightModel;

  factory WeightModel.fromJson(Map<String, dynamic> json) =>
      _$WeightModelFromJson(json);
}

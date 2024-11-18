// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'breed_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BreedModelImpl _$$BreedModelImplFromJson(Map<String, dynamic> json) =>
    _$BreedModelImpl(
      weight: json['weight'] == null
          ? const WeightModel()
          : WeightModel.fromJson(json['weight'] as Map<String, dynamic>),
      id: json['id'] as String? ?? "",
      name: json['name'] as String? ?? "",
      cfa_url: json['cfa_url'] as String? ?? "",
      vetstreet_url: json['vetstreet_url'] as String? ?? "",
      vcahospitals_url: json['vcahospitals_url'] as String? ?? "",
      temperament: json['temperament'] as String? ?? "",
      origin: json['origin'] as String? ?? "",
      country_codes: json['country_codes'] as String? ?? "",
      country_code: json['country_code'] as String? ?? "",
      description: json['description'] as String? ?? "",
      life_span: json['life_span'] as String? ?? "",
      indoor: (json['indoor'] as num?)?.toInt() ?? 0,
      lap: (json['lap'] as num?)?.toInt() ?? 0,
      alt_names: json['alt_names'] as String? ?? "",
      adaptability: (json['adaptability'] as num?)?.toInt() ?? 0,
      affection_level: (json['affection_level'] as num?)?.toInt() ?? 0,
      child_friendly: (json['child_friendly'] as num?)?.toInt() ?? 0,
      dog_friendly: (json['dog_friendly'] as num?)?.toInt() ?? 0,
      energy_level: (json['energy_level'] as num?)?.toInt() ?? 0,
      grooming: (json['grooming'] as num?)?.toInt() ?? 0,
      health_issues: (json['health_issues'] as num?)?.toInt() ?? 0,
      intelligence: (json['intelligence'] as num?)?.toInt() ?? 0,
      shedding_level: (json['shedding_level'] as num?)?.toInt() ?? 0,
      social_needs: (json['social_needs'] as num?)?.toInt() ?? 0,
      stranger_friendly: (json['stranger_friendly'] as num?)?.toInt() ?? 0,
      vocalisation: (json['vocalisation'] as num?)?.toInt() ?? 0,
      experimental: (json['experimental'] as num?)?.toInt() ?? 0,
      hairless: (json['hairless'] as num?)?.toInt() ?? 0,
      natural: (json['natural'] as num?)?.toInt() ?? 0,
      rare: (json['rare'] as num?)?.toInt() ?? 0,
      rex: (json['rex'] as num?)?.toInt() ?? 0,
      suppressed_tail: (json['suppressed_tail'] as num?)?.toInt() ?? 0,
      short_legs: (json['short_legs'] as num?)?.toInt() ?? 0,
      wikipedia_url: json['wikipedia_url'] as String? ?? "",
      hypoallergenic: (json['hypoallergenic'] as num?)?.toInt() ?? 0,
      reference_image_id: json['reference_image_id'] as String? ?? "",
    );

Map<String, dynamic> _$$BreedModelImplToJson(_$BreedModelImpl instance) =>
    <String, dynamic>{
      'weight': instance.weight,
      'id': instance.id,
      'name': instance.name,
      'cfa_url': instance.cfa_url,
      'vetstreet_url': instance.vetstreet_url,
      'vcahospitals_url': instance.vcahospitals_url,
      'temperament': instance.temperament,
      'origin': instance.origin,
      'country_codes': instance.country_codes,
      'country_code': instance.country_code,
      'description': instance.description,
      'life_span': instance.life_span,
      'indoor': instance.indoor,
      'lap': instance.lap,
      'alt_names': instance.alt_names,
      'adaptability': instance.adaptability,
      'affection_level': instance.affection_level,
      'child_friendly': instance.child_friendly,
      'dog_friendly': instance.dog_friendly,
      'energy_level': instance.energy_level,
      'grooming': instance.grooming,
      'health_issues': instance.health_issues,
      'intelligence': instance.intelligence,
      'shedding_level': instance.shedding_level,
      'social_needs': instance.social_needs,
      'stranger_friendly': instance.stranger_friendly,
      'vocalisation': instance.vocalisation,
      'experimental': instance.experimental,
      'hairless': instance.hairless,
      'natural': instance.natural,
      'rare': instance.rare,
      'rex': instance.rex,
      'suppressed_tail': instance.suppressed_tail,
      'short_legs': instance.short_legs,
      'wikipedia_url': instance.wikipedia_url,
      'hypoallergenic': instance.hypoallergenic,
      'reference_image_id': instance.reference_image_id,
    };

_$WeightModelImpl _$$WeightModelImplFromJson(Map<String, dynamic> json) =>
    _$WeightModelImpl(
      imperial: json['imperial'] as String? ?? "",
      metric: json['metric'] as String? ?? "",
    );

Map<String, dynamic> _$$WeightModelImplToJson(_$WeightModelImpl instance) =>
    <String, dynamic>{
      'imperial': instance.imperial,
      'metric': instance.metric,
    };

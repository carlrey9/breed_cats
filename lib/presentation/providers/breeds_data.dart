import 'dart:convert';
import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:the_cat_app_test/data/remote/cat_service.dart';
import 'package:the_cat_app_test/domain/models/breed_model.dart';

part "breeds_data.g.dart";

@Riverpod(keepAlive: true)
class BreedsData extends _$BreedsData {
  @override
  List<BreedModel> build() {
    return [];
  }

  Future<void> getData() async {
    try {
      List<dynamic> response = await CatService().getBaseInfo();
      // List<Map<String, dynamic>> listOfJsonObjects = List<Map<String, dynamic>>.from(jsonList);
      List<BreedModel> breedModels = [];
      for (int i = 0; i < response.length; i++) {
        breedModels.add(BreedModel.fromJson(response[i]));
      }
      state = breedModels;
    } catch (error) {
      log("Error in getData: $error");
    }
  }
}

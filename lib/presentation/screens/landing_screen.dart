import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:the_cat_app_test/data/constants/constants.dart';
import 'package:the_cat_app_test/domain/models/breed_model.dart';
import 'package:the_cat_app_test/presentation/providers/breeds_data.dart';

class LandingScreen extends ConsumerWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final breedsData = ref.watch(breedsDataProvider);
    return Scaffold(
      appBar: _appBar(context, breedsData),
      body: Container(
        color: Colors.amber.withOpacity(0.1),
        child: ListView.builder(
          itemCount: breedsData.length,
          itemBuilder: (BuildContext context, int index) {
            return _CardWidget(breedsData[index]);
          },
        ),
      ),
    );
  }

  AppBar _appBar(BuildContext context, List<BreedModel> breedsData) {
    List<String> breedNames = [];
    for (int i = 0; i < breedsData.length; i++) {
      breedNames.add(breedsData[i].name);
    }
    return AppBar(
      title: const Text("Buscar"),
      actions: [
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {
            showSearch(
              context: context,
              delegate: CustomSearchDelegate(breedNames, breedsData),
            );
          },
        ),
      ],
    );
  }
}

class CustomSearchDelegate extends SearchDelegate {
  final List<String> allItems;
  final List<BreedModel> breedModels;

  CustomSearchDelegate(this.allItems, this.breedModels);

  @override
  List<Widget>? buildActions(BuildContext context) {
    // Action to clear the search query
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = ''; // Clear the search query
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> results = allItems
        .where((item) => item.toLowerCase().contains(query.toLowerCase()))
        .toList();
    List<BreedModel> suggestionsModels = breedModels
        .where((item) => item.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(results[index]),
          onTap: () {
            close(context, null);
            context.goNamed("detail", extra: suggestionsModels[index]);
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> suggestions = allItems
        .where((item) => item.toLowerCase().contains(query.toLowerCase()))
        .toList();
    List<BreedModel> suggestionsModels = breedModels
        .where((item) => item.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(suggestions[index]),
          onTap: () {
            close(context, null);
            context.goNamed("detail", extra: suggestionsModels[index]);
          },
        );
      },
    );
  }
}

class _CardWidget extends StatelessWidget {
  final BreedModel breedModel;
  const _CardWidget(this.breedModel);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.goNamed("detail", extra: breedModel);
      },
      child: Container(
        margin: const EdgeInsets.all(20),
        height: MediaQuery.of(context).size.height * 0.43,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(12)),
        child: Column(
          children: [
            _ImageWidget(breedModel: breedModel),
            Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(3),
                  child: Text("Raza: ${breedModel.name}"),
                ),
                Container(
                  padding: const EdgeInsets.all(3),
                  child: Text("Pais de Origen: ${breedModel.origin}"),
                ),
                Container(
                  padding: const EdgeInsets.all(3),
                  child: Text("Inteligencia: ${breedModel.intelligence}"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _ImageWidget extends StatelessWidget {
  const _ImageWidget({
    required this.breedModel,
  });

  final BreedModel breedModel;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(12),
        topRight: Radius.circular(12),
      ),
      child: Hero(
        tag: "image_tag_${breedModel.name}",
        child: Image.network(
          "${Constants.url_base_image}${breedModel.reference_image_id}.jpg",
          height: MediaQuery.of(context).size.height * 0.3,
          width: double.infinity,
          fit: BoxFit.cover,
          loadingBuilder: (
            BuildContext context,
            Widget child,
            ImageChunkEvent? loadingProgress,
          ) {
            if (loadingProgress == null) {
              return child;
            } else {
              return Center(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: double.infinity,
                  child: Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                              (loadingProgress.expectedTotalBytes ?? 1)
                          : null,
                    ),
                  ),
                ),
              );
            }
          },
          errorBuilder:
              (BuildContext context, Object error, StackTrace? stackTrace) {
            return SizedBox(
              height: MediaQuery.of(context).size.height * 0.3,
              width: double.infinity,
              child: const Center(
                child: Icon(
                  Icons.error,
                  size: 50,
                  color: Colors.red,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

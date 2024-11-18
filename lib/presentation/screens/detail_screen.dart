import 'package:country_codes/country_codes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:the_cat_app_test/data/constants/constants.dart';
import 'package:the_cat_app_test/domain/models/breed_model.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailScreen extends StatelessWidget {
  final BreedModel breedModel;
  const DetailScreen({required this.breedModel, super.key});

  @override
  Widget build(BuildContext context) {
    _init();
    return Scaffold(
      appBar: AppBar(
        title: Text(breedModel.name),
      ),
      body: Column(
        children: [
          _ImageWidget(breedModel: breedModel),
          Expanded(
            child: Container(
              //height: MediaQuery.of(context).size.height * 0.5,
              margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        child: Text(breedModel.description,
                            style: const TextStyle(fontSize: 16)),
                      ),
                      _LinksWidget(breedModel: breedModel),
                      _DetailDataWidget(
                          title: "Peso",
                          data: "${breedModel.weight.imperial} Libras"),
                      _DetailDataWidget(
                          title: "Temperamento", data: breedModel.temperament),
                      _DetailDataWidget(
                          title: "Origen", data: breedModel.origin),
                      _DetailDataWidget(
                          title: "Pais",
                          data: _getCountryName(breedModel.country_code)),
                      _DetailDataWidget(
                          title: "Esperanza de Vida",
                          data: breedModel.life_span),
                      _DetailDataWidget(
                          title: "Interior",
                          data: breedModel.indoor.toString()),
                      _DetailDataWidget(
                          title: "Adaptabilidad",
                          data: breedModel.adaptability.toString()),
                      _DetailDataWidget(
                          title: "Nivel de Afección ",
                          data: breedModel.affection_level.toString()),
                      _DetailDataWidget(
                          title: "Amigable con Niños",
                          data: breedModel.child_friendly.toString()),
                      _DetailDataWidget(
                          title: "Amigable con Perros",
                          data: breedModel.dog_friendly.toString()),
                      _DetailDataWidget(
                          title: "Nivel Energía",
                          data: breedModel.energy_level.toString()),
                      _DetailDataWidget(
                          title: "Nivel aseo",
                          data: breedModel.grooming.toString()),
                      _DetailDataWidget(
                          title: "Problemas de Salud",
                          data: breedModel.health_issues.toString()),
                      _DetailDataWidget(
                          title: "Inteligencia",
                          data: breedModel.intelligence.toString()),
                      _DetailDataWidget(
                          title: "Necesidades Sociales",
                          data: breedModel.social_needs.toString()),
                      _DetailDataWidget(
                          title: "Amigable con extraños",
                          data: breedModel.stranger_friendly.toString()),
                      _DetailDataWidget(
                          title: "Vocalización",
                          data: breedModel.vocalisation.toString()),
                      _DetailDataWidget(
                          title: "Experimental",
                          data: breedModel.experimental.toString()),
                      _DetailDataWidget(
                          title: "Sin pelo",
                          data: breedModel.hairless.toString()),
                      _DetailDataWidget(
                          title: "Natural",
                          data: breedModel.natural.toString()),
                      _DetailDataWidget(
                          title: "Rareza", data: breedModel.rare.toString()),
                      _DetailDataWidget(
                          title: "Rex", data: breedModel.rex.toString()),
                      _DetailDataWidget(
                          title: "Cola Suprimida",
                          data: breedModel.suppressed_tail.toString()),
                      _DetailDataWidget(
                          title: "Patas Cortas",
                          data: breedModel.short_legs.toString()),
                      _DetailDataWidget(
                          title: "hipoalergénico",
                          data: breedModel.hypoallergenic.toString()),
                    ]),
              ),
            ),
          )
        ],
      ),
    );
  }

  String _getCountryName(String countryCode) {
    Locale locale = Locale.fromSubtags(countryCode: countryCode);
    final CountryDetails details = CountryCodes.detailsForLocale(locale);
    return details.name!;
  }

  void _init() async {
    await CountryCodes.init();
  }
}

class _LinksWidget extends StatelessWidget {
  const _LinksWidget({
    required this.breedModel,
    super.key,
  });
  final BreedModel breedModel;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 2.0, // Horizontal space between widgets
      runSpacing: 2.0,
      children: [
        GestureDetector(
          onTap: () {
            _goToChrome(breedModel.wikipedia_url);
          },
          child: const Chip(
            shape: StadiumBorder(side: BorderSide.none),
            label: Text('🔗Wikipedia'),
          ),
        ),
        GestureDetector(
          onTap: () {
            _goToChrome(breedModel.cfa_url);
          },
          child: const Chip(
            shape: StadiumBorder(side: BorderSide.none),
            label: Text('🔗CFA'),
          ),
        ),
        GestureDetector(
          onTap: () {
            _goToChrome(breedModel.vetstreet_url);
          },
          child: const Chip(
            shape: StadiumBorder(side: BorderSide.none),
            label: Text('🔗Vet Street'),
          ),
        ),
        GestureDetector(
          onTap: () {
            _goToChrome(breedModel.vcahospitals_url);
          },
          child: const Chip(
            shape: StadiumBorder(side: BorderSide.none),
            label: Text('🔗VCA Hospitals'),
          ),
        ),
      ],
    );
  }

  Future<void> _goToChrome(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }
}

class _DetailDataWidget extends StatelessWidget {
  const _DetailDataWidget({
    required this.title,
    required this.data,
  });

  final String data;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "$title: ",
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        const SizedBox(width: 10),
        Expanded(child: Text(data, style: const TextStyle(fontSize: 15))),
      ],
    );
  }
}

class _ImageWidget extends StatelessWidget {
  const _ImageWidget({
    super.key,
    required this.breedModel,
  });

  final BreedModel breedModel;

  @override
  Widget build(BuildContext context) {
    return Hero(
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
              child: Container(
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
          return Container(
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
    );
  }
}

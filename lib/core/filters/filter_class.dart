import 'package:taknikat/model/category_model/category_model.dart';
import 'package:taknikat/model/country/country_model.dart';

import '../../app/App.dart';
import '../app_localizations.dart';

enum Gender {
  male,
  female,
  none,
}

extension GenderEx on Gender {
  String get name {
    switch (this) {
      case Gender.male:
        return  AppLocalizations.of(navKey.currentContext!).translate("male");
        break;
      case Gender.female:
        return AppLocalizations.of(navKey.currentContext!).translate("female");
        break;
      case Gender.none:
        return AppLocalizations.of(navKey.currentContext!)
            .translate("none");
        break;
    }
    return 'none';
  }

  String get apiKey {
    switch (this) {
      case Gender.male:
        return 'man';
      case Gender.female:
        return 'woman';
      case Gender.none:
        return 'none';
    }
  }
}

class CustomFilter {
  const CustomFilter({
    this.search,
    this.gender,
    this.category,
    this.country,
  });

  final String? search;
  final Gender? gender;
  final CategoryModel? category;
  final Country? country;

  CustomFilter copyWith({
    String? search,
    Wrapped<Gender>? gender,
    Wrapped<CategoryModel>? category,
    Wrapped<Country>? country,
  }) {
    return CustomFilter(
      search: search ?? this.search,
      gender: gender != null ? gender.value : this.gender,
      category: category != null ? category.value : this.category,
      country: country != null ? country.value : this.country,
    );
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> map = {
      if (search?.trim().isNotEmpty ?? false) 'search': this.search,
      if (gender != null) 'gender': gender!.apiKey,
      if (category != null) 'categories[]': category!.id,
      if (country != null) 'countries': country!.id,
    };
    return map;
  }
}

// This is all you need:
class Wrapped<T> {
  final T? value;

  const Wrapped.value(this.value);
}

String getLangLocalization(String key) {
  return '${AppLocalizations.of(navKey.currentContext!).translate(key)??''}';
}
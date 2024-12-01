import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shreemad_bhagvat_geeta_app/modal/gita_modal.dart';

class BhagwadGitaProvider extends ChangeNotifier {
  List<BhagwadGitaModel> bhagwadGitaList = [];

  Future<void> jsonParsing() async {
    String json = await rootBundle.loadString('assets/Json/gita.json');
    List gita = jsonDecode(json);
    bhagwadGitaList = gita
        .map(
          (e) => BhagwadGitaModel.fromJson(e),
    )
        .toList();

    notifyListeners();
  }

  BhagwadGitaProvider() {
    jsonParsing();
  }
}
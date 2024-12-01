
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:shreemad_bhagvat_geeta_app/provider/gita_provider.dart';
import 'package:shreemad_bhagvat_geeta_app/provider/home_page_provider.dart';
import 'package:shreemad_bhagvat_geeta_app/provider/shlok_provider.dart';
import 'package:shreemad_bhagvat_geeta_app/views/home_page.dart';
import 'package:shreemad_bhagvat_geeta_app/views/shlok_page.dart';

PageView pageView = PageView();
GlobalKey imgKey = GlobalKey();

class ShlokPreviewPage extends StatelessWidget {
  const ShlokPreviewPage({super.key});

  get index => null;

  @override
  Widget build(BuildContext context) {
    BhagwadGitaProvider bhagwadGitaProvider =
    Provider.of<BhagwadGitaProvider>(context);
    HomePageProvider homePageProviderFalse =
    Provider.of<HomePageProvider>(context, listen: false);
    ShlokProvider shlokProviderFalse =
    Provider.of<ShlokProvider>(context, listen: false);
    ShlokProvider shlokProviderTrue =
    Provider.of<ShlokProvider>(context, listen: true);
    HomePageProvider homePageProviderTrue =
    Provider.of<HomePageProvider>(context, listen: true);

    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff320D0A),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: Text(
          (shlokProviderTrue.selectedLanguage == 'Sanskrit')
              ? bhagwadGitaProvider
              .bhagwadGitaList[selectedIndex].chapterName.chSanskrit
              : (shlokProviderTrue.selectedLanguage == 'Hindi')
              ? bhagwadGitaProvider
              .bhagwadGitaList[selectedIndex].chapterName.chHindi
              : (shlokProviderTrue.selectedLanguage == 'English')
              ? bhagwadGitaProvider
              .bhagwadGitaList[selectedIndex].chapterName.chEnglish
              : bhagwadGitaProvider.bhagwadGitaList[selectedIndex]
              .chapterName.chGujarati,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        actions: [
          DropdownButton(
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
            dropdownColor: const Color(0xff320D0A),
            value: shlokProviderTrue.selectedLanguage,
            items: <String>['Sanskrit', 'Hindi', 'English', 'Gujarati']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                  ));
            }).toList(),
            onChanged: (String? value) {
              shlokProviderFalse.languageTranslate(value!);
            },
          )
        ],
      ),
      body: RepaintBoundary(
        key: imgKey,
        child: Container(
          height: h * 1,
          width: w * 1,
          decoration: const BoxDecoration(
            // color: Colors.red
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage('assets/images/bhagwadGita.jpg'),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                (shlokProviderTrue.selectedLanguage == 'Sanskrit')
                    ? bhagwadGitaProvider
                    .bhagwadGitaList[selectedPreviewIndex]
                    .chapterName
                    .chSanskrit
                    : (shlokProviderTrue.selectedLanguage == 'Hindi')
                    ? bhagwadGitaProvider
                    .bhagwadGitaList[selectedPreviewIndex]
                    .chapterName
                    .chHindi
                    : (shlokProviderTrue.selectedLanguage == 'English')
                    ? bhagwadGitaProvider
                    .bhagwadGitaList[selectedPreviewIndex]
                    .chapterName
                    .chEnglish
                    : bhagwadGitaProvider
                    .bhagwadGitaList[selectedPreviewIndex]
                    .chapterName
                    .chGujarati,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
              SizedBox(
                height: h * 0.03,
              ),
              SelectableText(
                (shlokProviderTrue.selectedLanguage == 'Sanskrit')
                    ? bhagwadGitaProvider.bhagwadGitaList[selectedIndex]
                    .verses[selectedPreviewIndex].language.sanskrit
                    : (shlokProviderTrue.selectedLanguage == 'Hindi')
                    ? bhagwadGitaProvider.bhagwadGitaList[selectedIndex]
                    .verses[selectedPreviewIndex].language.hindi
                    : (shlokProviderTrue.selectedLanguage == 'English')
                    ? bhagwadGitaProvider
                    .bhagwadGitaList[selectedIndex]
                    .verses[selectedPreviewIndex]
                    .language
                    .english
                    : bhagwadGitaProvider
                    .bhagwadGitaList[selectedIndex]
                    .verses[selectedPreviewIndex]
                    .language
                    .gujarati,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: () async {

                      },
                      icon: const Icon(
                        Icons.file_download_outlined,
                        color: Colors.white,
                        size: 35,
                      ),
                    ),
                    IconButton(
                      onPressed: () async {
                        final path = await getApplicationDocumentsDirectory();

                        RenderRepaintBoundary imgboundary =
                        imgKey.currentContext!.findRenderObject()
                        as RenderRepaintBoundary;

                        ui.Image image = await imgboundary.toImage();

                        ByteData? imgbyteData = await image.toByteData(
                            format: ui.ImageByteFormat.png);

                        Uint8List img = imgbyteData!.buffer.asUint8List();

                        File file = File('${path.path}/img.png');

                        file.writeAsBytes(img);

                      },
                      icon: const Icon(
                        Icons.share,
                        color: Colors.white,
                        size: 35,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

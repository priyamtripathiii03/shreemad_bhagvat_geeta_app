import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shreemad_bhagvat_geeta_app/provider/gita_provider.dart';
import 'package:shreemad_bhagvat_geeta_app/provider/home_page_provider.dart';
import 'package:shreemad_bhagvat_geeta_app/provider/shlok_provider.dart';
import 'package:shreemad_bhagvat_geeta_app/utils/global.dart';

List translate = [
  'अध्यायः',
  'अध्याय',
  'Chapter',
  'પ્રકરણ',
];

int selectedIndex = 0;

// late BhagwadGitaProvider bhagwadGitaProvider;

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  // get languageIndex=null;

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    ThemeChangeProvider themeChangeProviderTrue =
        Provider.of(context, listen: true);
    ThemeChangeProvider themeChangeProviderFalse =
        Provider.of(context, listen: false);

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
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          centerTitle: true,
          title: Text(
            (shlokProviderTrue.selectedLanguage == 'Sanskrit')
                ? translate[0]
                : (shlokProviderTrue.selectedLanguage == 'Hindi')
                    ? translate[1]
                    : (shlokProviderTrue.selectedLanguage == 'English')
                        ? translate[2]
                        : translate[3],
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 30,
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
        body: Container(
          height: h * 1,
          width: w * 1,
          decoration: const BoxDecoration(
            // color: Colors.red
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage('assets/images/pf.jpg'),
            ),
          ),
          child: Column(
            children: [
              Flexible(
                child: ListView.builder(
                  itemCount: bhagwadGitaProvider.bhagwadGitaList.length,
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      selectedIndex = index;
                      shloks = bhagwadGitaProvider
                          .bhagwadGitaList[selectedIndex].verses;
                      Navigator.of(context).pushNamed('/shlok');
                    },
                    child: Container(
                      margin: const EdgeInsets.all(8),
                      height: h * 0.1,
                      width: w * 0.95,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Colors.white)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            height: h * 0.25,
                            width: w * 0.25,
                            alignment: Alignment.center,
                            decoration: const BoxDecoration(
                                color: Colors.transparent,
                                image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: AssetImage(
                                        'assets/images/sbgnum-removebg-preview.png'))),
                            child: Text(
                              bhagwadGitaProvider.bhagwadGitaList[index].chapter
                                  .toString(),
                              style: const TextStyle(
                                color: Colors.white, //Color(0xffCB9056),
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                              ),
                            ),
                          ),
                          const Spacer(),
                          SizedBox(
                            width: w * 0.7,
                            child: Text(
                              (shlokProviderTrue.selectedLanguage == 'Sanskrit')
                                  ? bhagwadGitaProvider.bhagwadGitaList[index]
                                      .chapterName.chSanskrit
                                  : (shlokProviderTrue.selectedLanguage ==
                                          'Hindi')
                                      ? bhagwadGitaProvider
                                          .bhagwadGitaList[index]
                                          .chapterName
                                          .chHindi
                                      : (shlokProviderTrue.selectedLanguage ==
                                              'English')
                                          ? bhagwadGitaProvider
                                              .bhagwadGitaList[index]
                                              .chapterName
                                              .chEnglish
                                          : bhagwadGitaProvider
                                              .bhagwadGitaList[index]
                                              .chapterName
                                              .chGujarati,
                              style: const TextStyle(
                                overflow: TextOverflow.clip,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

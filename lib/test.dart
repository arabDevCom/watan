import 'package:elwatn/core/utils/app_colors.dart';
import 'package:elwatn/core/utils/assets_manager.dart';
import 'package:elwatn/features/profile/presentation/widgets/choose_language.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chips_input/flutter_chips_input.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Chips Input',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        // brightness: Brightness.dark,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _chipKey = GlobalKey<ChipsInputState>();
  Color changeColor = AppColors.buttonBackground;

  @override
  Widget build(BuildContext context) {
    const mockResults = <AppLanguage>[
      AppLanguage(language: "Arabic", image: ImageAssets.iraqLanguageImage),
      AppLanguage(language: "English", image: ImageAssets.englishLanguageImage),
      AppLanguage(language: "Kurdish", image: ImageAssets.kurdishLanguageImage),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Chips Input Example')),
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              ChipsInput(
                key: _chipKey,
                keyboardAppearance: Brightness.dark,
                textCapitalization: TextCapitalization.words,
                textStyle: const TextStyle(
                    height: 1.5, fontFamily: 'Roboto', fontSize: 16),
                decoration: const InputDecoration(
                  labelText: 'Select Language',
                ),
                findSuggestions: (String query) {
                  if (query.isNotEmpty) {
                    var lowercaseQuery = query.toLowerCase();
                    return mockResults.where((profile) {
                      return profile.language
                              .toLowerCase()
                              .contains(query.toLowerCase()) ||
                          profile.language
                              .toLowerCase()
                              .contains(query.toLowerCase());
                    }).toList(growable: false)
                      ..sort((a, b) => a.language
                          .toLowerCase()
                          .indexOf(lowercaseQuery)
                          .compareTo(b.language
                              .toLowerCase()
                              .indexOf(lowercaseQuery)));
                  }
                  return mockResults;
                },
                onChanged: (data) {
                  print(data);
                },
                chipBuilder: (context, state, AppLanguage language) {
                  return InkWell(
                    onTap: () {
                      setState(() {
                        if (changeColor == AppColors.primary) {
                          changeColor = AppColors.buttonBackground;
                        } else {
                          changeColor = AppColors.primary;
                        }
                      });
                    },
                    child: InputChip(
                      backgroundColor: changeColor,
                      key: ObjectKey(language),
                      deleteIcon: changeColor == AppColors.primary
                          ? Icon(Icons.check)
                          : SizedBox(),
                      deleteIconColor: AppColors.white,
                      label: Text(
                        language.language,
                        style: TextStyle(color: AppColors.white),
                      ),
                      avatar: Image.asset(language.image),
                      onDeleted: () {
                        // state.deleteChip(language);
                      },
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                  );
                },
                suggestionBuilder: (context, state, AppLanguage language) {
                  return ListTile(
                    key: ObjectKey(language),
                    leading: Image.asset(language.image),
                    title: Text(language.language),
                    onTap: () => state.selectSuggestion(language),
                  );
                },
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    if (changeColor == AppColors.primary) {
                      changeColor = AppColors.buttonBackground;
                    } else {
                      changeColor = AppColors.primary;
                    }
                  });
                },
                child: InputChip(
                  backgroundColor: changeColor,
                  deleteIcon: changeColor == AppColors.primary
                      ? Icon(Icons.check)
                      : SizedBox(),
                  deleteIconColor: AppColors.white,
                  label: Text(
                    mockResults[0].language,
                    style: TextStyle(color: AppColors.white),
                  ),
                  avatar: Image.asset(mockResults[0].image),
                  onDeleted: () {
                    // state.deleteChip(language);
                  },
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    if (changeColor == AppColors.primary) {
                      changeColor = AppColors.buttonBackground;
                    } else {
                      changeColor = AppColors.primary;
                    }
                  });
                },
                child: InputChip(
                  backgroundColor: changeColor,
                  deleteIcon: changeColor == AppColors.primary
                      ? Icon(Icons.check)
                      : SizedBox(),
                  deleteIconColor: AppColors.white,
                  label: Text(
                    mockResults[1].language,
                    style: TextStyle(color: AppColors.white),
                  ),
                  avatar: Image.asset(mockResults[1].image),
                  onDeleted: () {
                    // state.deleteChip(language);
                  },
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    if (changeColor == AppColors.primary) {
                      changeColor = AppColors.buttonBackground;
                    } else {
                      changeColor = AppColors.primary;
                    }
                  });
                },
                child: InputChip(
                  backgroundColor: changeColor,
                  deleteIcon: changeColor == AppColors.primary
                      ? Icon(Icons.check)
                      : SizedBox(),
                  deleteIconColor: AppColors.white,
                  label: Text(
                    mockResults[2].language,
                    style: TextStyle(color: AppColors.white),
                  ),
                  avatar: Image.asset(mockResults[2].image),
                  onDeleted: () {
                    // state.deleteChip(language);
                  },
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
              ),
              Row(
                children: [
                  const Spacer(),
                  ChooseLanguageWidget(
                    title: mockResults[0].language,
                    image: mockResults[0].image,
                  ),
                  const Spacer(),
                  ChooseLanguageWidget(
                    title: mockResults[1].language,
                    image: mockResults[1].image,
                  ),
                  const Spacer(),
                  ChooseLanguageWidget(
                    title: mockResults[2].language,
                    image: mockResults[2].image,
                  ),
                  const Spacer(),
                ],
              )
            ],
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class AppLanguage {
  final String language;
  final String image;

  const AppLanguage({required this.language, required this.image});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppLanguage &&
          runtimeType == other.runtimeType &&
          language == other.language;

  @override
  int get hashCode => language.hashCode;

  @override
  String toString() {
    return language;
  }
}

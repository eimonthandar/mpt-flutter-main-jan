import 'package:design_system/design_system.dart';
import 'package:example/home_screen.dart';
import 'package:example/stories/stories.dart';
import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';
import 'package:localization/localization.dart';

class ComponentStorybook extends StatelessWidget {
  const ComponentStorybook({
    super.key,
    required this.lightThemeData,
    required this.darkThemeData,
  });

  final MtpThemeData lightThemeData, darkThemeData;

  @override
  Widget build(BuildContext context) {
    final theme = MtpTheme.of(context);
    return Storybook(
      initialStory: 'Widgets/PhoneFields/Outline',
      stories: getStories(theme),
      wrapperBuilder: (context, story) => MaterialApp(
        theme: lightThemeData.materialThemeData,
        darkTheme: darkThemeData.materialThemeData,
        debugShowCheckedModeBanner: false,
        locale: const Locale('en', 'US'),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: HomeScreen(story: story),
      ),
    );
  }
}

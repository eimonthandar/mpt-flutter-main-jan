import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

List<Story> getButtonStories(MtpThemeData theme) {
  return [
    Story(
      name: 'Widgets/Buttons/Primary',
      description: 'Primary button',
      builder: (BuildContext context) {
        return MtpPrimaryButton(
            onPressed: () {},
            labelText:
                context.knobs.text(label: 'label', initial: 'Primary Button'),
            enabled: context.knobs.boolean(label: 'enabled', initial: true));
      },
    ),
    Story(
      name: 'Widgets/Buttons/Text',
      description: 'Text button',
      builder: (BuildContext context) {
        return MtpTextButton(
          onPressed: () {},
          labelText: context.knobs.text(label: 'label', initial: 'Text Button'),
          enabled: context.knobs.boolean(label: 'enabled', initial: true),
        );
      },
    ),
    Story(
      name: 'Widgets/Buttons/NegativeText',
      description: 'Negative Text button',
      builder: (BuildContext context) {
        return MtpNegativeTextButton(
          onPressed: () {},
          labelText: context.knobs
              .text(label: 'label', initial: 'Negative Text Button'),
          enabled: context.knobs.boolean(label: 'enabled', initial: true),
        );
      },
    ),
  ];
}

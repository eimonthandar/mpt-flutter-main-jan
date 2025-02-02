import 'package:design_system/design_system.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

List<Story> getPhoneFieldStories(MtpThemeData theme) {
  return [
    Story(
      name: 'Widgets/PhoneFields/Outline',
      description: 'Outline PhoneField',
      builder: (BuildContext context) {
        return MtpOutlinePhoneField(
          onNumberChanged: (value) {
            if (kDebugMode) {
              print('Phone changed: $value');
            }
          },
          onCountryCodeChanged: (value) {
            if (kDebugMode) {
              print('Country code changed: $value');
            }
          },
          labelText: context.knobs.text(
            label: 'label',
            initial: 'Outline PhoneField Label',
          ),
          hintText: context.knobs.text(
            label: 'hint',
            initial: 'Input your phone number',
          ),
        );
      },
    ),
  ];
}

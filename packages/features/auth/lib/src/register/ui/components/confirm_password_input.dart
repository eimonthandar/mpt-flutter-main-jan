import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui/ui.dart';

import '../../bloc/register_bloc.dart';

class ConfirmPasswordInput extends StatelessWidget {
  const ConfirmPasswordInput({
    super.key,
    required this.focusNode,
    required this.onFieldSubmitted,
  });

  final FocusNode focusNode;
  final Function() onFieldSubmitted;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(
      buildWhen: (previous, current) =>
          previous.confirmPasswordState != current.confirmPasswordState ||
          previous.confirmPasswordError != current.confirmPasswordError,
      builder: (context, state) {
        return MtpOutlinePasswordField(
          initialValue: state.confirmPasswordState.value,
          labelText: context.l10n.registerLabelConfirmPassword,
          textInputAction: TextInputAction.next,
          onSubmitted: (_) => onFieldSubmitted(),
          prefixIcon: const Icon(Icons.lock_outline),
          focusNode: focusNode,
          onChanged: (value) {
            context
                .read<RegisterBloc>()
                .add(RegisterConfirmPasswordChanged(value));
          },
          errorText: state.confirmPasswordError?.resolvePasswordErrorMessage(context),
        );
      },
    );
  }
}

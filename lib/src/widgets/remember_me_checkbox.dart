import 'package:flutter/material.dart';
import 'package:flutter_login/src/providers/auth.dart';

class RememberMeCheckbox extends StatefulWidget {
  final Auth auth;
  final String title;

  const RememberMeCheckbox(
      {super.key, required this.auth, required this.title});

  @override
  State<RememberMeCheckbox> createState() => _RememberMeCheckboxState();
}

class _RememberMeCheckboxState extends State<RememberMeCheckbox> {
  @override
  Widget build(BuildContext context) {
    return CheckboxFormField(
      onChanged: (value) {
        widget.auth.rememberMe = value ?? false;
      },
      initialValue: widget.auth.rememberMe,
      title: Text(
        widget.title,
        style: Theme.of(context).textTheme.bodyMedium,
        textAlign: TextAlign.left,
      ),
    );
  }
}

class CheckboxFormField extends FormField<bool> {
  CheckboxFormField({
    super.key,
    required Widget title,
    bool super.initialValue = false,
    required ValueChanged<bool?> onChanged,
  }) : super(
          builder: (FormFieldState<bool> state) {
            return CheckboxListTile(
              dense: true,
              title: title,
              value: state.value,
              onChanged: (value) {
                onChanged(value);
                state.didChange(value);
              },
              subtitle: state.hasError
                  ? Builder(
                      builder: (BuildContext context) => Text(
                        state.errorText!,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.error,
                        ),
                      ),
                    )
                  : null,
              controlAffinity: ListTileControlAffinity.leading,
            );
          },
        );
}

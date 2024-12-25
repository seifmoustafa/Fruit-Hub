import 'package:flutter/material.dart';
import 'package:fruit_hub/core/widgets/custom_text_form_field.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({
    super.key,
    this.onSaved,
  });
  final void Function(String?)? onSaved;

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      obscureText: obscureText,
      onSaved: widget.onSaved,
      suffixIcon: IconButton(
        onPressed: () => setState(() {
          obscureText = !obscureText;
        }),
        icon: obscureText
            ? const Icon(Icons.remove_red_eye)
            : const Icon(Icons.visibility_off),
        color: const Color(0xffc9cecf),
      ),
      hintText: 'كلمة المرور',
      textInputType: TextInputType.visiblePassword,
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:recpie_app/theme/colors_app.dart';

class CustomTextField extends StatelessWidget {
  final String? label;
  final String hint;
  final bool obscureText;
  final IconData? icon;
  final String? svgIconPath;
  final Function(String)? onChanged;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final bool showPasswordToggle;
  final VoidCallback? onTogglePassword;

  const CustomTextField({
    Key? key,
    this.label,
    required this.hint,
    this.obscureText = false,
    this.icon,
    this.svgIconPath,
    this.onChanged,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.showPasswordToggle = false,
    this.onTogglePassword,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget? leadingIcon;

    if (svgIconPath != null) {
      leadingIcon = Padding(
        padding: const EdgeInsets.all(12.0),
        child: SvgPicture.asset(svgIconPath!, height: 24, width: 24),
      );
    } else if (icon != null) {
      leadingIcon = Icon(icon);
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 8),
          TextField(
            controller: controller,
            obscureText: obscureText,
            keyboardType: keyboardType,
            onChanged: onChanged,
            decoration: InputDecoration(
              suffixIcon:
                  showPasswordToggle
                      ? IconButton(
                        onPressed: onTogglePassword,
                        icon: Icon(
                          obscureText ? Icons.visibility_off : Icons.visibility,
                          color: ColorsApp.mainText,
                        ),
                      )
                      : null,
              prefixIcon: leadingIcon,
              hintStyle: TextStyle(fontSize: 14, color: ColorsApp.secondryText),
              hintText: hint,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: ColorsApp.borderColor),
                borderRadius: BorderRadius.circular(32),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: ColorsApp.primary, width: 2),
                borderRadius: BorderRadius.circular(32),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: ColorsApp.borderColor),
                borderRadius: BorderRadius.circular(32),
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

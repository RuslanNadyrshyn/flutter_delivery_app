
import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String title;

  const TextFieldWidget({Key? key, required this.controller, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(fontSize: 16)),
        const SizedBox(height: 5),
        TextField(
          cursorColor: Theme.of(context).dividerColor,
          controller: controller,
          style: const TextStyle(fontSize: 20),
          decoration: inputDecoration(context),
        ),
      ],
    );
  }
}

class TextFieldPasswordWidget extends StatefulWidget {
  final TextEditingController controller;
  final String title;
  const TextFieldPasswordWidget({Key? key, required this.title, required this.controller}) : super(key: key);

  @override
  State<TextFieldPasswordWidget> createState() => _TextFieldPasswordWidgetState();
}

class _TextFieldPasswordWidgetState extends State<TextFieldPasswordWidget> {
  bool _passwordHidden = true;

  void _changePasswordVisibility() {
    setState(() => _passwordHidden = !_passwordHidden);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.title, style: const TextStyle(fontSize: 16)),
        TextField(
          textAlignVertical: TextAlignVertical.center,
          cursorColor: Theme.of(context).dividerColor,
          controller: widget.controller,
          style: const TextStyle(fontSize: 20),
          decoration: inputDecoration(context).copyWith(
            suffixIcon: IconButton(
                color: Colors.black54,
                splashRadius: 15,
                onPressed: _changePasswordVisibility,
                icon: _passwordHidden
                    ? const Icon(Icons.visibility_off_rounded)
                    : const Icon(Icons.visibility)),
          ),
          obscureText: _passwordHidden,
        ),
      ],
    );
  }
}

InputDecoration inputDecoration(context) {
  return InputDecoration(
    filled: true,
    fillColor: Colors.white54,
    contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
    enabledBorder: myInputBorder(context),
    focusedBorder: myFocusBorder(context),
    border: myInputBorder(context),
  );
}

OutlineInputBorder myInputBorder(BuildContext context) {
  return OutlineInputBorder(
      borderRadius: const BorderRadius.all(Radius.circular(5)),
      borderSide: BorderSide(
        color: Theme.of(context).dividerColor,
        width: 1,
      ));
}
OutlineInputBorder myFocusBorder(BuildContext context) {
  return OutlineInputBorder(
      borderRadius: const BorderRadius.all(Radius.circular(5)),
      borderSide: BorderSide(
        color: Theme.of(context).dividerColor,
        width: 3,
      ));
}
import 'package:flutter/material.dart';

import '../../../../core/constants.dart';

class RoundedInput extends StatelessWidget {
  const RoundedInput({
    super.key,
    required this.controller,
    required this.onPressed,
    required this.inputText,
    required this.buttonText,
  });

  final TextEditingController controller;
  final VoidCallback onPressed;
  final String inputText;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RoundedInputTextField(
          onSubmitted: onPressed,
          controller: controller,
          labelText: inputText,
        ),
        RoundedInputButton(
          onTap: onPressed,
          controller: controller,
          text: buttonText,
        ),
      ],
    );
  }
}

class RoundedInputTextField extends StatelessWidget {
  const RoundedInputTextField({
    super.key,
    required this.onSubmitted,
    required this.controller,
    this.labelText = "",
  });

  final TextEditingController controller;
  final VoidCallback onSubmitted;
  final String labelText;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: kInputHeight,
        child: TextField(
          controller: controller,
          textAlign: TextAlign.start,
          style: const TextStyle(color: Colors.black),
          decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            labelText: labelText,
            labelStyle: const TextStyle(color: Colors.deepPurple),
          ),
          onSubmitted: (_) => onSubmitted(),
        ),
      ),
    );
  }
}

class RoundedInputButton extends StatefulWidget {
  const RoundedInputButton({
    super.key,
    required this.onTap,
    required this.controller,
    required this.text,
  });

  final VoidCallback onTap;
  final TextEditingController controller;
  final String text;

  @override
  State<RoundedInputButton> createState() => _RoundedInputButtonState();
}

class _RoundedInputButtonState extends State<RoundedInputButton> {
  bool isButtonEnabled = false;

  @override
  void initState() {
    super.initState();

    // Add a listener on controller to enable/disable button
    widget.controller.addListener(() {
      setState(() {
        isButtonEnabled = widget.controller.text.isNotEmpty;
      });
    });
  }

  @override
  void dispose() {
    widget.controller.removeListener(() {});
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: !isButtonEnabled ? Colors.black54 : Colors.deepPurple,
      shape: const RoundedRectangleBorder(
        borderRadius: kRightBorderRadius,
      ),
      child: InkWell(
        onTap: !isButtonEnabled
            ? null
            : () {
                widget.onTap();
                FocusScope.of(context).unfocus();
              },
        borderRadius: kRightBorderRadius,
        splashColor: Colors.deepPurple.shade700,
        child: Container(
          height: kInputHeight,
          padding: const EdgeInsets.symmetric(horizontal: kPadding10),
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            borderRadius: kRightBorderRadius,
          ),
          child: Text(
            widget.text,
            style: Theme.of(context)
                .textTheme
                .bodyLarge
                ?.copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

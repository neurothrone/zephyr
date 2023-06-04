import 'package:flutter/material.dart';

class RoundedInput extends StatelessWidget {
  const RoundedInput({
    super.key,
    required this.controller,
    required this.onPressed,
    required this.inputText,
    required this.buttonText,
    this.borderRadius = 30.0,
    required this.borderColor,
    required this.focusedBorderColor,
    required this.buttonForegroundColor,
    required this.buttonBackgroundColor,
    required this.buttonDisabledColor,
  });

  final TextEditingController controller;
  final VoidCallback onPressed;
  final String inputText;
  final String buttonText;

  final double borderRadius;
  final Color borderColor;
  final Color focusedBorderColor;

  final Color buttonForegroundColor;
  final Color buttonBackgroundColor;
  final Color buttonDisabledColor;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        children: [
          Expanded(
            child: RoundedInputTextField(
              onSubmitted: onPressed,
              controller: controller,
              hintText: inputText,
              borderColor: borderColor,
              focusedBorderColor: focusedBorderColor,
              borderRadius: borderRadius,
            ),
          ),
          SizedBox(
            height: double.infinity,
            child: RoundedInputButton(
              onTap: onPressed,
              controller: controller,
              text: buttonText,
              borderRadius: borderRadius,
              foregroundColor: buttonForegroundColor,
              backgroundColor: buttonBackgroundColor,
              disabledColor: buttonDisabledColor,
            ),
          ),
        ],
      ),
    );
  }
}

class RoundedInputTextField extends StatelessWidget {
  const RoundedInputTextField({
    super.key,
    required this.onSubmitted,
    required this.controller,
    this.hintText = "",
    required this.borderRadius,
    required this.borderColor,
    required this.focusedBorderColor,
  });

  final TextEditingController controller;
  final VoidCallback onSubmitted;
  final String hintText;
  final double borderRadius;
  final Color borderColor;
  final Color focusedBorderColor;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      textAlign: TextAlign.start,
      style: const TextStyle(color: Colors.black),
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        hintText: hintText,
        border: OutlineInputBorder(
          borderSide: BorderSide(color: borderColor),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(borderRadius),
            bottomLeft: Radius.circular(borderRadius),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: borderColor),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(borderRadius),
            bottomLeft: Radius.circular(borderRadius),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: focusedBorderColor),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(borderRadius),
            bottomLeft: Radius.circular(borderRadius),
          ),
        ),
      ),
      onSubmitted: (_) => onSubmitted(),
    );
  }
}

class RoundedInputButton extends StatefulWidget {
  const RoundedInputButton({
    super.key,
    required this.onTap,
    required this.controller,
    required this.text,
    required this.borderRadius,
    required this.foregroundColor,
    required this.backgroundColor,
    required this.disabledColor,
  });

  final VoidCallback onTap;
  final TextEditingController controller;
  final String text;

  final double borderRadius;

  final Color foregroundColor;
  final Color backgroundColor;
  final Color disabledColor;

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
      color: isButtonEnabled ? widget.backgroundColor : widget.disabledColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(widget.borderRadius),
          bottomRight: Radius.circular(widget.borderRadius),
        ),
      ),
      child: InkWell(
        onTap: !isButtonEnabled
            ? null
            : () {
                widget.onTap();
                FocusScope.of(context).unfocus();
              },
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(widget.borderRadius),
          bottomRight: Radius.circular(widget.borderRadius),
        ),
        splashColor: Colors.deepPurple.shade700,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(widget.borderRadius),
              bottomRight: Radius.circular(widget.borderRadius),
            ),
          ),
          child: Text(
            widget.text,
            style: TextStyle(
              color: widget.foregroundColor,
              fontSize: 16.0,
            ),
          ),
        ),
      ),
    );
  }
}

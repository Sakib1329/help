import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


import '../theme/color.dart';
import 'imageassets.dart';

class InputTextWidget extends StatefulWidget {
  const InputTextWidget({
    super.key,
    this.hintText = '',
    this.backicontap2,
    this.backicontap,
    required this.onChanged,
    this.onTap,
    this.validator,
    this.obscureText = false,
    this.readOnly = false,
    this.leading = false,
    this.backIcon = false,
    this.backIcon2 = false,
    this.leadingIcon = ImageAssets.email,
    this.imageIcon = '',
    this.backimage = '',
    this.backimagetap,
    this.backimageadd = false,
    this.contentPadding = true,
    this.clock = false,
    this.scan = false,
    this.passwordIcon = ImageAssets.obsecure,
    this.borderRadius = 10.0,
    this.borderColor = AppColor.buttonColor,
    this.hintTextColor = AppColor.hintTextColor,
    this.textColor = AppColor.textGreyColor,
    this.height = 50.0,
    this.imageHeight = 24.0,
    this.imageWeight = 24.0,
    this.obscureWidth = 24.0,
    this.obscureHeigth = 24.0,
    this.width = double.infinity,
    this.hintfontFamily = 'Montserrat',
    this.hintfontSize = 16.0,
    this.hintfontWeight = FontWeight.w300,
    this.fontSize = 18.0,
    this.fontWeight = FontWeight.w500,
    this.fontFamily = 'Urbanist',
    this.vertical = 10.0,
    this.horizontal = 15.0,
    this.leadingright = 0.0,
    this.leadingtop = 0.0,
    this.leadingleft = 0.0,
    this.backimagewidht = 24.0,
    this.backimageheight = 24.0,
    this.backgroundColor = AppColor.textAreaColor,
    this.maxLines = 1,
    this.controller, // <-- Added controller
  });

  final String hintText, hintfontFamily, fontFamily;
  final double borderRadius,
      fontSize,
      hintfontSize,
      imageHeight,
      imageWeight,
      leadingright,
      leadingtop,
      leadingleft,
      obscureHeigth,
      obscureWidth;
  final Color borderColor, textColor, hintTextColor, backgroundColor;
  final double height,
      width,
      horizontal,
      vertical,
      backimagewidht,
      backimageheight;
  final bool obscureText,
      readOnly,
      contentPadding,
      leading,
      clock,
      scan,
      backIcon,
      backIcon2,
      backimageadd;
  final String passwordIcon, leadingIcon, imageIcon, backimage;
  final ValueChanged<String> onChanged;
  final VoidCallback? onTap, backicontap, backicontap2, backimagetap;
  final String? Function(String?)? validator;
  final FontWeight fontWeight, hintfontWeight;
  final int maxLines;
  final TextEditingController? controller; // <-- Added controller

  @override
  _InputTextWidgetState createState() => _InputTextWidgetState();
}

class _InputTextWidgetState extends State<InputTextWidget> {
  late bool _isObscured;

  @override
  void initState() {
    super.initState();
    _isObscured = widget.obscureText;
  }

  void _toggleObscure() {
    setState(() {
      _isObscured = !_isObscured;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: widget.width,
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        border: Border.all(color: widget.borderColor),
        borderRadius: BorderRadius.circular(widget.borderRadius),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (widget.leading)
              Padding(
                padding: EdgeInsets.only(
                  right: widget.leadingright,
                  top: widget.leadingtop,
                  left: widget.leadingleft,
                ),
                child: Image.asset(
                  widget.leadingIcon,
                  width: widget.imageWeight,
                  height: widget.imageHeight,
                ),
              ),
            Expanded(
              child: TextField(
                controller: widget.controller, // <-- Use the controller
                onChanged: widget.onChanged,
                onTap: widget.onTap,
                readOnly: widget.readOnly,
                maxLines: widget.maxLines,
                obscureText: _isObscured,
                decoration: InputDecoration(
                  hintText: widget.hintText,
                  hintStyle: TextStyle(
                    color: widget.hintTextColor,
                    fontSize: widget.hintfontSize,
                    fontWeight: widget.hintfontWeight,
                    fontFamily: widget.hintfontFamily,
                  ),
                  border: InputBorder.none,
                  contentPadding: widget.contentPadding
                      ? EdgeInsets.symmetric(
                    horizontal: widget.horizontal,
                    vertical: widget.vertical,
                  )
                      : null,
                ),
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontSize: widget.fontSize,
                  fontWeight: widget.fontWeight,
                  fontFamily: widget.fontFamily,
                  color: widget.textColor,
                ),
              ),
            ),
            if (widget.obscureText)
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: GestureDetector(
                  onTap: _toggleObscure,
                  child: Image.asset(
                    _isObscured ? ImageAssets.eye : widget.passwordIcon,
                    color: AppColor.greyTone,
                    width: widget.obscureWidth,
                    height: widget.obscureHeigth,
                  ),
                ),
              ),
            if (widget.backIcon)
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: GestureDetector(
                  onTap: widget.backicontap,
                  child: SvgPicture.asset(
                    widget.imageIcon,
                  ),
                ),
              ),
            if (widget.backIcon2)
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: GestureDetector(
                  onTap: widget.backicontap2,
                  child: SvgPicture.asset(
                    widget.imageIcon,
                  ),
                ),
              ),
            if (widget.backimageadd)
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: GestureDetector(
                  onTap: widget.backimagetap,
                  child: Image.asset(
                    widget.backimage,
                    height: widget.backimageheight,
                    width: widget.backimagewidht,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

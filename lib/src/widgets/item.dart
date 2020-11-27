import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:intl_phone_number_input/src/models/country_model.dart';
import 'package:intl_phone_number_input/src/utils/util.dart';

class Item extends StatelessWidget {
  final Country country;
  final bool showFlag;
  final bool useEmoji;
  final TextStyle textStyle;
  final bool withCountryNames;

  const Item({
    Key key,
    this.country,
    this.showFlag,
    this.useEmoji,
    this.textStyle,
    this.withCountryNames = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = InternationalPhoneNumberInputTheme.of(context);
    return Container(
      decoration: BoxDecoration(
          border: Border(
              right: BorderSide(
        color: theme.strokeLineColor,
        width: 1,
      ))),
      child: Row(
        textDirection: TextDirection.ltr,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          _Flag(
            country: country,
            showFlag: showFlag,
            useEmoji: useEmoji,
          ),
          SizedBox(width: 12.0),
          // Text(
          //   '${(country?.dialCode ?? '').padRight(5, "   ")}',
          //   textDirection: TextDirection.ltr,
          //   style: textStyle,
          // ),
        ],
      ),
    );
  }
}

class _Flag extends StatelessWidget {
  final Country country;
  final bool showFlag;
  final bool useEmoji;

  const _Flag({Key key, this.country, this.showFlag, this.useEmoji})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return country != null && showFlag
        ? Container(
            child: useEmoji
                ? Text(
                    Utils.generateFlagEmojiUnicode(country?.alpha2Code ?? ''),
                    style: Theme.of(context).textTheme.headline5,
                  )
                : country?.flagUri != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.all(
                          Radius.circular(4.0),
                        ),
                        child: Image.asset(
                          country?.flagUri,
                          width: 36.0,
                          package: 'intl_phone_number_input',
                        ),
                      )
                    : SizedBox.shrink(),
          )
        : SizedBox.shrink();
  }
}

class CustomFlagClipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) {
    return Rect.fromLTWH(4, 4, size.width - 8, size.height - 8);
    return Rect.fromLTWH(4, 4, size.width - 8, size.height - 8);
  }

  @override
  bool shouldReclip(covariant CustomClipper<Rect> oldClipper) {
    return false;
  }
}

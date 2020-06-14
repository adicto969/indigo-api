import 'package:flutter/material.dart';

class CloseButtonCustom extends StatelessWidget {
  final Icon icon;
  /// Creates a Material Design close button.
  const CloseButtonCustom({ Key key, @required this.icon }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasMaterialLocalizations(context));
    return IconButton(
      icon: icon,
      tooltip: MaterialLocalizations.of(context).closeButtonTooltip,
      onPressed: () {
        Navigator.maybePop(context);
      },
    );
  }
}

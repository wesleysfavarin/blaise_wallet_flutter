import 'package:blaise_wallet_flutter/ui/util/text_styles.dart';
import 'package:flutter/material.dart';

class ErrorContainer extends StatelessWidget {
  final String errorText;
  ErrorContainer({@required this.errorText});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsDirectional.only(start: 30, end: 30, top: 4, bottom: 0),
      child: Text(this.errorText,
          style: AppStyles.primarySmallest600(context),
          textAlign: TextAlign.start),
    );
  }
}

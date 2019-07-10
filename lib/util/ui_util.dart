import 'package:blaise_wallet_flutter/appstate_container.dart';
import 'package:blaise_wallet_flutter/ui/util/text_styles.dart';
import 'package:blaise_wallet_flutter/ui/widgets/overlay_dialog.dart';
import 'package:intl/intl.dart';
import 'package:oktoast/oktoast.dart';
import 'package:flutter/material.dart';

class UIUtil {
  static void showSnackbar(String content, BuildContext context) {
    showToastWidget(
      Align(
        alignment: Alignment.topCenter,
        child: Container(
          margin: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height * 0.05,
              horizontal: 14),
          padding: EdgeInsets.symmetric(vertical: 18, horizontal: 16),
          width: MediaQuery.of(context).size.width - 30,
          decoration: BoxDecoration(
            color: StateContainer.of(context).curTheme.backgroundPrimary,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: StateContainer.of(context).curTheme.textDark50,
                  offset: Offset(0, 20),
                  blurRadius: 40,
                  spreadRadius: -5),
            ],
          ),
          child: Text(
            content,
            style: AppStyles.snackBar(context),
            textAlign: TextAlign.start,
          ),
        ),
      ),
      dismissOtherToast: true,
      duration: Duration(milliseconds: 2000),
    );
  }

  static String formatDateStr(DateTime dt) {
    int currentYear = DateTime.now().toLocal().year;
    DateTime localTime = dt.toLocal();
    DateFormat df;
    if (localTime.year != currentYear) {
      df = DateFormat("MMM dd, yyyy • HH:mm");
    } else {
      df = DateFormat("MMM dd • HH:mm");
    }
    return  df.format(localTime);
  }

  static String formatDateStrLong(DateTime dt) {
    //"Jul 08, 2019 • 13:24:01 (1562592241)"    
    int secondsSinceEpoch = dt.millisecondsSinceEpoch ~/ 1000;
    DateTime localTime = dt.toLocal();
    DateFormat df;
    df = DateFormat("MMM dd, yyyy • HH:mm");
    return  df.format(localTime) + " ($secondsSinceEpoch)";
  }

  /// Show a dialog asking if they want to confirm a fee
  static void showFeeDialog({@required BuildContext context, @required Function onConfirm}) {
    showAppDialog(
        context: context,
        builder: (_) => DialogOverlay(
            title: 'Add Fee',
            warningStyle: false,
            confirmButtonText: "YES, ADD FEE",
            body: TextSpan(
              children: [
                TextSpan(
                  text:
                      "This operation requires a fee. ",
                  style: AppStyles.paragraph(context),
                ),
                TextSpan(
                  text:
                      "Would you like to add a 0.0001 PASC fee to this operation?",
                  style: AppStyles.paragraphPrimary(context),
                ),
              ],
            ),
            onConfirm: () {
              onConfirm();
            }
        )
    );
  }
}

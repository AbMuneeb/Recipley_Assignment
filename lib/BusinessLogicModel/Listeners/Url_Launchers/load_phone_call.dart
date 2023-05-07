import 'package:recipley_assignment/src/snackbar_design.dart';
import 'package:url_launcher/url_launcher.dart';

class CallUtils {
  CallUtils._();

  static Future<void> openDialer(String phoneNumber) async {
    Uri callUrl = Uri.parse('tel:=$phoneNumber');
    if (await canLaunchUrl(callUrl)) {
      await launchUrl(callUrl);
    } else {
      SnackBarDesign.errorSnack('Currently we cannot make a phone call fromt this app');
    }
  }
}
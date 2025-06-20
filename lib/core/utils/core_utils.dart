import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:viewing_nz/core/res/icons.dart';
import 'package:toastification/toastification.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:viewing_nz/core/extensions/theme_extension.dart';
import 'package:viewing_nz/core/services/router.dart';
import 'package:viewing_nz/core/theme/app_colors.dart';
import 'package:viewing_nz/core/utils/hero_dialog_route.dart';

final GlobalKey<ScaffoldMessengerState> rootScaffoldMessengerKey =
    GlobalKey<ScaffoldMessengerState>();

enum ToastType { success, error, info, warning }

abstract class CoreUtils {
  const CoreUtils();

  static void postFrameCall(VoidCallback callback) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      callback();
    });
  }

  static void makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(scheme: 'tel', path: phoneNumber);
    if (!await launchUrl(launchUri)) {
      // showToast(type: ToastType.error, message: "Failed to initiate a call");
    }
  }

  static void sendEmail(String emailAddress) async {
    final Uri launchUri = Uri(scheme: 'mailto', path: emailAddress);

    if (!await launchUrl(launchUri)) {
      // showToast(type: ToastType.error, message: "Failed to open email client");
    }
  }

  static void heroDialog(Widget child) {
    Navigator.push(
      rootNavigatorKey.currentState!.context,
      HeroDialogRoute(builder: (_) => child),
    );
  }

  static void showBottomSheet(Widget child) {
    showModalBottomSheet(
      context: rootNavigatorKey.currentState!.context,
      builder: (context) => child,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
    );
  }

  static Future<DateTime?> datePicker({DateTime? selectedDate}) async {
    final DateTime? picked = await showDatePicker(
      context: rootNavigatorKey.currentContext!,
      initialDate: selectedDate,
      firstDate: DateTime(2025),
      lastDate: DateTime.now(),
      builder: (BuildContext context, Widget? child) {
        return child!;
      },
    );
    return picked;
  }

  static void toastSuccess(String message, {String title = "Success"}) {
    CoreUtils._toast(
      title: title,
      message: message,
      type: ToastificationType.success,
      color: AppColors.success,
    );
  }

  static void toastError(String message, {String title = "Error"}) {
    CoreUtils._toast(
      title: title,
      message: message,
      type: ToastificationType.error,
      color: AppColors.error,
    );
  }

  static void _toast({
    required String title,
    required String message,
    required ToastificationType type,
    required Color color,
  }) {
    toastification.show(
      type: type,
      style: ToastificationStyle.fillColored,
      title: Text(
        title,
        style: rootNavigatorKey.currentContext!.bodyLarge.copyWith(
          color: AppColors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
      description: Text(
        message,
        style: rootNavigatorKey.currentContext!.bodyMedium.copyWith(
          color: AppColors.white,
          fontWeight: FontWeight.w500,
        ),
      ),
      closeButton: ToastCloseButton(
        showType: CloseButtonShowType.always,
        buttonBuilder: (context, onClose) {
          return GestureDetector(
            onTap: onClose,
            child: SvgIcon(SolarIcons.closeCircle, color: AppColors.white),
          );
        },
      ),
      closeOnClick: false,
      dragToClose: true,
      showIcon: false,
      alignment: Alignment.bottomCenter,
      primaryColor: color,
      autoCloseDuration: const Duration(seconds: 5),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      borderRadius: BorderRadius.circular(12),
    );
  }
}

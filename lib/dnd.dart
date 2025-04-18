
import 'package:do_not_disturb/do_not_disturb_plugin.dart';
import 'package:do_not_disturb/types.dart';

import 'action.dart';

final dndPlugin = DoNotDisturbPlugin();

void setDND(DNDState state) async {
  if (state == DNDState.ON) {
    await dndPlugin.setInterruptionFilter(InterruptionFilter.none);
  } else {
    await dndPlugin.setInterruptionFilter(InterruptionFilter.all);
  }
}

Future<void> getDNDPermission() async {
  if (!await dndPlugin.isNotificationPolicyAccessGranted()) {

    await dndPlugin.openNotificationPolicyAccessSettings();
  }
}
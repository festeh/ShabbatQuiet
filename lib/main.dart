
import 'package:flutter/material.dart';
import 'package:shabbatquiet/dnd.dart';
import 'package:uuid/uuid.dart';
import 'package:workmanager/workmanager.dart';

import 'action.dart';
import 'hebcal.dart';


Future<void> scheduleNextTask() async {
  print("[WORKMANAGER] inside schedule task");
  final constraints = Constraints(
    networkType: NetworkType.connected,
  );

  print("[WORKMANAGER] Scheduling next task");
  await Workmanager().registerOneOffTask(
    "schedule-next-${Uuid().v4()}",
    "scheduleNext",
    initialDelay: Duration(seconds: 5),
    constraints: constraints
  );
}

Future<void> calculateAndScheduleTask() async {
  //final hebcalOutput = await callHebcal();
  //final action = calculateAction(hebcalOutput.items);
  print("[WORKMANAGER] inside calculate and schedule task");
  await scheduleNextTask();
}

@pragma('vm:entry-point') // Mandatory if the App is obfuscated or using Flutter 3.1+
void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    print("[WORKMANAGER] Native called background task: $task"); //simpleTask will be emitted here.
    await calculateAndScheduleTask();
    return Future.value(true);
  });
}


void main() {
  //WidgetsFlutterBinding.ensureInitialized();
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<StatefulWidget> createState() {
    return MainState();
  }
}

class MainState extends State<MainApp>  {

  late final AppLifecycleListener listener;

  @override
  void initState() {
    super.initState();
    listener = AppLifecycleListener(
      onResume: () { resumeApp(); }
    );
    getDNDPermission();
    resumeApp();
  }

  Future<void> resumeApp() async {
    print("App is resumed");
    if (await dndPlugin.isNotificationPolicyAccessGranted()
    ) {
      print("DND access granted! Starting workmanager loop...");
      Workmanager().initialize(
          callbackDispatcher,
          isInDebugMode: true
      );
      calculateAndScheduleTask();
    }
  }

  @override
  void dispose() {
    listener.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Shabbat Shalom!',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              const Text(
                'Locale: Berlin, Germany',
                style: TextStyle(
                  fontSize: 18,
                  fontStyle: FontStyle.italic,
                  // color: Colors.blue,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

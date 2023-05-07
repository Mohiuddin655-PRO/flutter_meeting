import 'package:flutter/material.dart';

class Bundle {}

abstract class Activity extends StatefulWidget implements Listener {
  const Activity({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ActivityState();
  }

  Widget onCreateView(BuildContext context);

  void onNotify();

  void onCreate(Bundle saveInstance) {}

  void onStart() {}

  void onResume() {}

  void onPause() {}

  void onStop() {}

  void onRestart() {}

  void onDetached() {}

  void onDestroy() {}
}

abstract class Listener {
  void listen();
}

class _ActivityState extends State<Activity> with WidgetsBindingObserver {
  @override
  Widget build(BuildContext context) {
    return widget.onCreateView(context);
  }

  @override
  void initState() {
    widget.onCreate(Bundle());
    super.initState();
  }

  @override
  void didUpdateWidget(covariant Activity oldWidget) {
    widget.onStart();
    super.didUpdateWidget(oldWidget);
  }

  @override
  void activate() {
    widget.onRestart();
    super.activate();
  }

  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
  }

  @override
  void deactivate() {
    widget.onStop();
    super.deactivate();
  }

  @override
  void dispose() {
    widget.onDestroy();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        widget.onResume();
        break;
      case AppLifecycleState.inactive:
        widget.onStop();
        break;
      case AppLifecycleState.paused:
        widget.onPause();
        break;
      case AppLifecycleState.detached:
        widget.onDetached();
        break;
    }
    super.didChangeAppLifecycleState(state);
  }

  void onNotify() {
    setState(() {});
  }
}

import 'dart:async';

import 'package:cybear_jinni/domain/devices/generic_smart_tv/generic_smart_tv_entity.dart';
import 'package:cybear_jinni/utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SmartTvPage extends StatefulWidget {
  const SmartTvPage(this.genericSmartTvSmartTv);

  final GenericSmartTvDE genericSmartTvSmartTv;

  @override
  State<StatefulWidget> createState() {
    return _SmartSmartTvPage();
  }
}

class _SmartSmartTvPage extends State<SmartTvPage> {
  bool _switchState = false;
  GenericSmartTvDE? _switch;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _switch = widget.genericSmartTvSmartTv;
    getAndUpdateState();

    WidgetsBinding.instance
        .addObserver(LifecycleEventHandler(resumeCallBack: getAndUpdateState));
  }

  Future<void> getAndUpdateState() async {
    try {
      // final bool stateValue = await getSmartTvAction();
      if (mounted) {
        _isLoading = false;
        setState(() {
          // _switchState = stateValue;
        });
      }
    } catch (exception) {
      logger.e('Error when updating state after resume\n$exception');
    }
  }

  // //  Send request to switch to retrieve his state on or off
  // Future<bool> getSmartTvAction() async {
  //   return _switchState = EnumHelperCbj.stringToDeviceAction(
  //         _switch!.com!.getOrCrash(),
  //       ) ==
  //       DeviceActions.on;
  // }
  //
  // Future<void> _onChange(bool value) async {
  //   logger.v('OnChange $value');
  //   _switch?.switchState = GenericSmartTvSmartTvState(
  //     EnumHelperCbj.deviceActionToString(
  //       value ? DeviceActions.on : DeviceActions.off,
  //     ),
  //   );
  //   if (mounted) {
  //     setState(() {
  //       _switchState = value;
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Column(
      children: <Widget>[
        Text(
          _switch!.defaultName.getOrCrash()!, //  Show switch name
          style: TextStyle(
            fontSize: 19.0,
            color: Theme.of(context).textTheme.bodyText2!.color,
          ),
        ),
        const SizedBox(
          height: 3,
        ),
        if (_isLoading)
          const Center(child: CircularProgressIndicator())
        else
          const Text('Smart Tv Widget'),
      ],
    );
  }
}

class LifecycleEventHandler extends WidgetsBindingObserver {
  LifecycleEventHandler({
    this.resumeCallBack,
    this.suspendingCallBack,
  });

  final AsyncCallback? resumeCallBack;
  final AsyncCallback? suspendingCallBack;

  @override
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
    switch (state) {
      case AppLifecycleState.resumed:
        if (resumeCallBack != null) {
          await resumeCallBack!();
        }
        break;
      case AppLifecycleState.inactive:
      case AppLifecycleState.paused:
      case AppLifecycleState.detached:
        if (suspendingCallBack != null) {
          await suspendingCallBack!();
        }
        break;
    }
  }
}

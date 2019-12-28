import 'package:flutter/material.dart';

import 'package:supercharged/supercharged.dart';

class DeviceInfoDrawer extends StatelessWidget {
  final Map<String, dynamic> _deviceData;

  DeviceInfoDrawer({@required Map<String, dynamic> deviceDate})
      : assert(deviceDate != null),
        _deviceData = deviceDate;

  @override
  Widget build(BuildContext context) {
    return Container(
        color: '#2e3440'.toColor(),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                  height: 20.0,
                  child: Text('Device Info',
                      style: TextStyle(
                          color: '#eceff4'.toColor(), fontSize: 18.0))),
              ListView(
                shrinkWrap: true,
                children: _deviceData.keys.map((String property) {
                  return Row(
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.fromLTRB(8.0, 4.0, 0.0, 4.0),
                        child: Text(
                          property,
                          style: TextStyle(
                            color: '#eceff4'.toColor(),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Expanded(
                          child: Container(
                        padding:
                            const EdgeInsets.fromLTRB(8.0, 4.0, 0.0, 4.0),
                        child: Text(
                          '${_deviceData[property]}',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(color: '#eceff4'.toColor()),
                        ),
                      )),
                    ],
                  );
                }).toList(),
              ),
            ]));
  }
}

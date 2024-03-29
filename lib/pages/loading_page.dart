import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';
import 'package:signals/signals_flutter.dart';
import 'package:student_checkin_app/mqtt.dart';
import 'package:student_checkin_app/store/app_store.dart';

class LoadingPage extends StatelessWidget {
  LoadingPage({super.key}) {
    mqttClient = setupMqtt();
  }

  MqttServerClient? mqttClient;

  final textCtrl = TextEditingController(text: 'OK');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Loading'),
      ),
      body: Column(
        children: [
          FilledButton(
            onPressed: () {
              context.go('/login');
            },
            child: Watch((context) => Text('${AppStore.message.value}')),
          ),
          TextField(
            controller: textCtrl,
          ),
          OutlinedButton(
              onPressed: () {
                final payload = {
                  'from': 'flutter',
                  'message': textCtrl.text,
                };
                final builder = MqttClientPayloadBuilder();
                builder.addString(jsonEncode(payload));
                final data = builder.payload!;

                mqttClient!.publishMessage('chat', MqttQos.atMostOnce, data,
                    retain: false);
              },
              child: Text('Send')),
        ],
      ),
    );
  }
}

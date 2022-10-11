import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class MessengerPage extends StatelessWidget {
  final logic = Get.put(MessengerLogic());
  final state = Get.find<MessengerLogic>().state;

  MessengerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

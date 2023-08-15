import 'package:flutter/material.dart';
import 'package:get/get.dart';

mixin Messages on GetxController {
  
  void messageListener(Rxn<MessagesModel> message) {
    ever(message, (model) async {
      if (model != null) {
        Get.snackbar(
          model.title,
          model.message,
          icon: model.type.iconMessage(),
          backgroundColor: model.type.color(),
          colorText: model.type.textColor(),
          margin: const EdgeInsets.all(20),
        );
      }
    });
  }

}

class MessagesModel {
  final String title;
  final String message;
  final MessageType type;
  MessagesModel({
    this.title = '',
    this.message = '',
    required this.type,
  });

  MessagesModel.error({
    this.title = '',
    this.message = '',
  }) : type = MessageType.error;

  MessagesModel.info({
    this.title = '',
    this.message = '',
  }) : type = MessageType.info;

  MessagesModel.success({
    this.title = '',
    this.message = '',
  }) : type = MessageType.success;
}

enum MessageType { error, info, success }

extension MessageTypeExtension on MessageType {
  Color color() {
    switch (this) {
      case MessageType.error:
        return Colors.red[800]!;
      case MessageType.info:
        return Colors.blue[200]!;
      case MessageType.success:
        return Colors.green[400]!;
    }
  }

  Color textColor() {
    switch (this) {
      case MessageType.error:
        return Colors.white;
      case MessageType.info:
        return Colors.black;
      case MessageType.success:
        return Colors.white;
    }
  }

  Icon iconMessage() {
    switch (this) {
      case MessageType.error:
        return const Icon(Icons.error_outline, color: Colors.white);
      case MessageType.info:
        return const Icon(Icons.info_outline, color: Colors.black);
      case MessageType.success:
        return const Icon(Icons.check_circle_outline, color: Colors.white);
    }
  }
}

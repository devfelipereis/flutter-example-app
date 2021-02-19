import 'dart:io';

import 'package:bot_toast/bot_toast.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ErrorHandlerService {
  static String getErrorMessage(dynamic error) {
    if (error == null) {
      throw Exception('TypeError: error is null');
    }

    if (error is DioError) {
      return getErrorMesssageForDio(error);
    }

    throw Exception(error);
  }

  static String getErrorMesssageForDio(DioError e) {
    String message = 'Ocorreu um erro desconhecido. Tente novamente.';

    if (e.response == null) {
      if (e.error is SocketException) {
        message = 'O servidor não respondeu a solicitação. Tente novamente.';
      } else if (e.error is HttpException) {
        message = "Não foi possível verificar os dados";
      } else if (e.error is FormatException) {
        message = "Não foi possível verificar os dados";
      } else if (e.type == DioErrorType.RECEIVE_TIMEOUT) {
        message =
            "Houve um atraso na resposta e não conseguimos atualizar os dados.";
      }
      return message;
    }

    switch (e.response.statusCode) {
      case 401:
        message = "Usuário não autenticado ou sem permissão";
        break;
      case 404:
        message = "Não foi possível verificar os dados";
        break;
      case 405:
        message = "Não foi possível prosseguir com sua solicitação.";
        break;
      case 500:
        message = "Houve um erro do lado do servidor. Tente novamente.";
        break;
    }

    if (e.response.statusCode == 422) {
      final responseData = e.response.data;
      if (responseData.containsKey('errors') != null) {
        final errors = e.response.data['errors'];
        message = removeAllHtmlTags(errors.values.first[0].toString());
      } else {
        message = e.response.data['message'] as String;
      }
      if (message.isEmpty) {
        message = "Não foi possível prosseguir com sua solicitação.";
      }
    }

    return message;
  }

  static void showErrorToast(dynamic error) {
    BotToast.showText(text: error.toString(), contentColor: Colors.redAccent);
  }
}

String removeAllHtmlTags(String htmlText) {
  final exp = RegExp(r"<[^>]*>", multiLine: true);

  return htmlText.replaceAll(exp, '');
}

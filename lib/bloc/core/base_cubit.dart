import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../exceptions/api_exception.dart';
import '../../models/handled_error.dart';
import '../../utils/logging.dart';

abstract class BaseCubit<TState> extends Cubit<TState> {
  BaseCubit(TState initialState) : super(initialState);

  void handleError(HandledError error);

  Future<void> makeErrorHandledCall(AsyncCallback callback) async {
    try {
      await callback();
    } on PlatformException catch (exception, stackTrace) {
      Logging.error(
        className: runtimeType.toString(),
        message: 'PlatformException in makeErrorHandledCall()',
        error: exception,
        stackTrace: stackTrace,
      );
    } on ApiException catch (exception, stackTrace) {
      Logging.error(
        className: runtimeType.toString(),
        message: 'ApiException in makeErrorHandledCall()',
        error: exception,
        stackTrace: stackTrace,
      );
    } catch (exception, stackTrace) {
      Logging.error(
        className: runtimeType.toString(),
        message: 'Error in makeErrorHandledCall()',
        error: exception,
        stackTrace: stackTrace,
      );
    }
  }
}

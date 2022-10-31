import 'dart:async';
import 'dart:convert';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/active_symbols/active_symbols.dart';
import '../../models/base_response/base_response.dart';
import '../../models/web_socket_response/web_socket_response.dart';
import '../../resources/repositories/repository.dart';
part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(ActiveSymbolsInitial());
  StreamController? _webSocketStream;
  final List<String> _marketsList = [];
  final List<String> _symbolsList = [];
  final List<ActiveSymbols> _activeSymbols = [];
  double? _price;

  getWebSocketStream() {
    _webSocketStream = Repository.instance.init();
    Repository.instance.getActiveSymbols();
    _webSocketStream!.stream.listen(
      (event) {
        try {
          var response = BaseResponse<WebSocketResponse>(
              isSucceed: true, data: WebSocketResponse.fromJson(json.decode(event)), error: null);
          if (response.data!.msgType == "active_symbols") {
            _activeSymbols.addAll(response.data!.activeSymbols!);
            for (var element in _activeSymbols) {
              if (!_marketsList.contains(element.marketDisplayName)) _marketsList.add(element.marketDisplayName!);
            }
            emit(ActiveSymbolsLoaded(_marketsList));
          } else if (response.data!.msgType == 'tick') {
            if (response.data!.tick != null && response.data!.error == null) {
              Color? color;
              if (_price != null) {
                if (_price == response.data!.tick!.quote) {
                  color = Colors.grey;
                } else if (_price! > response.data!.tick!.quote!) {
                  color = Colors.red;
                } else {
                  color = Colors.green;
                }
              }
              _price = response.data!.tick!.quote!;
              emit(TicksLoaded(response.data!.tick!.quote!, response.data!.tick!.id!, color ?? Colors.grey));
            } else {
              emit(const TicksLoadedWithError());
            }
          }
        } catch (error) {
          emit(const ErrorState());
        }
      },
      onError: (error) {
        emit(const ErrorState());
      },
    );
  }

  selectMarket(
    String market,
    String? oldSymbolId,
  ) {
    _symbolsList.clear();
    if (oldSymbolId != null) {
      Repository.instance.forget(id: oldSymbolId);
    }
    for (var element in _activeSymbols) {
      if (element.marketDisplayName == market && !_symbolsList.contains(element.symbol)) {
        _symbolsList.add(element.symbol!);
      }
    }
    emit(MarketSelected(market, _symbolsList));
  }

  selectSymbol(String symbol, String? oldSymbolId, BuildContext context) {
    emit(SymbolSelected(symbol));
    if (oldSymbolId != null) {
      Repository.instance.forget(id: oldSymbolId);
    }
    _price = null;
    Repository.instance.getTicks(symbol: symbol);
  }

  void dispose() {
    _webSocketStream!.sink.close();
  }
}

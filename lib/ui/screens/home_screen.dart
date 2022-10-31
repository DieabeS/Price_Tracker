import '../widgets/custom_drop_down_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cubit/app_cubit/app_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? _marketValue;
  String? _symbolValue;
  final List<String> _marketsList = [];
  final List<String> _symbolsList = [];
  String? _symbolId;

  @override
  void initState() {
    BlocProvider.of<AppCubit>(context).getWebSocketStream();
    super.initState();
  }

  @override
  void dispose() {
    BlocProvider.of<AppCubit>(context).dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Price Tracker'),
        centerTitle: true,
      ),
      body: BlocBuilder<AppCubit, AppState>(
        builder: ((context, state) {
          if (state is! ActiveSymbolsInitial) {
            if (state is ActiveSymbolsLoaded) {
              _marketsList.addAll(state.marketsList);
            } else if (state is MarketSelected) {
              _symbolsList.clear();
              _marketValue = state.market;
              _symbolsList.addAll(state.symbolsList);
            } else if (state is SymbolSelected) {
              _symbolValue = state.symbol;
            } else if (state is TicksLoaded) {
              _symbolId = state.id;
            }
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  SizedBox(
                    height: height / 12,
                  ),
                  CustomDropDownButton(
                    text: 'Select a market',
                    selectedValue: _marketValue,
                    onValueSelected: (value) {
                      _symbolValue = null;
                      BlocProvider.of<AppCubit>(context).selectMarket(value, _symbolId);
                      _symbolId = null;
                    },
                    items: _marketsList,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomDropDownButton(
                    text: 'Select a symbol',
                    selectedValue: _symbolValue,
                    onValueSelected: (value) {
                      BlocProvider.of<AppCubit>(context).selectSymbol(value, _symbolId, context);
                      _symbolId = null;
                    },
                    items: _symbolsList,
                  ),
                  const Spacer(),
                  if (state is TicksLoaded && _symbolValue != null)
                    Text(
                      state.price.toString(),
                      style: TextStyle(fontSize: 25, color: state.color),
                    ),
                  if (state is SymbolSelected) const CircularProgressIndicator(),
                  if (state is TicksLoadedWithError) const Text('Selected Market is closed at the moment'),
                  const Spacer(flex: 3),
                ],
              ),
            );
          } else if (state is ErrorState) {
            return const Center(child: Text("Invalid Data"));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        }),
      ),
    );
  }
}

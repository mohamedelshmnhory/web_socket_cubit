import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:markets/cubit/markets_cubit.dart';

import 'dependencies/dependency_init.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const title = ' Price Tracker';
    return const MaterialApp(title: title, home: MyHomePage(title: title));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final MarketsCubit marketsCubit = getIt<MarketsCubit>();

  @override
  void initState() {
    super.initState();
    marketsCubit.getActiveSymbols();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: BlocConsumer(
          bloc: marketsCubit,
          listener: (context, state) {},
          builder: (context, state) {
            if (state is GetActiveSymbolsLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 24),
                  DropdownButton<String>(
                    hint: const Text('Select A Market'),
                    value: marketsCubit.selectedMarket,
                    items: marketsCubit.markets.keys.map((e) => DropdownMenuItem<String>(value: e, child: Text(e))).toList(),
                    onChanged: (value) {
                      if (value != null) marketsCubit.changeMarket(value);
                    },
                    isExpanded: true,
                  ),
                  const SizedBox(height: 24),
                  DropdownButton<String>(
                    hint: const Text('Select An Asset'),
                    value: marketsCubit.selectedSymbol,
                    items: marketsCubit.markets[marketsCubit.selectedMarket]
                        ?.map((e) => DropdownMenuItem<String>(value: e.symbol, child: Text(e.symbol ?? '')))
                        .toList(),
                    onChanged: (value) {
                      marketsCubit.selectedSymbol = value;
                      if (value != null) {
                        marketsCubit.getPrice(value);
                      }
                    },
                    isExpanded: true,
                  ),
                  const SizedBox(height: 50),
                  state is GetPriceLoading
                      ? const Center(child: CircularProgressIndicator())
                      : state is GetPriceSuccess
                          ? Text(
                              'Price : ${state.response.tick?.quote ?? 0}',
                              style: Theme.of(context).textTheme.headline4,
                            )
                          : const SizedBox(),
                ],
              ),
            );
          },
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

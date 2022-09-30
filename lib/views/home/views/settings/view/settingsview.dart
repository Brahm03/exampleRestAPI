import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:materialyou/views/home/views/home/cubit/home_cubit.dart';
import 'package:materialyou/views/home/views/settings/cubit/settings_cubit.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SettingsCubit(),
      child: Scaffold(
        body: SafeArea(
          child: BlocBuilder<SettingsCubit, SettingsState>(
            builder: (context, state) {
              if (state is SettingsInitial) {
                return SizedBox(
                    height: double.infinity,
                    child: Column(
                      children: [
                        Card(
                          child: CupertinoSearchTextField(
                            onChanged: (v) => context.read<SettingsCubit>().searchData(v),
                          )
                        ),
                        Expanded(
                          child: context.watch<SettingsCubit>().temp.isNotEmpty ? Column(
                            children: [ Text('ITEMS ${context.watch<SettingsCubit>().temp.length} found'),Expanded(
                              child: ListView.builder(
                                  itemCount:
                                      context.watch<SettingsCubit>().temp.toList().length,
                                  itemBuilder: (context, index) {
                                    debugPrint('item $index');
                                    var data = context
                                        .watch<SettingsCubit>()
                                        .temp
                                        .toList()[index];
                                    return Card(
                                      color: Colors.red,
                                      child: ListTile(
                                        subtitle: Text(data['product_id'].toString()),
                                        title: Text(data['name']),
                                      ),
                                    );
                                  }),
                            ),
                      ]) : const Center(child: Text('NOTHING')),
                        )
                      ],
                    ));
              } else if (state is SearchError) {
                return const Center(
                  child: Text('error'),
                );
              } else {
                return Expanded(
                    child:  Column(
                  children: [
                    Autocomplete<String>(optionsBuilder: (textEditingValue) {
                      BlocProvider.of<SettingsCubit>(context)
                          .searchData(textEditingValue.text);
                      return HomeCubit.globalData.map((e) {
                        debugPrint(e['name'].toString());
                        if (e['name'].toString().toLowerCase().contains(
                            textEditingValue.text.toString().toLowerCase())) {
                          return e['name'];
                        }

                        return '';
                      });
                    }),
                  ],
                ));
              }
            },
          ),
        ),
      ),
    );
  }
}

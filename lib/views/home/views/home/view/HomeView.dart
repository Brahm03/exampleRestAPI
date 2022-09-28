import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:materialyou/views/home/views/home/cubit/home_cubit.dart';
import 'package:materialyou/views/home/views/home/state/home_state.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => HomeCubit()..getData(),
        child: BlocConsumer<HomeCubit, HomeStates>(listener: (context, state) {
          if (state is HomeErrorState) {
            debugPrint('ERROR STATE');
            return;
          }
        }, builder: (context, state) {
          return Scaffold(
            floatingActionButton: FloatingActionButton(
              backgroundColor: CupertinoColors.systemGreen,
              onPressed: () => context
                  .read<HomeCubit>()
                  .addData(context: context, name: 'Artel', id: 20),
              child: const Icon(Icons.add),
            ),
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              title: const Text(
                'Home Page',
                style: TextStyle(color: CupertinoColors.activeGreen),
              ),
            ),
            body: BlocBuilder<HomeCubit, HomeStates>(builder: (context, state) {
              if (state is HomeInitialState) {
                return const Center(
                  child: CircularProgressIndicator.adaptive(),
                );
              } else if (state is HomeCompletedState) {
                debugPrint(state.data[0].toString());
                return RefreshIndicator(
                  onRefresh: () => context.read<HomeCubit>().getData(),
                  child: SizedBox(
                      child: ListView.builder(
                          itemCount: state.data.length,
                          itemBuilder: (_, index) {
                            return Slidable(
                              endActionPane: ActionPane(
                                  motion: const ScrollMotion(),
                                  children: [
                                    SlidableAction(
                                      onPressed: (v) => context.read<HomeCubit>().delateData(state.data[index]['id'].toString(), context),
                                      icon: Icons.delete,
                                      backgroundColor: Colors.red,
                                    )
                                  ]),
                              child: Card(
                                color: CupertinoColors.systemGreen,
                                child: ListTile(
                                  leading: CircleAvatar(
                                    backgroundColor: Colors.white,
                                    child: Text(
                                        state.data[index]['id'].toString()),
                                  ),
                                  title: Text(
                                      state.data[index]['attributes']['name']),
                                ),
                              ),
                            );
                          })),
                );
              } else {
                return const Center(
                  child: SizedBox(
                    child: Text('no internet'),
                  ),
                );
              }
            }),
          );
        }));
  }
}

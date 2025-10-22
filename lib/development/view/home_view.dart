import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_use_case/core/data/model/user.dart';
import 'package:flutter_use_case/development/view/mixin/home_view_mixin.dart';
import 'package:flutter_use_case/development/viewmodel/home_view_model.dart';
import 'package:flutter_use_case/development/viewmodel/state/home_state.dart';
import 'package:flutter_use_case/product/service/manager/product_service_manager.dart';
import 'package:flutter_use_case/product/state/base/base_state.dart';

part './widget/home_app_bar.dart';

class HomeView extends StatefulWidget  {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeState();
}

class _HomeState extends BaseState<HomeView> with HomeViewMixin {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => homeViewModel,  
      child: Scaffold(
        appBar: const _HomeAppBar(),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            homeViewModel.changeLoading();
            await homeViewModel.fetchUsers();
          }
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: _UserList()
            )
          ],
        ),
      )
    );
  }

  @override
  // TODO: implement productNetworkManager
  ProductNetworkManager get productNetworkManager => throw UnimplementedError();
}

final class _UserList extends StatelessWidget {
  const _UserList();

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeViewModel, HomeState>(
      listener: (context, state) {
        print(state.users);
      },
      child: BlocSelector<HomeViewModel, HomeState, List<User>>(
        selector: (state) {
          return state.users ?? [];
        },
        builder: (context, state) {
          if(state.isEmpty) return SizedBox.shrink();
          return ListView.builder(
          itemCount: state.length,
          itemBuilder: (context, index){
            return ListTile(
              title: Text(state[index].username.toString()),
              subtitle: Text(state[index].email.toString()),
            );
          }
        );
        },
      ),
    );
  }
}
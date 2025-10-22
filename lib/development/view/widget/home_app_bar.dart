part of '../home_view.dart';

class _HomeAppBar extends StatelessWidget implements PreferredSizeWidget{
  const _HomeAppBar();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
       const _LoadingState()
      ],
    );
  }
  
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _LoadingState extends StatelessWidget {
  const _LoadingState();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeViewModel, HomeState>(
      builder: (context, state) {
        if (state.isLoading) return const SizedBox.shrink();
        return CircularProgressIndicator.adaptive();
      }
    );
  }
}
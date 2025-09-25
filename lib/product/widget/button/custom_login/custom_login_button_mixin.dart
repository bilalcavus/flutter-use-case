
part of 'custom_login_button.dart';

mixin _CustomLoginButtonMixin on MountedMixin<CustomLoginButton>, State<CustomLoginButton> {
  final ValueNotifier<bool> _isLoadingNotifier = ValueNotifier<bool>(false);

  @override
  void initState() {
    _isLoadingNotifier.value = false;
    super.initState();
  }

    Future<void> _onTap(BuildContext context) async {
    _isLoadingNotifier.value = true;
    final response = await widget.onOperation.call();
    await safeOperation(() async {
        if (response) Navigator.of(context).pop();
        _isLoadingNotifier.value = false;
      }
    );
  }
}
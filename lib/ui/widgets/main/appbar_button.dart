part of '../widgets.dart';

class CustomAppBarButton extends StatelessWidget {
  final void Function() onPressed;
  final String buttonTitle;
  final IconData buttonIcon;
  final bool active;

  const CustomAppBarButton({
    super.key,
    required this.onPressed,
    required this.buttonTitle,
    required this.buttonIcon,
    required this.active,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            buttonIcon,
            color: active == true ? primaryColor : darkGrey,
            size: 20.sp,
          ),
          Text(
            buttonTitle,
            style: TextStyle(color: active == true ? primaryColor : darkGrey),
          ),
        ],
      ),
    );
  }
}

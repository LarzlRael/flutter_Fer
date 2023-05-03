part of 'widgets.dart';

/* Widget singleButton(
  BuildContext context,
  String title,
  String navigatorName, {
  Color color = Colors.blue,
}) {
  return Container(
    width: double.infinity,
    child: ElevatedButton(
      onPressed: () {
        Navigator.pushReplacementNamed(context, navigatorName);
        print('nos vamos a $navigatorName');
      },
      style: buttonStyle(color),
      child: Text(title),
    ),
  );
}

ButtonStyle buttonStyle(Color color) {
  return TextButton.styleFrom(
    primary: Colors.white,
    padding: EdgeInsets.symmetric(horizontal: 16.0),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(10),
        topRight: Radius.circular(10),
      ),
    ),
    backgroundColor: color,
  );
} */

class CurvedButton extends StatelessWidget {
  final String title;
  /* callback */
  final void Function()? onPressed;
  final Color? backgroundColor;
  const CurvedButton({
    Key? key,
    required this.title,
    this.backgroundColor,
    this.onPressed,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: FilledButton(
        style: FilledButton.styleFrom(
          backgroundColor:
              backgroundColor ?? Theme.of(context).colorScheme.primary,
          padding: EdgeInsets.symmetric(horizontal: 14.0),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
          ),
        ),
        onPressed: () {
          onPressed!();
        },
        child: Text(title),
      ),
    );
  }
}

class GhostCurvedButton extends StatelessWidget {
  final String title;
  /* callback */
  final void Function()? onPressed;
  final Color? backgroundColor;
  const GhostCurvedButton({
    Key? key,
    required this.title,
    this.backgroundColor,
    this.onPressed,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
        style: FilledButton.styleFrom(
          /* textStyle: TextStyle(
            color: backgroundColor ?? Theme.of(context).colorScheme.primary,
          ), */

          side: BorderSide(
            color: backgroundColor ?? Theme.of(context).colorScheme.primary,
          ),

          /* backgroundColor:
              backgroundColor ?? Theme.of(context).colorScheme.primary, */
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          title,
          style: TextStyle(
              color: backgroundColor ?? Theme.of(context).colorScheme.primary),
        ),
      ),
    );
  }
}

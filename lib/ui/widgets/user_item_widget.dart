part of 'widgets.dart';

class UserItemWidget extends StatelessWidget {
  const UserItemWidget({Key? key, this.userModel}) : super(key: key);

  final UserModel? userModel;

  @override
  Widget build(BuildContext context) {
    final double heightScreen = MediaQuery.of(context).size.height;
    final double widthScreen = MediaQuery.of(context).size.width;

    return Row(
      children: <Widget>[
        Container(
          color: Colors.green,
          height: heightScreen * 0.13,
          width: widthScreen * 0.22,
          child: Image.network(userModel!.avatarUrl!, fit: BoxFit.cover,),
        ),
        Container(
            margin: EdgeInsets.only(left: widthScreen * 0.05),
            child: Text(userModel!.login!))
      ],
    );
  }
}

part of 'widgets.dart';

class IssueItemWidget extends StatelessWidget {
  IssueItemWidget({Key? key, this.issueModel}) : super(key: key);

  final IssueModel? issueModel;
  late UserModel avatarUser;

  @override
  Widget build(BuildContext context) {
    final double heightScreen = MediaQuery.of(context).size.height;
    final double widthScreen = MediaQuery.of(context).size.width;

    DateTime updatedAt = DateTime.parse(issueModel!.updatedAt!);

    avatarUser = UserModel.fromJson(issueModel!.user!);

    return Container(
      width: widthScreen,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Expanded(
            flex: 25,
            child: Container(
              color: Colors.green,
              height: heightScreen * 0.13,
              child: Image.network(avatarUser.avatarUrl!, fit: BoxFit.cover,),
            ),
          ),
          Expanded(
            flex: 50,
            child: Container(
              margin: EdgeInsets.only(left: widthScreen * 0.03),
              child: Column(
                children: [
                  Container(
                      margin: EdgeInsets.only(bottom: heightScreen * 0.01),
                      alignment: Alignment.centerLeft,
                      child: AutoSizeText(issueModel!.title!, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),)),
                  Container(
                      alignment: Alignment.centerLeft,
                      child: AutoSizeText("${(updatedAt.day < 10) ? "0${updatedAt.day}" : updatedAt.day}/${(updatedAt.month < 10) ? "0${updatedAt.month}" : updatedAt.month}/${updatedAt.year}")),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 25,
            child: Container(
                alignment: Alignment.center,
                child: AutoSizeText(issueModel!.state!)),
          ),
        ],
      ),
    );
  }
}

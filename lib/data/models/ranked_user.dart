const testImage1 =
    "https://pickaface.net/gallery/avatar/PKSToMa56565347d918a.png";
const testImage2 =
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRnRWY_gGQRttc1vDM4LApEo15v3mrisyxPiQ&usqp=CAU";
const testImage3 =
    "https://img.freepik.com/free-icon/soccer-player_318-174101.jpg?w=2000";
const testImage4 =
    "https://thumbs.dreamstime.com/b/avatar-man-soccer-player-graphic-sports-clothes-front-view-over-isolated-background-illustration-73244786.jpg";

class RankedUser {
  final String name;
  final String id;
  final String img;
  final int score;

  RankedUser(
      {required this.name,
      required this.id,
      required this.img,
      required this.score});
}

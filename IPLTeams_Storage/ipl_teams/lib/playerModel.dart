class Playermodel{
  final String playerName;
  final String jersyno;
  final String teamName;
  final String profilepic;
  Playermodel({
    required this.profilepic,
    required this.playerName,
    required this.jersyno,
    required this.teamName
  });
  @override
  String toString() {
    return 'Players(playerName: $playerName, jersyno: $jersyno, teamName: $teamName, profilepic: $profilepic)';
  }

}
class InfoItem {
  final String title;
  final String imgUrl;
  final String source;
  final String time;
  final String jumpUrl;

  const InfoItem(this.title, this.imgUrl, this.source, this.time, this.jumpUrl);
}

const List<InfoItem> infoData = [
  const InfoItem(
      '置业选择 | 三室一厅 河间的古雅别院',
      'https://wx2.sinaimg.cn/mw1024/005SQLxwly1g6f89l4obbj305v04fjsw.jpg',
      "新华网",
      "两天前",
      'login'),
  const InfoItem(
      '置业佳选 | 大理王宫 苍山洱海间的古雅别院',
      'https://wx2.sinaimg.cn/mw1024/005SQLxwly1g6f89l6hnsj305v04fab7.jpg',
      "新华网",
      "一周前",
      'login'),
  const InfoItem(
      '置业选择 | 安居小屋 花园洋房 清新别野 山清水秀',
      'https://wx4.sinaimg.cn/mw1024/005SQLxwly1g6f89l5jlyj305v04f75q.jpg',
      "腾讯网",
      "两周前",
      'login'),
  const InfoItem(
      '置业选择 | 安居小屋 花园洋房 清新别野',
      'https://wx2.sinaimg.cn/mw1024/005SQLxwly1g6f89l6hnsj305v04fab7.jpg',
      "凤凰网",
      "一天前",
      'login'),
  const InfoItem(
      '置业选择 | 安居小屋 花园洋房 清新别野',
      'https://wx4.sinaimg.cn/mw1024/005SQLxwly1g6f89l5jlyj305v04f75q.jpg',
      "搜狐网",
      "三天前",
      'login'),
];

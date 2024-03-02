import 'package:flutter/material.dart';
import 'package:flutter_rent_house/models/room_detail_data.dart';
import 'package:flutter_rent_house/pages/home/info/index.dart';
import 'package:flutter_rent_house/pages/room_detail/data.dart'
    as default_detail;
import 'package:flutter_rent_house/widgets/common_swiper.dart';
import 'package:flutter_rent_house/widgets/common_tag.dart';
import 'package:flutter_rent_house/widgets/common_title.dart';
import 'package:flutter_rent_house/widgets/room_appliance.dart';
import 'package:share/share.dart';

var btnTextStyle = TextStyle(fontSize: 20, color: Colors.white);

class RoomDetailPage extends StatefulWidget {
  final String roomId;

  const RoomDetailPage({super.key, required this.roomId});

  @override
  State<RoomDetailPage> createState() => _RoomDetailPageState();
}

class _RoomDetailPageState extends State<RoomDetailPage> {
  late RoomDetailData data;
  // 是否收藏
  bool isFav = false;
  // 展开&收起
  bool showAllText = false;

  @override
  void initState() {
    setState(() {
      data = default_detail.defaultData;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // 根据文字长度是否显示内容
    bool showTextTool = data.subTitle!.length > 100;
    return Scaffold(
      appBar: AppBar(
        title: Text(data.title ?? ''),
        actions: [
          IconButton(
              onPressed: () {
                Share.share('https://itcast.cn');
              },
              icon: const Icon(Icons.share))
        ],
      ),
      body: Stack(
        children: [
          ListView(
            children: [
              CommonSwiper(
                images: data.houseImgs,
              ),
              CommonTitle(data.title ?? ''),
              Container(
                padding: const EdgeInsets.only(left: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(data.price.toString(),
                        style:
                            const TextStyle(color: Colors.pink, fontSize: 20)),
                    const Text('元/月（押一付三）',
                        style: TextStyle(color: Colors.pink, fontSize: 14))
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 10, top: 6, bottom: 6),
                child: Wrap(
                  spacing: 4,
                  children: data.tags.map((item) => CommonTag(item)).toList(),
                ),
              ),
              const Divider(color: Colors.grey, indent: 10, endIndent: 10),
              Container(
                padding: const EdgeInsets.only(left: 10, top: 6, bottom: 6),
                child: Wrap(
                  runSpacing: 20,
                  children: [
                    BaseInfoItem('面积：${data.size}平米'),
                    BaseInfoItem('楼层：${data.floor}'),
                    BaseInfoItem('房型：${data.roomType}'),
                    BaseInfoItem('装修：精装'),
                  ],
                ),
              ),
              const CommonTitle('房屋配置'),
              RoomApplianceList(list: data.appliances),
              const CommonTitle('房屋概况'),
              Container(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data.subTitle ?? '暂无房屋概况！',
                      maxLines: showAllText ? null : 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        showTextTool
                            ? GestureDetector(
                                onTap: () {
                                  setState(() {
                                    showAllText = !showAllText;
                                  });
                                },
                                child: Row(
                                  children: [
                                    Text(showAllText ? '收起' : '展开'),
                                    Icon(showAllText
                                        ? Icons.keyboard_arrow_up
                                        : Icons.keyboard_arrow_down)
                                  ],
                                ),
                              )
                            : Container(),
                        Text('举报')
                      ],
                    )
                  ],
                ),
              ),
              const CommonTitle('猜你喜欢'),
              const Info()
            ],
          ),
          Positioned(
              width: MediaQuery.of(context).size.width,
              height: 100,
              bottom: 0,
              child: Container(
                padding: const EdgeInsets.only(
                    top: 10, left: 20, right: 20, bottom: 20),
                color: Colors.grey[200],
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isFav = !isFav;
                        });
                      },
                      behavior: HitTestBehavior.translucent,
                      child: Container(
                        width: 40,
                        height: 50,
                        margin: const EdgeInsets.only(right: 10),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(
                                isFav ? Icons.star : Icons.star_border,
                                size: 24,
                                color: isFav ? Colors.green : Colors.black,
                              ),
                              Text(
                                isFav ? '已收藏' : '收藏',
                                style: const TextStyle(fontSize: 12),
                              )
                            ]),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {},
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                              color: Colors.cyan,
                              borderRadius: BorderRadius.circular(6)),
                          child: Center(
                              child: Text(
                            '联系房东',
                            style: btnTextStyle,
                          )),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {},
                        child: Container(
                          margin: const EdgeInsets.only(left: 5),
                          height: 50,
                          decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(6)),
                          child:
                              Center(child: Text('预约看房', style: btnTextStyle)),
                        ),
                      ),
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }
}

class BaseInfoItem extends StatelessWidget {
  final String content;

  const BaseInfoItem(this.content, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: (MediaQuery.of(context).size.width - 3 * 10) / 2,
        child: Text(
          content,
          style: TextStyle(fontSize: 16),
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_rent_house/config.dart';
import 'package:flutter_rent_house/models/room_list_item_data.dart';
import 'package:flutter_rent_house/widgets/common_image.dart';
import 'package:flutter_rent_house/widgets/common_tag.dart';

class RoomListItemWidget extends StatelessWidget {
  final RoomListItemData data;

  const RoomListItemWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    var imgUrl = data.imageUrl.startsWith('http')
        ? data.imageUrl
        : Config.baseUrl + data.imageUrl;

    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed('/room/${data.id}');
      },
      child: Container(
        padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
        child: Row(
          children: [
            CommonImage(
              src: imgUrl,
              width: 132.5,
              height: 100,
            ),
            const Padding(padding: EdgeInsets.only(left: 10)),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
                Text(
                  data.subTitle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Wrap(
                  children: data.tags.map((item) => CommonTag(item)).toList(),
                ),
                Text(
                  '${data.price}元/月',
                  style: const TextStyle(
                      color: Colors.orange,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}

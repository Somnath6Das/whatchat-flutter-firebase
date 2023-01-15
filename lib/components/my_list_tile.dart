import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatchat/global.dart';
import 'package:whatchat/models/chats_model.dart';

class MyListTile extends StatelessWidget {
  final image;
  final title;
  final subtitle;
  final date;
  final count;
  final icon;
  final onTap;
  final onImageTap;
  const MyListTile(
      {required this.image,
      required this.title,
      required this.subtitle,
      required this.date,
      required this.count,
      required this.icon,
      required this.onTap,
      required this.onImageTap,
      super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(  
      onTap: () => onTap(),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                image != null?
                GestureDetector(
                  onTap: () => onImageTap(),
                  child: CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(image),
                  ),
                ): Container(),
               
                const SizedBox(width: 14,),
                 Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      title != null
                          ? Text(
                              title,
                              style: const TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            )
                          : Container(),
                      subtitle != null
                          ? Text(
                              subtitle,
                              style: const TextStyle(fontSize: 11),
                            )
                          : Container()
                    ],
                  ),
             
              ],
            ),
            Expanded(child: Container()),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '18:00',
                      style: TextStyle(fontSize: 12, color: AppColors.primary),
                    ),
                    count != null
                        ? CircleAvatar(
                            radius: 10,
                            backgroundColor: AppColors.primary,
                            child: Text(
                              count,
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 12),
                            ))
                        : Container(),
                  ],
                ),
                const SizedBox(width: 3,),
                const Icon(CupertinoIcons.chevron_right)
              ],
            )
          ],
        ),
      ),
    );
  }
}

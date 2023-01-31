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
  final border;
  const MyListTile(
      {this.image,
      this.title,
      this.subtitle,
      this.date,
      this.count,
      this.icon,
      this.onTap,
      this.onImageTap,
      required this.border,
      super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                image != null
                    ? GestureDetector(
                        onTap: () => onImageTap(),
                        child: CircleAvatar(
                          radius: 30,
                          backgroundColor: AppColors.avatarBorder,
                          child: CircleAvatar(
                            radius: border ? 26 : 30,
                            backgroundImage: NetworkImage(image),
                          ),
                        ),
                      )
                    : Container(),
                const SizedBox(
                  width: 14,
                ),
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
                    const SizedBox(
                      height: 6,
                    ),
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
                    date != null
                        ? Text(
                            date,
                            style: TextStyle(
                                fontSize: 12, color: AppColors.primary),
                          )
                        : Container(),
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
                const SizedBox(
                  width: 3,
                ),
                icon != null
                    ? Icon(icon, color: AppColors.primary)
                    : Container()
              ],
            )
          ],
        ),
      ),
    );
  }
}

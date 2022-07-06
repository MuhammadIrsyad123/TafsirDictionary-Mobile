import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

class LikeButtonWidget extends StatefulWidget {
  const LikeButtonWidget({Key? key}) : super(key: key);

  @override
  State<LikeButtonWidget> createState() => _LikeButtonWidgetState();
}

class _LikeButtonWidgetState extends State<LikeButtonWidget> {
  bool isLiked = false;
  int likeCount = 17;
  @override
  Widget build(BuildContext context) {
    const double size = 40;
    const animationDuration = Duration(milliseconds: 500);

    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        backgroundColor: isLiked ? Colors.red.shade100 : null,
        fixedSize: const Size.fromWidth(160),
        padding: EdgeInsets.zero,
      ),
      onPressed: () async {},
      child: LikeButton(
        padding: const EdgeInsets.all(12),
        size: size,
        isLiked: isLiked,
        likeCount: likeCount,
        likeBuilder: (isLiked) {
          final color = isLiked ? Colors.red : Colors.grey;
          return Icon(Icons.favorite, color: color, size: size);
        },
        animationDuration: animationDuration,
        likeCountPadding: const EdgeInsets.only(left: 12),
        countBuilder: (count, isLiked, text) {
          final color = isLiked ? Colors.black : Colors.grey;
          return Text(text,
              style: TextStyle(
                color: color,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ));
        },
        onTap: (isLiked) async {
          this.isLiked = !isLiked;
          likeCount += this.isLiked ? 1 : -1;

          Future.delayed(animationDuration).then((_) => setState(() {}));

          //server request

          return !isLiked;
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'dart:io';

class CurvedHeader extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final List<Widget>? actions;
  final double height;
  final File? profileImage;
  final VoidCallback? onImageTap;
  final Widget? leading;

  const CurvedHeader({
    super.key,
    this.title,
    this.actions,
    this.height = 200,
    this.profileImage,
    this.onImageTap,
    this.leading,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return ClipPath(
      clipper: _CustomClipper(),
      child: Container(
        color: Theme.of(context).primaryColor,
        height: height,
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top + 16,
          left: screenWidth * 0.04,
          right: screenWidth * 0.04,
          bottom: screenHeight * 0.02,
        ),
        child: Stack(
          children: [
            if (leading != null)
              Align(
                alignment: Alignment.topLeft,
                child: leading,
              ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (profileImage != null)
                    GestureDetector(
                      onTap: onImageTap,
                      child: CircleAvatar(
                        radius: screenWidth * 0.1,
                        backgroundColor: Colors.white70,
                        backgroundImage: FileImage(profileImage!),
                      ),
                    ) 
                  else if (onImageTap != null) // Show placeholder for image upload only if onImageTap is provided
                    GestureDetector(
                      onTap: onImageTap,
                      child: CircleAvatar(
                        radius: screenWidth * 0.1,
                        backgroundColor: Colors.white70,
                        child: Icon(Icons.camera_alt, size: screenWidth * 0.07, color: Theme.of(context).primaryColor),
                      ),
                    ),
                  if (profileImage != null || onImageTap != null) SizedBox(height: screenHeight * 0.02),
                  if (title != null)
                    Text(
                      title!,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                            color: Colors.white,
                            fontSize: screenWidth * 0.065,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                ],
              ),
            ),
            if (actions != null)
              Align(
                alignment: Alignment.topRight,
                child: Row(mainAxisSize: MainAxisSize.min, children: actions!),
              ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}

class _CustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height - 50);
    path.quadraticBezierTo(
      size.width / 2,
      size.height,
      size.width,
      size.height - 50,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

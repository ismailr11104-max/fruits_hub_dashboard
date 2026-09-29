import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ImageField extends StatefulWidget {
  ImageField({super.key, required this.onChanged});

  final ValueChanged<File?> onChanged;

  @override
  State<ImageField> createState() => _ImageFieldState();
}

class _ImageFieldState extends State<ImageField> {
  bool isLoading = false;
  File? fileImage;

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      child: GestureDetector(
        onTap: () async {
          setState(() {
            isLoading = true;
          });
          try {
            pikeImage();
          } catch (e) {
            setState(() {
              isLoading = false;
            });
          }
          setState(() {
            isLoading = false;
          });
        },
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.grey),
              ),
              child: fileImage != null
                  ? ClipRRect(
                      borderRadius: BorderRadiusGeometry.circular(16),
                      child: Image.file(fileImage!),
                    )
                  : Icon(Icons.image_outlined, size: 120),
            ),
            Visibility(
              visible: fileImage == null,
              child: IconButton(
                onPressed: () {
                  setState(() {
                    fileImage = null;
                    widget.onChanged(null);
                  });
                },
                icon: Icon(Icons.close_sharp, color: Colors.red, size: 24),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> pikeImage() async {
    final picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    fileImage = File(image!.path);
    widget.onChanged(fileImage!);
  }
}

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ImageField extends StatefulWidget {
  const ImageField({super.key, required this.onChanged});

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
      enabled: isLoading,
      child: GestureDetector(
        onTap: isLoading ? null : pikeImage,
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
                      borderRadius: BorderRadius.circular(16),
                      child: Image.file(fileImage!, fit: BoxFit.cover),
                    )
                  : const Icon(Icons.image_outlined, size: 120),
            ),

            if (fileImage != null)
              IconButton(
                onPressed: () {
                  setState(() {
                    fileImage = null;
                  });

                  widget.onChanged(null);
                },
                icon: const Icon(
                  Icons.close_sharp,
                  color: Colors.red,
                  size: 24,
                ),
              ),
          ],
        ),
      ),
    );
  }

  Future<void> pikeImage() async {
    setState(() {
      isLoading = true;
    });

    try {
      final ImagePicker picker = ImagePicker();

      final XFile? image = await picker.pickImage(source: ImageSource.gallery);
      // المستخدم ألغى اختيار الصورة
      if (image == null) {
        return;
      }
      final File selectedFile = File(image.path);
      if (!mounted) return;
      setState(() {
        fileImage = selectedFile;
      });

      widget.onChanged(selectedFile);
    } finally {
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    }
  }
}

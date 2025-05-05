import 'package:flutter/material.dart';

class TextIconRow extends StatelessWidget {
  final String text;
  final String? text2;
  final String? selectedItem; // Keep for potential future use
  final ValueChanged<String?>? onChanged; // Callback for icon tap
  final VoidCallback? onTap; // Callback for container tap
  final Color? text2BackgroundColor;
  final Color? bgColor;
  final Color? iconBgColor; // Background color for the icon
  final Color? iconColor; // New parameter for the icon color
  final IconData? icon; // Icon to represent the action
  final Color? textColor;

  TextIconRow({
    super.key,
    required this.text,
    this.text2,
    this.selectedItem,
    this.onChanged,
    this.onTap, // Added onTap parameter
    this.text2BackgroundColor,
    this.bgColor,
    this.icon,
    this.iconBgColor,
    this.iconColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // Handle tap on the entire container
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.0),
        child: Container(
          decoration: BoxDecoration(
            color: bgColor ?? Colors.grey[100],
            borderRadius: BorderRadius.circular(20.0),
          ),
          padding: EdgeInsets.symmetric(horizontal: 14.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                text,
                style: TextStyle(
                  color: textColor ?? Colors.black, // Default text color
                ),
              ),
              SizedBox(width: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // Render circular background if text2BackgroundColor is provided
                  if (text2BackgroundColor != null)
                    Container(
                      decoration: BoxDecoration(
                        color: text2BackgroundColor,
                        shape: BoxShape.circle,
                      ),
                      padding: EdgeInsets.all(10.0), // Increased padding
                      child: Center(
                        child: text2 != null
                            ? Text(
                                text2!,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              )
                            : SizedBox.shrink(), // Empty space if text2 is null
                      ),
                    ),
                  // Render text2 even if background is not provided
                  if (text2 != null && text2BackgroundColor == null)
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        text2!,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  SizedBox(width: 40),
                  if (icon != null) // Check if the icon is provided
                    Container(
                      decoration: BoxDecoration(
                        color: iconBgColor ?? Colors.transparent,
                        shape: BoxShape
                            .circle, // Circular shape for the icon background
                      ),
                      child: IconButton(
                        icon: Icon(icon,
                            color: iconColor ??
                                Colors.black), // Use provided icon color
                        onPressed: () => onChanged
                            ?.call(text), // Call the onChanged callback
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

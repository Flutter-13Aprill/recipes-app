import 'package:flutter/material.dart';
import 'package:recipe/model/recipe.dart';

class RecipeTicket extends StatelessWidget {
  final Recipe recipe;
  final bool isLiked;
  final VoidCallback onLikeToggle;
  final bool showAuthorImage;

  const RecipeTicket({
    super.key,
    required this.recipe,
    required this.isLiked,
    required this.onLikeToggle,
    this.showAuthorImage = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                recipe.image,
                height: 150,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: 8,
              right: 8,
              child: GestureDetector(
                onTap: onLikeToggle,
                child: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withOpacity(0.7),
                  ),
                  child: Icon(
                    Icons.favorite,
                    color: isLiked ? Colors.red : Colors.grey,
                    size: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        // ✅ شرط عرض صورة المستخدم
        if (showAuthorImage)
          Row(
            children: [
              CircleAvatar(
                radius: 12,
                backgroundImage: AssetImage(recipe.authorImage),
              ),
              const SizedBox(width: 8),
              Text(recipe.author, style: const TextStyle(fontSize: 12)),
            ],
          )
        else
          Text(recipe.author, style: const TextStyle(fontSize: 12)),

        const SizedBox(height: 4),
        Text(
          recipe.title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
        ),
        const SizedBox(height: 2),
        Text(
          "${recipe.category} • ${recipe.duration}",
          style: const TextStyle(color: Colors.grey, fontSize: 12),
        ),
      ],
    );
  }
}

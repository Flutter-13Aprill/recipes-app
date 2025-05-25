class RecipesData {
  static List<Map> recipesdata = [];
  static List<Map> allRecipesdata = [
    {
      "id": 0,
      "profileImg": 'images/1.png',
      "name": "Calum Lewis",
      "img": "images/11.png",
      "title": "Pancake",
      "isFavorite": "true",
    },
    {
      "id": 1,
      "profileImg": 'images/2.png',
      "name": "Eilif Sonas",
      "img": "images/22.png",
      "title": "salad",
      "isFavorite": "false",
    },
    {
      "id": 2,
      "profileImg": 'images/2.png',
      "name": "Eilif Sonas",
      "img": "images/22.png",
      "title": "salad",
      "isFavorite": "false",
    },
    {
      "id": 3,
      "profileImg": 'images/1.png',
      "name": "Calum Lewis",
      "img": "images/11.png",
      "title": "Pancake",
      "isFavorite": "false",
    },
  ];
  static add(value) {
    if (allRecipesdata[value]["isFavorite"] == "true") {
      allRecipesdata[value]["isFavorite"] = "false";
    } else {
      allRecipesdata[value]["isFavorite"] = "true";
    }
  }
}

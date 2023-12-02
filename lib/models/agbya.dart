 class Agbya {
      final String name;
      final String title;
      final String text;
      Agbya(
          {required this.name, required this.title, required this.text});

      static List<Agbya> convertToArticles(List articles) {
        List<Agbya> articlesList = [];
        for (var article in articles) {
          if(article["name"]==null||article["title"]==null||article["text"]==null){
            continue;
          }
          articlesList.add(Agbya(
              name: article["name"],
              title: article["title"],
              text: article["text"]));
        }
        return articlesList;
      }
    }
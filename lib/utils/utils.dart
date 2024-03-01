import '../model/Product.dart';

class Utils{
  static List<String> getTags(List<Product> products) {
    Set<String> tags = {};
    for (var product in products) {
      var tag = product.tags.split(',');
      tags.add(tag[0]);
      tags.add(tag[1].trim());
      tags.add(tag[2].trim());
    }
    var list = tags.toList();
    list.sort((String a, String b) => a.compareTo(b));
    return list;
  }

  static bool compare(Product product, String tags) {
    var tag = product.tags.trim().split(',');

    return tag[0].contains(tags) ||
        tag[1].contains(tags) ||
        tag[2].contains(tags);
  }
}
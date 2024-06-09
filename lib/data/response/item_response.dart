class ItemResponse{
   int? id;
   String? name;
   String? imageUrl;
   String? url;

   ItemResponse({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.url
  });

  factory ItemResponse.fromJson(Map<String, dynamic> json) => ItemResponse(
    id: json['id'] as int,
    name: json['name'] as String,
    imageUrl: json['imageUrl'] as String,
    url: json['url'] as String,
  );
}
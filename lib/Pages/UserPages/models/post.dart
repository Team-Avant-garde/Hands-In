class Comment {
  final int id;
  final int owner;
  final int post;
  final String comment;
  final String commentImage;

  Comment({
    required this.id,
    required this.owner,
    required this.post,
    required this.comment,
    required this.commentImage,
  });

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      id: json['id'],
      owner: json['owner'],
      post: json['post'],
      comment: json['comment'],
      commentImage: json['comment_image'],
    );
  }
}

class Post {
  final int id;
  final String title;
  final String content;
  final String tag;
  final int owner;
  final String postImage;
  final String postDate;
  final bool isSolved;
  final String updatedAt;
  final List<Comment> comments;
  final List<dynamic> votes;

  Post({
    required this.id,
    required this.title,
    required this.content,
    required this.tag,
    required this.owner,
    required this.postImage,
    required this.postDate,
    required this.isSolved,
    required this.updatedAt,
    required this.comments,
    required this.votes,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    List<Comment> comments = [];
    if (json['comments'] != null) {
      comments = List<Comment>.from(
        json['comments'].map((commentJson) => Comment.fromJson(commentJson)),
      );
    }

    return Post(
      id: json['id'],
      title: json['title'],
      content: json['content'],
      tag: json['tag'],
      owner: json['owner'],
      postImage: json['post_image'],
      postDate: json['post_date'],
      isSolved: json['is_solved'],
      updatedAt: json['updated_at'],
      comments: comments,
      votes: json['votes'],
    );
  }
}

void main() {
  // Example of parsing the JSON data
  List<Map<String, dynamic>> jsonData = [
    // ... your JSON data here
  ];

  List<Post> posts = jsonData.map((json) => Post.fromJson(json)).toList();

  // Accessing the data
  for (Post post in posts) {
    print('Post ID: ${post.id}');
    print('Title: ${post.title}');
    print('Content: ${post.content}');
    print('Tag: ${post.tag}');
    print('Owner: ${post.owner}');
    print('Post Image: ${post.postImage}');
    print('Post Date: ${post.postDate}');
    print('Is Solved: ${post.isSolved}');
    print('Updated At: ${post.updatedAt}');

    print('Comments:');
    for (Comment comment in post.comments) {
      print('  Comment ID: ${comment.id}');
      print('  Owner: ${comment.owner}');
      print('  Post: ${comment.post}');
      print('  Comment: ${comment.comment}');
      print('  Comment Image: ${comment.commentImage}');
    }

    print('Votes: ${post.votes}');
    print('\n');
  }
}

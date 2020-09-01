$.getJSON("https://blog.bitcoinabc.org/json/", function (data) {
  var feed = $(".abc-blog-feed");
  feed.empty();
  $.each(data["items"].slice(0, 3), function (i, post) {
    var encodedURL = encodeURI(post.url);
    feed.append(
      $('<article class="post-preview" />').append(
        $("<a />")
          .attr("href", encodedURL)
          .append($('<h2 class="post-title" />').text(post.title))
          .append(
            $('<p class="post-meta" />').text(
              "Posted on " + new Date(post.date_published).toDateString()
            )
          )
          .append(
            $('<div class="post-entry-container" />').append(
              $('<div class="post-entry" />').text(post.content_text)
            )
          )
          .append(
            $('<a class="post-read-more">[Read More]</a>').attr(
              "href",
              encodedURL
            )
          )
      )
    );
  });
});

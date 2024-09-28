---
layout: page
permalink: /blog
permalink_name: /blog
title: Wini's blog
---

# Wini's blog

<input type="text" id="searchInput" placeholder="Search blogs...">

{% for post in site.posts %}
  <article class="blog-post">
    <h2><a href="{{ post.url | relative_url }}">{{ post.title }}</a></h2>
    <time datetime="{{ post.date | date: "%Y-%m-%d" }}">{{ post.date | date_to_string }}</time>
    {% if post.description %}
      <p>{{ post.description }}</p>
    {% else %}
      <p>{{ post.excerpt | strip_html | truncate: 160 }}</p>
    {% endif %}
  </article>
{% endfor %}

<script>
document.addEventListener('DOMContentLoaded', function() {
  var searchInput = document.getElementById('searchInput');
  var posts = document.getElementsByClassName('blog-post');

  searchInput.addEventListener('input', function() {
    var searchQuery = this.value.toLowerCase();
    
    Array.from(posts).forEach(function(post) {
      var title = post.getElementsByTagName('h2')[0].textContent.toLowerCase();
      var content = post.getElementsByTagName('p')[0].textContent.toLowerCase();
      
      if (title.includes(searchQuery) || content.includes(searchQuery)) {
        post.style.display = '';
      } else {
        post.style.display = 'none';
      }
    });
  });
});
</script>
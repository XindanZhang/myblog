<!-- ---
layout: page
permalink: /blog
permalink_name: /blog
title: Wini's blog
---

# Wini's blog

{% for post in site.posts %}
  <article>
    <h2><a href="{{ post.url | relative_url }}">{{ post.title }}</a></h2>
    <time datetime="{{ post.date | date: "%Y-%m-%d" }}">{{ post.date | date_to_string }}</time>
    {% if post.description %}
      <p>{{ post.description }}</p>
    {% else %}
      <p>{{ post.excerpt | strip_html | truncate: 160 }}</p>
    {% endif %}
  </article>
{% endfor %} -->

---
layout: page
permalink: /blog
permalink_name: /blog
title: Wini's blog
---

# Wini's blog

<input type="text" id="searchInput" placeholder="Search blogs...">

<div id="blogPosts">
  {% raw %}
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
  {% endraw %}
</div>

<script>
document.getElementById('searchInput').addEventListener('input', function() {
    var searchQuery = this.value.toLowerCase();
    var posts = document.getElementsByClassName('blog-post');
    
    for (var i = 0; i < posts.length; i++) {
        var post = posts[i];
        var title = post.getElementsByTagName('h2')[0].textContent.toLowerCase();
        var content = post.getElementsByTagName('p')[0].textContent.toLowerCase();
        
        if (title.includes(searchQuery) || content.includes(searchQuery)) {
            post.style.display = '';
        } else {
            post.style.display = 'none';
        }
    }
});
</script>
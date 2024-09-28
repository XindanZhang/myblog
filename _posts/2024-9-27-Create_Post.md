---
layout: page
title: "Create blog website using Jekyll"
date: 2024-09-27

---

Simply create a blog website, we can just use the theme which has been designed by other authors.

# Step 1 Software setup

Install ruby using homebrew. Homebrew is a really convenient package manager for Mac.

```
brew install ruby
```

The prerequiste is gcc and make

```
brew install gcc make
```

We need to add Ruby to the PATH.

Using ` ~/.zshrc` to open the configuration file.

```
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
```

Save the file and reload `~/.zshrc`

```
source ~/.zshrc
```

Then install `gem install bundler`

And we need to add the executable doc directory of Jekyll to PATH.

```
export PATH="$PATH:/Users/winifred/.gem/ruby/3.3.0/bin"
```
Always use `bundle install` after the revision of `Gemfile ` file.

# Step 2 Edit the theme details

After git clone from GitHub, we can edit the `md` file.

Add a new folder `_post` to the root folder of the website.

You can put your blogs here.

And create a new file named `blog.md`.

```
---
layout: page
permalink: /blog
permalink_name: /blog
title: 'Your title'
---

# Your title

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
{% endfor %}

```

# Step 3 Upload to GitHub pages

Add all the changes:

```
git add .
```

Create a new commit describing your changes:

```
git commit -m "Describe your changes here"
```

Push your changes to the GitHub repository:

```
git push origin main
```
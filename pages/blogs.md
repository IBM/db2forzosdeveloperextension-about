---
layout: page
title: Blogs
permalink: /blogs
---

# {{ page.title }}

<ul>
{% for blog in site.data.blogs %}
    <li>
        {{ blog.date }} - <a href="{{ blog.url }}">{{ blog.title }}</a>
    </li>
{% endfor %}
</ul>

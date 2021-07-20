---
layout: page
title: Blogs and videos
permalink: /blogs
---

# {{ page.title }}

<ul>
{% for blog in site.data.blogs %}
    <li>
        {{ blog.date }} - <a href="{{ blog.url }}" target="_blank">{{ blog.title }}</a>
    </li>
{% endfor %}
</ul>

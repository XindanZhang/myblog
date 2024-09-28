---
layout: page
title: "Add the search box to blogs' page"
date: 2024-09-28

---

Add this line to `blog.md`

```
input type="text" id="searchInput" placeholder="Search blogs..."
```

And modify several CSS properties：

```python
#searchInput {
    width: 100%;
    padding: 10px;
    margin: 20px 0;
    font-size: 16px;
    border: 2px solid #4a4a4a;  // Border color
    border-radius: 4px;
    background-color: #f0f0f0;  // Background color
    color: #333;  // Text color
}
```
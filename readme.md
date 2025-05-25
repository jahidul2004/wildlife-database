# 📘 PostgreSQL Interview Questions (বাংলায়)

---

## ১। 🐘 PostgreSQL কি?

**উত্তরঃ**  
PostgreSQL হচ্ছে একটি ওপেন সোর্স, নো-এসকিউএল এবং অবজেক্ট রিলেশনাল ডাটাবেস ম্যানেজমেন্ট সিস্টেম।  
অবজেক্ট রিলেশনাল হওয়ায় এটি Relational Database (RDBMS) এর সাথে Object-Oriented Programming (OOP) এর ধারণাগুলোকেও একত্রিত করতে পারে।

---

## ২। 🔑 Primary Key এবং Foreign Key কি?

### 🅰️ Primary Key:

Primary Key হচ্ছে এমন Key যা ইউনিক ভাবে প্রত্যেকটি রেকর্ড বা রো কে সনাক্ত করতে ব্যবহার করা হয়।  
এটি এক বা একাধিক কলামের সমন্বয়ে তৈরি করা যায়।

### 🅱️ Foreign Key:

সাধারণত এক টেবিলের Primary Key অন্য টেবিলে ব্যবহার করা হলে তাকে Foreign Key বলে।

---

## ৩। 🔤 Varchar ও Char এর মাঝে পার্থক্য কি?

| VARCHAR                                                         | CHAR                                                            |
| --------------------------------------------------------------- | --------------------------------------------------------------- |
| VARCHAR হচ্ছে Variable Length Character String                  | CHAR হচ্ছে Fixed Length Character String                        |
| এটি কোনো অতিরিক্ত ফাঁকা স্পেস রাখে না                           | এটি ডাটা সম্পূর্ণ জায়গা না নিলে তা ফাঁকা স্পেস দিয়ে দেয়         |
| VARCHAR(10) — ডাটা ৫ ক্যারেক্টার হলে ৫ ক্যারেক্টার ই জায়গা নিবে | CHAR(10) — ডাটা ৫ ক্যারেক্টার হলে বাকি ৫টি স্পেস দিয়ে পূরণ করবে |

---

## ৪। 📍 Select statement এ Where clause এর উদ্দেশ্য কি?

Select statement এ মূলত where clause ব্যবহার করা হয় নির্দিষ্ট condition অনুযায়ী ডাটা filter করতে।  
যেমনঃ

```sql
SELECT * FROM students WHERE age > 18;
```

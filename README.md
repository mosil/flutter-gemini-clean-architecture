[![en](https://img.shields.io/badge/lang-en-red.svg)](https://github.com/mosil/gemini-clean-architecture/blob/main/README.en.md)
[![zh-tw](https://img.shields.io/badge/lang-zh_tw-blue.svg)](https://github.com/mosil/gemini-clean-architecture/blob/main/README.zh-tw.md)


# 簡介

此 Flutter 專案在展示如何使用 Clean Architecture 來整合 Google Gemini API <br/>

- [Clean Architecture](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html)
  為 Uncle Bob 於 2012 發佈在其部落格之軟體架構。

## 如何開始

### 取得 API KEY

1. 請到 [Google AI Studio](https://aistudio.google.com/app/apikey) 取得 apiKey。
2. 於 `lib/core/constants.dart` 中置換掉 `apiKey`。

### 分支

此專案有三個分支，

1. `main`，初始的樣態，更換 api key 即可以執行。
2. `1-empty-folders`，以 `main` 分支為基礎，加入架構所需的空目錄。
3. `2-completed`，完成程式碼於整個目錄中的分類。

## 備註

1. 架構是一個原則！
2. 至於目錄的分法、名稱，甚至是程式中要怎麼調整沒有固定答案，
3. 團隊只要統一規範，讓後續易於維護即可~
4. 此說明文字的英文版皆使用 Google Gemini 協助。

## Credits

Developer - Ada/阿達 (@mosil)

## License

The MIT License (MIT)

Copyright (c) 2024 [Mosil Studio](https://mosil.space/)

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and
associated documentation files (the "Software"), to deal in the Software without restriction,
including without limitation the rights to use, copy, modify, merge, publish, distribute,
sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial
portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT
NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES
OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
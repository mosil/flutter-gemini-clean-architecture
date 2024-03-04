[![zh-tw](https://img.shields.io/badge/lang-zh_tw-blue.svg)](https://github.com/mosil/gemini-clean-architecture/blob/main/README.zh-tw.md)

# Introduction

This Flutter project demonstrates how to use `Clean Architecture` to integrate the Google Gemini API.
- [Clean Architecture](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html)
  is a software architecture that was published by Uncle Bob on his blog in 2012.

## How to Started

### Get API KEY

1. Please go to [Google AI Studio](https://aistudio.google.com/app/apikey) to get your api key.
2. Change your api key in `lib/core/constants.dart`.

### Branch

This project has 3 branches:
1. `main`: The initial state. You can run it by replacing the API key.
2. `1-empty-folders`: Based on the `main` branch, add the empty directories required for the architecture.
3. `2-completed`: Complete the classification of the code in the entire directory.

## Note

1. Architecture is a principle!
2. There is no fixed answer for how to divide directories, names, or even how to adjust the code.
3. The team only needs to unify the specifications to make it easy to maintain later.
4. The English version of README was assisted by Google Gemini.

## Credits

Developer - Ada/阿達 (@mosil)

## License

The MIT License (MIT)

Copyright (c) 2024 [Mosil Studio](https://medium.com/@mosil-dev)

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
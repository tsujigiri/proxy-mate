# Proxy Mate

Generates a PDF with standard size playing cards of your choice.

## Installation

Given that you have a recent Ruby version installed, run:

```
gem install proxy-mate
```

In order for you to be able to run the executable, Ruby's `bin` directory needs to be in your `PATH`.

## Usage

First, you need the actual images of the cards you want. Create a text file with the full path of an image file of a card per line, then run:

```
proxy-mate my-netrunner-deck.txt proxies.pdf
```

The images can be any size and will be scaled to standard playing card size.
The tool is hard-coded to produce an A4 page size but should be easily adapted
to other formats.

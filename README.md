# Proxy Mate

Generates a PDF with standard size playing cards of your choice.

## Installation

Ruby and the `bundler` gem need to be installed, then run:

```
git clone https://github.com/tsujigiri/proxy-mate.git
cd proxy-mate
bundle
```

## Usage

It takes a list of image files as input on stdin. So you can, for example,
create a file with one full file path per line and run it like this:

```
cat my-netrunner-deck.txt | ./proxy-mate
```

It should then have created a file named `proxies.pdf`. The images can be any
size and will be scaled to standard playing card size.

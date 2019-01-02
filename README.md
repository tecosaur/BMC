# Bespoke, Multifunctional Class
### A LaTeX Class designed to make my documents magnificent in style as well as content

Want to see how it looks? Take a peek at [the demo pdf](demo.pdf).

This project was heavily inspired, and initially built off the fantastic work of @HarveySheppard (see [yLaTeX](https://github.com/HarveySheppard/yLaTeX)).

It is currently a work-in-progress, and will likely remain such until I am happy with it (i.e. indefinitely).

If anybody out there happens to like this and use it, good for you :smiley:.
Furthermore (as unlikely as this may be), if anybody does so and has an idea for, or even implements an improvement do be sure to give me a shout or open a PR. I'd really appreciate it :grin:

## Current Class Options

### Document Styling Related

| Key       | Effect                                                                                                     |
| :-------- | :--------------------------------------------------------------------------------------------------------- |
| `dark`    | Switches to a dark version of the style                                                                    |
| `solid`   | Uses style with solid title page, and wide stripes on chapter pages, with solid colour bar at top of pages |
| `stripe`  | Uses plain background on title page, and thin stripes on chapter pages                                     |
| `article` | Use `scrartcl` class instead of `scrrept`                                                                  |
| `notes`   | Move the margins to make room for notes                                                                    |

### Font Related

| Key              | Effect                                                            |
| :--------------- | :---------------------------------------------------------------- |
| `serif`          | Use serif font as main                                            |
| `sans`           | Use sans font as main                                             |
| `mono`           | Use mono font as main                                             |
| `math-serif`     | Same as with `math` option but forcing a serif font               |
| `maths-sans`     | Same as with `math` option but forcing a sans font                |
| `maths-mono`     | Same as with `math` option but forcing a mono font                |
| `headings-serif` | Use a serif font for headings (title page, chapter, section etc.) |
| `headings-sans`  | Use a sans font for headings (title page, chapter, section etc.)  |
| `headings-mono`  | Use a mono font for headings (title page, chapter, section etc.)  |

### Package Related

| Key    | Effect                                                                                                            |
| :----- | :---------------------------------------------------------------------------------------------------------------- |
| `chem` | Load and configure `mhchem` and `chemfig` packages                                                                |
| `code` | Load and configure `minted` package                                                                               |
| `plot` | Load and configure `pgfplots` package                                                                             |
| `math` | Load and configure some mathematical packages, and set font to match main text font (also see `math-serif` etc. ) |

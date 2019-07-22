# <img src="documentation/bmc.svg" height="24px"> Bespoke, Multifunctional Class

#### [Documentation / Demo](documentation/bmc.pdf)

### A LaTeX Class designed to make my documents magnificent in style as well as content

This project was heavily inspired, and initially built off the fantastic work of @HarveySheppard (see [yLaTeX](https://github.com/HarveySheppard/yLaTeX)).

It is currently a work-in-progress, and will likely remain such until I am happy with it (i.e. indefinitely).

If anybody out there happens to like this and use it, good for you :smiley:.
Furthermore (as unlikely as this may be), if anybody does so and has an idea for, or even implements an improvement do be sure to give me a shout or open a PR. I'd really appreciate it :grin:

![demo-img](documentation/bmc-demo-img.png)

## Installation

### Method one

Clone (or download) this folder into the your
`texmf` directory (try `kpsewhich -var-value=TEXMFHOME` if in doubt).
Run `texhash`

If you have issues with `fontawesome5` (I did), try the following:
`updmap-sys --enable Map=fontawesome5.map` (will probably require sudo).

### Method two

Download this folder and shove the following file in the same folder as your working document.

`bmc.cls`, `bmc-color.sty`, `bmc-fonts.sty`, `bmc-maths.sty`, `bmc-sectioning.sty`, `infoBulle.sty`, `marginInfoBulle.sty`, `yMainColor.sty`, `yMarginDesign`

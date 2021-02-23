# Changelog

## [Unreleased]

### Added

- New \maketitle style for article option
- Nice pgfplot keys for asymptotes
- More documentation, with some improvements

### Improved

- Improved microtype (add some protrusion)
- Remove extra space from `\today` format
- Lighten content boxes background
- Create option 'maths' alias for 'math'
- Make inline maths colour match text in (various) titles
- Improve support for maths symbols in pdf outline
- Improve pgfplot line style variation and more tweaks
- 'smart' axis arrows for pgfplots
- Move code that should be in bmc-font from bmc
- (Vertically) spaced out mini-toc a bit more
- Prevent unsightly overlap (solid colour panel, or stripe) with bibliography contents
- Improve sectioning label string conversion with hyperref (e.g `\acr{abc}` to `abc`)
- Switched the maths font to `newpxmath`, which is very nice
- Use actual origin for graph axis instead of always (0,0)

### Fixed

- positioning of counter, in the header of a continued box
- Silence + hyperref + inline maths doesn't mix well
- inline math color for continued box title
- spelling of "quaternary"
- remove unwanted space before numbered ((sub?)sub?)sections
- weird spacing of small caps by removing `tracking` option from microtype

## [0.2.2] — 2019-08-13

### Added

- More documentation

### Improved

- Tweak styling of acronyms
- Improve math differential macros
- Implement (non-margin) infoBulle using tcolorbox
- Remove deterimental baseline shift with box icons
- Make default bold actually semibold
- Enhance derivative (\dv) comand

### Fixed

- Issue with minted breaking for some files
- Remove accidentally included test file
- minor tcolorbox issues + tweaks
- (#9) Add default values for title and author

## [0.2.1] — 2019-07-22

### Added

- `landscape` class option
- Class option to configure glossaries `gloss`

### Improved

- Update readme, add image
- Make `\textsc` use `\fauxsc` when appropriate
- Make `\fauxsc` weight more appropriate
- Tweaked `hyperref` options
- Complete move from `titlesec` to `koma`
- Remove some warnings

### Fixed

- Removed some tests that sneaked in
- Potential issue with tabular row colouring

## [0.2] — 2019-06-16

### Added

- Use of `silent` package
- Revamped colour management in `bmc-color.sty`

### Improved

- **Split up main `.cls` into a few `.sty` components!**
- Table header fill is now a tad less dodgy, and more robust
- Update and improve documentation

### Fixed

- Non-existant font weight reference
- Dodgy `chemfig` externalise code commented out

## [0.1] — 2019-06-09

### Added

- Documentation/Demo pdf
- Ditto command
- Dodgy tcolobox'd `\mintinline`
- Roman numeral commands `\RN` and `\Rn`
- Inline math colour (disable by using `\(* \)`)
- Add dark colour theme (class option `dark`)
- Pgfplots customisations
- Optional matrix alignment (default `r`)
- Use main font for maths
- Proof environment

### Improved

- Have href and inline math change with light/dark theme
- Better (rudimentary) table header fill
- Expand space for minted line numbers, now max of 9999
- Captions now use heading font
- Captions become raggedright when they become multiline
- Colour variables no longer contains superflous `color` in name.
- tweak infobulle alignment
- microtype settings
- metadata adding
- `mathbb` shortcuts now two letters (`\XX`) to avoid clashes
- `mathbb` shortcuts now better handle optional argument
- `\today` format is now "D^th Month YYYY"
- `\leq` and `\geq` now produce ⩽ and ⩾
- Remove dot after numbers in figure captions etc.

### Fixed

- Tabulars now always have the `text` colour
- `\indent` now does something
- Correct class now used with `article` class option

## [Initial commit]

A nice custom class.

[unreleased]: https://github.com/tecosaur/BMC/compare/v0.2.2...HEAD
[0.2.2]: https://github.com/tecosaur/BMC/compare/v0.2.1...v0.2.2
[0.2.1]: https://github.com/tecosaur/BMC/compare/v0.2...v0.2.1
[0.2]: https://github.com/tecosaur/BMC/compare/v0.1...v0.2
[0.1]: https://github.com/tecosaur/BMC/compare/84c5f58...v0.1
[initial commit]: https://github.com/tecosaur/BMC/commit/84c5f58d18a12c722598c42d497a1abaf551dcd3

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                          %
%                  BMC                     %
%     A Bespoke, Multipurpose Class        %
%                 -~=~-                    %
%          Designed by tecosaur            %
%        Insired by Yves Zumbach           %
%                                          %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%% bmc.cls
%% Copyright 2019 tecosaur (https://github.com/tecosaur)
%
% This work may be distributed and/or modified under the
% conditions of the LaTeX Project Public License, either version 1.3
% of this license or (at your option) any later version.
% The latest version of this license is in
%   http://www.latex-project.org/lppl.txt
% and version 1.3 or later is part of all distributions of LaTeX
% version 2005/12/01 or later.
%
% This work has the LPPL maintenance status `maintained'.
%
% The Current Maintainer of this work is tecosaur
%
% This work consists of the files bmc.cls and modifications made to infoBulle.sty and marginInfoBulle.sty


\ProvidesClass{bmc}[1/1/2019 Bespoke Multipurpose Class]
\NeedsTeXFormat{LaTeX2e}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%		Options
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{etoolbox}
% \RequirePackage{kvoptions}

\newbool{optionLight}
\newbool{optionDark}

\newbool{optionSolid}
\newbool{optionStripe}

\newbool{optionArticle}

\newbool{optionParagraph}

\newbool{optionNotes}
\newbool{optionChem}
\newbool{optionCode}
\newbool{optionPlot}
\newbool{optionExternalise}

\newbool{optionSerif}
\newbool{optionSans}
\newbool{optionMono}

\newbool{optionMathSerif}
\newbool{optionMathSans}
\newbool{optionMathMono}

\newbool{optionHeadingsSerif}
\newbool{optionHeadingsSans}
\newbool{optionHeadingsMono}

% Defaults
\booltrue{optionLight}
\booltrue{optionSerif}
\booltrue{optionHeadingsSans}


% Get The Settings
% ================

% Document appearence related
\DeclareOption{light}{
	\booltrue{optionLight}
}
\DeclareOption{dark}{
	\booltrue{optionDark}
}
\DeclareOption{solid}{
	\booltrue{optionSolid}
}
\DeclareOption{stripe}{
	\booltrue{optionStripe}
}
\DeclareOption{notes}{
	\booltrue{optionNotes}
}
% class type related options
\DeclareOption{article}{
	\booltrue{optionArticle}
}
% Other document style related options
\DeclareOption{paragraph}{
	\booltrue{optionParagraph}
}
% package setup related options
\DeclareOption{chem}{
	\booltrue{optionChem}
}
\DeclareOption{code}{
	\booltrue{optionCode}
}
\DeclareOption{plot}{
	\booltrue{optionPlot}
}
\DeclareOption{externalise}{
	\booltrue{optionExternalise}
}
% Font
\DeclareOption{serif}{
	\booltrue{optionSerif}
	\boolfalse{optionSans}
	\boolfalse{optionMono}
	% default heading style
	\booltrue{optionHeadingsSans}
}
\DeclareOption{sans}{
	\booltrue{optionSans}
	\boolfalse{optionSerif}
	\boolfalse{optionMono}
	% default heading style
	\booltrue{optionHeadingsSans}
}
\DeclareOption{mono}{
	\booltrue{optionMono}
	\boolfalse{optionSerif}
	\boolfalse{optionSerif}
	% default headings style
	\booltrue{optionHeadingsMono}
	\boolfalse{optionHeadingsSans}
}
% Maths
\DeclareOption{math}{
	\ifbool{optionSans}{
		\booltrue{optionMathSans}
	}{}
	\ifbool{optionSerif}{
		\booltrue{optionMathSerif}
		\boolfalse{optionMathSans}
	}{}
	\ifbool{optionMono}{
		\booltrue{optionMathMono}
		\boolfalse{optionMathSans}
		\boolfalse{optionMathSerif}
	}{}
}
\DeclareOption{math-serif}{
	\booltrue{optionMathSerif}
	\boolfalse{optionMathSans}
	\boolfalse{optionMathMono}
}
\DeclareOption{math-sans}{
	\booltrue{optionMathSans}
	\boolfalse{optionMathSerif}
	\boolfalse{optionMathMono}
}
\DeclareOption{math-mono}{
	\booltrue{optionMathMono}
	\boolfalse{optionMathSans}
	\boolfalse{optionMathSerif}
}
% Sections Font
\DeclareOption{headings-serif}{
	\booltrue{optionHeadingsSerif}
	\boolfalse{optionHeadingsSans}
	\boolfalse{optionHeadingsMono}
}
\DeclareOption{headings-sans}{
	\booltrue{optionHeadingsSans}
	\boolfalse{optionHeadingsSerif}
	\boolfalse{optionHeadingsMono}
}
\DeclareOption{headings-mono}{
	\booltrue{optionHeadingsMono}
	\boolfalse{optionHeadingsSerif}
	\boolfalse{optionHeadingsSerif}
}
% Class
\DeclareOption*{
	\ifbool{optionArticle}{
		\PassOptionsToClass{\CurrentOption}{scrartcl}
	}{
		\PassOptionsToClass{\CurrentOption}{scrreprt}
	}
}
% Finish
\ProcessOptions\relax

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%		Basic settings, options processing
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\ifbool{optionArticle}{
	\LoadClass[usegeometry]{scrartcl}
}{
	\LoadClass[usegeometry]{scrreprt}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%		Some nice packages
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{ifdraft}

\RequirePackage[activate={true,nocompatibility},final,tracking=true,kerning=true,spacing=true]{microtype} % ,factor=1100,stretch=15,shrink=15
\microtypecontext{spacing=nonfrench}
\RequirePackage{setspace}
\RequirePackage[automark,draft=false,headwidth=textwithmarginpar,footwidth=head]{scrlayer-scrpage}
\RequirePackage{calc}
\ifdraft{
	\PassOptionsToPackage{gray}{xcolor}
}{}
\RequirePackage[usenames,dvipsnames,svgnames,table]{xcolor}

\RequirePackage{tikz}
\ifbool{optionExternalise}{
	\usetikzlibrary{external}
	\tikzexternalize[
		prefix=tikz/,
		mode=list and make,
		only named=true
	]
	\tikzset{external/system call={pdflatex \tikzexternalcheckshellescape
		-halt-on-error -interaction=batchmode -jobname "\image" "\texsource"}
	}
}{}
\ifbool{optionPlot}{
	\RequirePackage{pgfplots}
	\usetikzlibrary{plotmarks}
	\pgfplotsset{
		compat=newest,
		tick align=outside,
		% only marks,
		legend pos=outer north east,
		yticklabel style={/pgf/number format/fixed},
		axis lines=middle,
		cycle list={quatrinary\\secondary\\tertiary\\},
		every tick label/.append style={font=\fontfamily{\sfdefault}\selectfont},
		every axis plot/.append style={
			very thick,
			tick style={line width=ultra thick},
		},
		% every patch/.append style={line join=round,line cap=round}
		% every axis/.append style={axis line style={<->}}
		% tick label style = {font=\large},
		% every axis label = {font=\sffamily},
		% legend style = {font=\sffamily},
		% label style = {font=\sffamily},
		% small
	}
}{}

\RequirePackage{ctable}
\RequirePackage{tabularx}
\RequirePackage{multicol}

\RequirePackage{graphicx}
\RequirePackage{grffile} % fix allowed filenames

\RequirePackage{subcaption}
\RequirePackage[hypcap=true]{caption}

\RequirePackage{fontawesome5}
\RequirePackage{infoBulle}
\RequirePackage{marginInfoBulle}

\RequirePackage[check=warning]{widows-and-orphans}

\RequirePackage{xpatch}

\ifbool{optionChem}{
	\RequirePackage[version=4]{mhchem}
	\RequirePackage{chemfig}
	\setchemfig{
		chemfig style={line width=0.06642 em},  % 'Line Width'
		angle increment=30,
		double bond sep=0.35700 em,  % 'Bond Spacing'
		atom sep=1.78500 em,  % 'Fixed Length'
		bond offset=0.18265 em  % 'Margin Width'
	}
	\makeatletter
	\renewcommand*\printatom[1]{\small\ensuremath{\mathsf{#1}}}
	\ifbool{optionExternalise}{ % source: https://tex.stackexchange.com/questions/245015/precompile-molecules-for-faster-compilation/

	\def\CF@chemfig@iii[#1][#2]{%
		\edef\CF@tmp@str{\noexpand\begin{tikzpicture}[remember picture,every node/.style={anchor=base,inner sep=\z@,outer sep=\z@,minimum size=\z@\ifx\@empty#2\@empty\else,#2\fi},baseline\ifx\@empty#1\@empty\else,#1\fi]}%
		\begingroup
			\everyeof{\@nil}\endlinechar\m@ne
			\CF@sanitize@catcode
			\CF@chemfig@iv
	}

	\def\CF@chemfig@iv#1{%
		\CF@tmp@str
			\let\CF@hook@list\@empty
			\ifx\CF@atom@sep\@empty\def\CF@atom@sep{3em}\fi
			\ifx\CF@cram@basewidth\@empty\def\CF@cram@basewidth{1.5ex}\fi
			\CF@incyclefalse
			\CF@cnt@groupnumber\z@
			\let\CF@last@action\z@% 0=d\'ebut du dessin 1=trac\'e d'un noeud 2=trac\'e d'une liaison
			\let\CF@start@offset\@empty
			\let\CF@end@offset\@empty
			\let\CF@bond@outcontentsaved\@empty
			\def\CF@cycle@anglecorrection{180/\CF@cycle@num}%
			\def\CF@default@angle{0}%
			\def\CF@default@stringangle{:0}% angle pris par d\'efaut si le champ est vide
			\def\CF@default@length{1}%
			\let\CF@default@fromatom\@empty% numero de l'atome d'o\`u partent les liaisons par d\'efaut
			\let\CF@default@toatom\@empty% num\'ero de l'atome o\`u arrivent les laisons par d\'efaut
			\let\CF@default@tikz\@empty
			\let\CF@previous@bondangle\empty
			\let\CF@joinbond\z@
			\let\CF@previous@tikz\empty
			\expandafter\assign@tonil\expandafter\CF@remain@molecule\scantokens{#1}%
			\expandafter\CF@chemfig@v\expandafter{\CF@remain@molecule}%
		\end{tikzpicture}%
		\endgroup
		\let\CF@split@state\z@
	}
	\def\CF@chemfig@vi{%
		\let\CF@next@action\CF@chemfig@vi% \`a priori, on reboucle
		\ifx\CF@remain@molecule\@empty
			\let\CF@next@action\empty
		\else
			\CF@seek@submol
			\expandafter\CF@seek@node\expandafter{\CF@remain@molecule}\CF@current@atomgroup\CF@remain@molecule
			\ifx\@empty\CF@current@atomgroup% pas de noeud pour commencer ?
				\def\CF@bond@outnode{n\CF@last@groupnumber-%
					\ifx\CF@current@fromatom\@empty
						\ifdim\CF@current@angle pt<90pt \number\CF@cnt@atomingroup
						\else\ifdim\CF@current@angle pt>270pt \number\CF@cnt@atomingroup\else1\fi
						\fi
					\else\CF@current@fromatom
					\fi}%
				\expandafter\futurelet\expandafter\CF@toks@a\expandafter\CF@gobble@tonil\CF@remain@molecule\relax\@nil
				\CF@if@firsttokin@i{-=<>~}% la suite est une liaison
					{\ifnum\CF@last@action=\tw@% c'est la deuxi\`eme liaison cons\'ecutive ?
						\CF@insert@emptygroup\CF@remain@molecule% ins\`ere un groupe vide
						\edef\CF@bond@outnode{\CF@bond@outnode}%
					\else
						\ifCF@incycle\advance\CF@cnt@cycle\@ne\fi
						\expandafter\CF@analyse@bond\expandafter{\CF@remain@molecule}\CF@bond@type
						\edef\CF@bond@outnode{\CF@bond@outnode}%
						\let\CF@remain@molecule\CF@remain@afterbond
						\ifCF@incycle
							\ifnum\CF@cnt@cycle=\CF@cycle@num\relax
								\expandafter\expandafter\expandafter\@firstoftwo
							\else
								\ifnum\CF@cnt@cycle=\@ne
									\let\CF@cycle@firsttikz\CF@current@tikz
									\unless\ifx\CF@start@offset\@empty\let\CF@cycle@joinlast\z@\fi
								\fi
								\expandafter\expandafter\expandafter\@secondoftwo
							\fi
						\else
							\expandafter\@secondoftwo
						\fi
							{\let\CF@next@action\endgroup
							\CF@draw@bond\CF@bond@type{\CF@bond@outnode}{\CF@hook@cycle}\CF@previous@atomgroup\CF@hook@atomgroup
							}%
							{\node[at=(\CF@bond@outnode\ifCF@incycle\else\ifCF@macrofixedbondlength.\CF@current@angle\fi\fi),shift=(\ifcase\CF@split@state\or180-\or-\fi\CF@current@angle:\CF@current@length*\CF@atom@sep)](CF@node){};
							\let\CF@previous@angle\CF@current@angle
							\let\CF@last@action\tw@
							}%
					\fi
					\ifcat\relax\detokenize\expandafter{\romannumeral-`\.\expandafter\noexpand\CF@remain@molecule}\relax
					% s'il ne reste plus rien apr\`es la liaison (sans tenir compte de l'espace devant)-> ins\`ere un groupe vide
						\CF@insert@emptygroup\CF@remain@molecule
					\fi
					}%
					{\edef\CF@bond@outnode{\CF@bond@outnode}% \'evalue le l'atome de d\'epart de liaison
					\CF@ifx(\CF@toks@a% une parenth\`ese pour commencer ?
						{\ifnum\CF@last@action=\tw@% il y avait une liaison juste avant ?
							\CF@insert@emptygroup\CF@remain@molecule
						\else
							\expandafter\CF@grab@submol\expandafter{\CF@remain@molecule}%
							\begingroup
								\ifCF@incycle\let\CF@last@action\thr@@\fi% on \'etait dans un cycle
								\CF@incyclefalse
								\aftergroup\CF@chemfig@vi
								\def\CF@next@action{\expandafter\CF@chemfig@v\expandafter{\CF@sub@mol}}%
						\fi
						}%
						{\ifx\CF@remain@molecule\@empty
							\let\CF@next@action\endgroup
						\else% ce qui reste apr\`es le noeud courant n'est pas vide, ne commence pas par "-=~", ni par une parenth\`ese
							\CF@ifx*\CF@toks@a% un cycle ?
							{\ifnum\CF@last@action=\tw@
								\CF@insert@emptygroup\CF@remain@molecule% ins\`ere un groupe vide
							\else
								\ifCF@incycle\let\CF@last@action\thr@@\fi% on \'etait dans un cycle
								\ifnum\CF@last@action=\thr@@\let\CF@lastcycle@num\CF@cycle@num\fi
								\CF@expafterarg@ntimes2\CF@if@firsttokmatch{\expandafter\@gobble\CF@remain@molecule}*% un 2\`e "*" ?
									{\CF@expafterarg@ntimes2{\def\CF@remain@molecule}{\expandafter\@gobble\CF@remain@molecule}% enl\`eve la 1er \'etoile
									\CF@expafterarg@ntimes2\CF@if@firsttokmatch{\expandafter\@gobble\CF@remain@molecule}[% un crochet ensuite ?
										{\expandafter\CF@cycle@parsepreamblewithoptarg\CF@remain@molecule\@nil% \begingroup inclus
										}%
										{\def\CF@cyclearc@startangle{0}\def\CF@cyclearc@endangle{360}%
										\let\CF@cyclearc@directtikz\@empty
										\expandafter\CF@cycle@parsepreamble\CF@remain@molecule\@nil% \begingroup inclus
										}%
									\CF@cyclearctrue
									}%
									{\expandafter\CF@cycle@parsepreamble\CF@remain@molecule\@nil% \begingroup inclus
									\CF@cyclearcfalse
									}%
								\CF@cnt@cycle\z@
								\edef\CF@hook@cycle{\CF@bond@outnode}%
								\let\CF@hook@atomgroup\CF@previous@atomgroup
								\ifx\CF@hook@atomgroup\CF@empty@node
									\let\CF@cycle@joinlast\@ne% joindre le dernier
								\else
									\let\CF@cycle@joinlast\z@
								\fi
								\CF@incycletrue
								\ifnum\CF@last@action=\thr@@
									\pgfmathparse{360/\CF@lastcycle@num-180}% c'est un cycle dans un cycle
								\else
									\pgfmathparse{-180/\CF@cycle@num-90+\CF@cycle@anglecorrection}%
								\fi
								\let\CF@initcycle@angle\pgfmathresult
								\aftergroup\CF@chemfig@vi
								\def\CF@next@action{\expandafter\CF@chemfig@v\expandafter{\CF@sub@mol}}%
							\fi
							}%
							{\errmessage{Package \CF@package@name\space Error: something went wrong here: \detokenize\expandafter{\CF@remain@molecule}^^JIf you think it's a bug, please, send a Minimal Example to the author.}}%
						\fi}%
					}%
			\else
				\CF@expand@second{\CF@expand@second{\CF@expand@second\CF@draw@atomgroup\CF@current@angle}\CF@current@toatom}\CF@current@atomgroup
			\fi
		\fi
		\CF@next@action
	}

	% \edef\CF@tmp@str{\noexpand\begin{tikzpicture}[remember picture,every node/.style={anchor=base,inner sep=1pt,outer sep=\z@,minimum size=\z@\ifx\@empty#2\@empty\else,#2\fi},baseline\ifx\@empty#1\@empty\else,#1\fi]}%

	}{}
}{}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%		Set Penalties
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\@beginparpenalty=10000 % don't like it when a paragraph title is on a different page to the start of the content
\hyphenpenalty=500 % not a huge fan of hyphens, but they are worthwhile
\righthyphenmin=4 % min letters post-hyphen
\lefthyphenmin=4 % min letters pre-hyphen

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Layout
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\setlength{\leftmargin}{2.5cm}


\ifdraft{
	\PassOptionsToPackage{showframe}{geometry}
}{}
\if@twoside
	% \PassOptionsToPackage{asymmetric}{geometry}
	\setlength{\leftmargin}{1cm}
\fi
\ifbool{optionNotes}{
	\setlength{\rightmargin}{1cm}
	\PassOptionsToPackage{includemp}{geometry}
	\PassOptionsToPackage{marginparwidth=5cm, marginparsep=5mm}{geometry}
}{
	\setlength{\rightmargin}{2.7cm}
	\PassOptionsToPackage{marginparwidth=0cm, marginparsep=0mm}{geometry}
}
\RequirePackage[a4paper, ignoreheadfoot, left=\leftmargin, right=\rightmargin, top=2cm, bottom=3.5cm, headsep=1cm]{geometry}

\setlength{\skip\footins}{1cm}
\setlength{\footnotesep}{2mm}
\setlength{\parskip}{1ex}
\setlength{\parindent}{0ex}

% title formating
\RequirePackage{titlesec}

% Code blocks
\ifbool{optionCode}{
	\RequirePackage{minted}
	\RequirePackage[many]{tcolorbox}

	\setminted{
		frame=none,
		% framesep=2mm,
		baselinestretch=1.2,
		fontsize=\footnotesize,
		highlightcolor=page!95!text!80!primary,
		linenos,
		breakanywhere=true,
		breakautoindent=true,
		breaklines=true,
		tabsize=4,
		xleftmargin=3em,
		autogobble=true,
		obeytabs=true,
		python3=true,
		texcomments=true,
		framesep=2mm,
		breakbefore=\\\.+,
		breakafter=\,
	}

	\BeforeBeginEnvironment{minted}{
		\begin{tcolorbox}[
			enhanced,
			overlay={\fill[page!90!text] (frame.south west) rectangle ([xshift=2.5em]frame.north west);},
			colback=page!95!text,
			colframe=page!95!text, % make frame colour same as background
			breakable,% Allow page breaks
			arc=0pt,outer arc=0pt,sharp corners, % sharp corners
			boxsep=0pt,left=0pt,right=0pt,top=0pt,bottom=0pt % no margin/paddding
		]
	}
	\AfterEndEnvironment{minted}{\end{tcolorbox}}

	\ifbool{optionDark}{
		\setminted{
			style=monokai,
			breaksymbol=\color{page!80!text}\tiny\ensuremath{\hookrightarrow},
			breakanywheresymbolpre=\,\footnotesize\ensuremath{_{\color{page!80!text}\rfloor}},
			breakbeforesymbolpre=\,\footnotesize\ensuremath{_{\color{page!80!text}\rfloor}},
			breakaftersymbolpre=\,\footnotesize\ensuremath{_{\color{page!80!text}\rfloor}},
		}
	}{
		\setminted{
			style=autumn,
			breaksymbol=\color{page!60!text}\tiny\ensuremath{\hookrightarrow},
			breakanywheresymbolpre=\,\footnotesize\ensuremath{_{\color{page!60!text}\rfloor}},
			breakbeforesymbolpre=\,\footnotesize\ensuremath{_{\color{page!60!text}\rfloor}},
			breakaftersymbolpre=\,\footnotesize\ensuremath{_{\color{page!60!text}\rfloor}},
		}
	}

	\renewcommand\theFancyVerbLine{\color{text!60!page}\arabic{FancyVerbLine}}
}{}

% % Set Image Max Dimentions
% \makeatletter
% \def\maxwidth{\ifdim\Gin@nat@width>\linewidth\linewidth\else\Gin@nat@width\fi}
% \def\maxheight{\ifdim\Gin@nat@height>\textheight\textheight\else\Gin@nat@height\fi}
% \makeatother
% % Scale images if necessary, so that they will not overflow the page
% % margins by default, and it is still possible to overwrite the defaults
% % using explicit options in \includegraphics[width, height, ...]{}
% \setkeys{Gin}{width=\maxwidth,height=\maxheight,keepaspectratio}

% Time Format for \today
% ======================

\renewcommand{\today}{
\ifnum\number\day<10 0\fi \number\day%
\ifnum\number\day>3 \textsuperscript{th} \else\ifnum\number\day=3 \textsuperscript{rd} \else\ifnum\number\day=2 \textsuperscript{nd} \else\ifnum\number\day=1 \textsuperscript{st} \fi\fi\fi\fi %
\space%
\ifcase \month \or January\or February\or March\or April\or May%
\or June\or July\or August\or September\or October\or November\or December\fi%
\space%
\number \year%
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%		Colors & Font
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Colour Theme Colours
% ====================

\ifbool{optionDark}{
	\definecolor{page}{HTML}{222222} % dark grey
	\definecolor{text}{HTML}{FCFCFC} % white
}{
	\definecolor{page}{HTML}{FFFFFF} % white
	\definecolor{text}{HTML}{000000} % black
}

\definecolor{primary}{HTML}{019875} % emerald
% \definecolor{primaryVariant}{HTML}{1CBE77} % emerald mixed with lighter green
\AtEndPreamble{
	\@ifundefined{\string\color@primaryVariant}{\colorlet{primaryVariant}{primary!75!Cream>twheel,-3,360}}{}
}
\definecolor{contrastColour}{HTML}{E8F1F2} % white

\definecolor{tertiary}{HTML}{C47238} % yellow
\definecolor{secondary}{HTML}{C6B53C} % orange
\definecolor{quatrinary}{HTML}{BD3E4C} % red

\definecolor{alternativePrimary}{HTML}{13293D} % blue

% Generaly Nice Shades of Common Colours
% ======================================
% source: https://flatuicolors.com/palette/de

% Shades
\definecolor{Cream}{HTML}{FFFCCF}
\definecolor{LightGrey}{HTML}{a5b1c2}
\definecolor{Grey}{HTML}{778ca3}
\definecolor{DarkGrey}{HTML}{4b6584}
\definecolor{Black}{HTML}{231F20}
% Primary Colours
\definecolor{Red}{HTML}{eb3b47}
\definecolor{LightRed}{HTML}{fc5c65}
\definecolor{DarkRed}{HTML}{d91c38}

\definecolor{Yellow}{HTML}{f7b731}
\definecolor{LightYellow}{HTML}{fed330}
\definecolor{DarkYellow}{HTML}{f0a132}

\definecolor{Blue}{HTML}{3867d6}
\definecolor{LightBlue}{HTML}{4b7bec}
\definecolor{DarkBlue}{HTML}{2654bf}
% tertiary Colours
\definecolor{Green}{HTML}{20bf6b}
\definecolor{LightGreen}{HTML}{26de81}
\definecolor{DarkGreen}{HTML}{1ba155}

\definecolor{Orange}{HTML}{fa8231}
\definecolor{LightOrange}{HTML}{fd9644}
\definecolor{DarkOrange}{HTML}{f76b20}

\definecolor{Purple}{HTML}{8854d0}
\definecolor{LightPurple}{HTML}{a55eea}
\definecolor{DarkPurple}{HTML}{6e49b8}
% secondary+ Colours
% \definecolor{Brown}{HTML}{}
\definecolor{Cyan}{HTML}{0fb9b1}
\definecolor{LightCyan}{HTML}{2bcbba}
\definecolor{DarkCyan}{HTML}{00a8a8}

% \definecolor{LightBlue}{HTML}{2d98da}
% Need to find better name(s) for other ligher blue shades

% % Another Colour Theme
% % --------------------
% % source: https://flatuicolors.com/palette/de

% % Shades
% \definecolor{Cream}{HTML}{FFFCCF}
% \definecolor{LightGrey}{HTML}{a5b1c2}
% \definecolor{Grey}{HTML}{778ca3}
% \definecolor{DarkGrey}{HTML}{4b6584}
% \definecolor{Black}{HTML}{231F20}
% % Primary Colours
% \definecolor{Red}{HTML}{e74c3c}
% \definecolor{LightRed}{HTML}{fc5c65}

% \definecolor{Yellow}{HTML}{f1c40f}
% \definecolor{LightYellow}{HTML}{fed330}

% \definecolor{Blue}{HTML}{2980b9}
% \definecolor{LightBlue}{HTML}{3498db}
% % tertiary Colours
% \definecolor{Green}{HTML}{27ae60}
% \definecolor{LightGreen}{HTML}{2ecc71}

% \definecolor{Orange}{HTML}{e67e22}
% \definecolor{LightOrange}{HTML}{f39c12}

% \definecolor{Purple}{HTML}{8e44ad}
% \definecolor{LightPurple}{HTML}{9b59b6}
% % secondary+ Colours
% % \definecolor{Brown}{HTML}{}
% \definecolor{Cyan}{HTML}{16a085}
% \definecolor{LightCyan}{HTML}{1abc9c}


% redefine info bulle colours

\colorlet{infoBulleBackground}{page!90!text}
\colorlet{infoBulleText}{text}
\colorlet{marginInfoBulleBackground}{page}
\colorlet{marginInfoBulleText}{text}

\colorlet{criticalColor}{Red}
\colorlet{questionColor}{Purple}
\colorlet{informationColor}{Green}
\colorlet{checkColor}{Blue}
\colorlet{warningColor}{Orange}
\colorlet{tipsColor}{Purple}
\colorlet{exampleColor}{Blue}
\colorlet{mathematicalColor}{Orange}
\colorlet{codeColor}{Grey}

% set link colour
% \AtEndPreamble{
% 	\ifbool{optionDark}{
		\colorlet{href}{secondary}
% 	}{
% 		\colorlet{href}{tertiary}
% 	}
% }

% ================
% Setup Font
% ================

\usepackage[T1]{fontenc}
% Load fonts
\RequirePackage{plex-serif}
\RequirePackage{plex-sans}
\RequirePackage{plex-mono}

% Math Font & Setup
% =================

% \setlength{\mathLetterPadding}{1mm}

\ifboolexpr{bool {optionMathSerif} or bool {optionMathSans} or bool {optionMathMono}}{
	% various math packages
	\RequirePackage{amsmath,amssymb}
	\RequirePackage[utopia]{mathdesign}
	\RequirePackage{xfrac}
	\RequirePackage[makeroom]{cancel}
	% package to use text font for math
	\usepackage{mathtools}

	% deliminators
	\DeclarePairedDelimiter{\abs}{\lvert}{\rvert}
	\DeclarePairedDelimiter{\norm}{\lVert}{\rVert}
	% number sets
	\newcommand{\R}[1][]{\ensuremath{\ifstrempty{#1}{\mathbb{R}}{\mathbb{R}^{#1}}}}
	\newcommand{\N}[1][]{\ensuremath{\ifstrempty{#1}{\mathbb{N}}{\mathbb{N}^{#1}}}}
	\newcommand{\Z}[1][]{\ensuremath{\ifstrempty{#1}{\mathbb{Z}}{\mathbb{Z}^{#1}}}}
	\newcommand{\Q}[1][]{\ensuremath{\ifstrempty{#1}{\mathbb{Q}}{\mathbb{Q}^{#1}}}}
	\newcommand{\C}[1][]{\ensuremath{\ifstrempty{#1}{\mathbb{C}}{\mathbb{C}^{#1}}}}
	% commonly used macros
	\newcommand{\dd}[1][]{\ensuremath{\ifstrempty{#1}{\mathrm{d}}{\mathrm{d}^{#1}}}}
	\DeclareMathOperator{\Lap}{\mathcal{L}}

	% Since the amsthm package isn't loaded
	\newcommand*{\qed}{\hfill\ensuremath{\blacksquare}}
	\newcommand*{\qedhere}{\hfill\ensuremath{\square}}

	% I prefer the slanted \leq
	\let\oldleq\leq % save them in case they're every wanted
	\let\oldgeq\geq
	\renewcommand{\leq}{\leqslant}
	\renewcommand{\geq}{\geqslant}
}{}

% 1mu padding

\ifbool{optionMathSerif}{
	\renewcommand{\familydefault}{\rmdefault}
	\RequirePackage[basic,italic,symbolgreek]{mathastext}

	%
	% \@for\@tempa:=a,b,c,d,e,h,i,k,l,m,n,o,q,r,t,u,v,w\do{
	% \MTsetmathskips{\@tempa}{0.5mu}{0.5mu}}
	%


	\MTsetmathskips{a}{-0.20mu}{1.50mu}
	\MTsetmathskips{b}{-0.50mu}{1.50mu}
	\MTsetmathskips{c}{-0.50mu}{1.70mu}
	\MTsetmathskips{d}{-0.30mu}{1.70mu}
	\MTsetmathskips{e}{-0.50mu}{1.70mu}
	\MTsetmathskips{f}{2.40mu}{1.70mu}
	\MTsetmathskips{g}{0.50mu}{1.60mu}
	\MTsetmathskips{h}{-0.50mu}{1.00mu}
	\MTsetmathskips{i}{-0.50mu}{1.80mu}
	\MTsetmathskips{j}{2.20mu}{1.80mu}
	\MTsetmathskips{k}{-0.50mu}{1.50mu}
	\MTsetmathskips{l}{-0.80mu}{1.80mu}
	\MTsetmathskips{m}{-0.40mu}{1.00mu}
	\MTsetmathskips{n}{-0.40mu}{1.00mu}
	\MTsetmathskips{o}{-0.20mu}{1.30mu}
	\MTsetmathskips{p}{0.20mu}{1.50mu}
	\MTsetmathskips{q}{-0.20mu}{1.30mu}
	\MTsetmathskips{r}{-0.80mu}{1.80mu}
	\MTsetmathskips{s}{0.10mu}{1.50mu}
	\MTsetmathskips{t}{-1.00mu}{1.50mu}
	\MTsetmathskips{u}{-1.10mu}{1.30mu}
	\MTsetmathskips{v}{-1.10mu}{1.80mu}
	\MTsetmathskips{w}{-1.00mu}{1.80mu}
	\MTsetmathskips{x}{0.50mu}{1.70mu}
	\MTsetmathskips{y}{1.20mu}{1.80mu}
	\MTsetmathskips{z}{0.40mu}{1.30mu}

	\MTsetmathskips{A}{1.40mu}{1.40mu}
	\MTsetmathskips{B}{0.60mu}{1.70mu}
	\MTsetmathskips{C}{-0.80mu}{1.50mu}
	\MTsetmathskips{D}{0.50mu}{1.70mu}
	\MTsetmathskips{E}{0.60mu}{1.60mu}
	\MTsetmathskips{F}{0.60mu}{1.60mu}
	\MTsetmathskips{G}{-1.00mu}{1.60mu}
	\MTsetmathskips{H}{0.60mu}{1.70mu}
	\MTsetmathskips{I}{0.60mu}{1.70mu}
	\MTsetmathskips{J}{1.80mu}{1.70mu}
	\MTsetmathskips{K}{0.50mu}{1.70mu}
	\MTsetmathskips{L}{0.50mu}{1.60mu}
	\MTsetmathskips{M}{0.60mu}{1.70mu}
	\MTsetmathskips{N}{0.60mu}{1.70mu}
	\MTsetmathskips{O}{-1.00mu}{1.70mu}
	\MTsetmathskips{P}{0.30mu}{1.70mu}
	\MTsetmathskips{Q}{-0.90mu}{1.70mu}
	\MTsetmathskips{R}{0.20mu}{1.70mu}
	\MTsetmathskips{S}{-0.20mu}{1.70mu}
	\MTsetmathskips{T}{-1.30mu}{1.70mu}
	\MTsetmathskips{U}{-1.80mu}{1.70mu}
	\MTsetmathskips{V}{-1.30mu}{1.70mu}
	\MTsetmathskips{W}{-1.30mu}{1.70mu}
	\MTsetmathskips{X}{1.00mu}{1.70mu}
	\MTsetmathskips{Y}{-1.00mu}{1.70mu}
	\MTsetmathskips{Z}{1.00mu}{1.70mu}
}{}
\ifbool{optionMathSans}{
	\renewcommand{\familydefault}{\sfdefault}
	\RequirePackage[basic,italic,symbolgreek]{mathastext}

	%
	% \@for\@tempa:=a,b,c,d,e,h,i,k,l,m,n,o,q,r,s,t,u,v,w,x\do{
	% \MTsetmathskips{\@tempa}{0.5mu}{0.5mu}}
	%

	\MTsetmathskips{a}{0.00mu}{0.00mu}
	\MTsetmathskips{b}{0.30mu}{0.00mu}
	\MTsetmathskips{c}{0.00mu}{0.80mu}
	\MTsetmathskips{d}{0.00mu}{1.00mu}
	\MTsetmathskips{e}{0.00mu}{0.60mu}
	\MTsetmathskips{f}{2.60mu}{1.00mu}
	\MTsetmathskips{g}{1.30mu}{1.00mu}
	\MTsetmathskips{h}{0.40mu}{-0.10mu}
	\MTsetmathskips{i}{0.00mu}{1.00mu}
	\MTsetmathskips{j}{2.90mu}{1.00mu}
	\MTsetmathskips{k}{0.30mu}{0.90mu}
	\MTsetmathskips{l}{0.00mu}{1.00mu}
	\MTsetmathskips{m}{0.30mu}{-0.10mu}
	\MTsetmathskips{n}{0.30mu}{-0.10mu}
	\MTsetmathskips{o}{0.20mu}{0.10mu}
	\MTsetmathskips{p}{1.20mu}{0.00mu}
	\MTsetmathskips{q}{0.00mu}{0.30mu}
	\MTsetmathskips{r}{0.30mu}{1.00mu}
	\MTsetmathskips{s}{0.80mu}{0.30mu}
	\MTsetmathskips{t}{-0.20mu}{1.00mu}
	\MTsetmathskips{u}{-0.20mu}{0.30mu}
	\MTsetmathskips{v}{-0.30mu}{1.00mu}
	\MTsetmathskips{w}{-0.50mu}{1.00mu}
	\MTsetmathskips{x}{1.70mu}{1.00mu}
	\MTsetmathskips{y}{1.50mu}{1.00mu}
}{}
\ifbool{optionMathMono}{
	\renewcommand{\familydefault}{\ttdefault}
	\RequirePackage[basic,italic,symbolgreek]{mathastext}
}{}

% Text Font
% =========

\linespread{1.15}

\ifbool{optionSerif}{
	\renewcommand{\familydefault}{\rmdefault}
}{}
\ifbool{optionSans}{
	\renewcommand{\familydefault}{\sfdefault}
}{}
\ifbool{optionMono}{
	\renewcommand{\familydefault}{\ttdefault}
}{}

% Section font
% ============

\ifboolexpr{not bool {optionHeadingsSerif} and not bool {optionHeadingsSans} and not bool {optionHeadingsMono}}{
	\ifbool{optionSerif}{
		\booltrue{optionHeadingsSerif}
	}{}
	\ifbool{optionSans}{
		\booltrue{optionHeadingsSans}
	}{}
	\ifbool{optionMono}{
		\booltrue{optionHeadingsMono}
	}{}
}{}

\ifbool{optionHeadingsSerif}{
	\newcommand{\headingsFont}{\rmdefault}
	\newcommand{\titleFont}{\rmdefault}
}{}
\ifbool{optionHeadingsSans}{
	\newcommand{\headingsFont}{\sfdefault}
	\newcommand{\titleFont}{\sfdefault}
}{}
\ifbool{optionHeadingsMono}{
	\newcommand{\headingsFont}{\ttdefault}
	\newcommand{\titleFont}{\ttdefault}
}{}

% Small Caps - source: https://tex.stackexchange.com/a/225078/167605
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\newlength\fake@f
\newlength\fake@c
\def\fakesc#1{%
\begingroup%
\xdef\fake@name{\csname\curr@fontshape/\f@size\endcsname}%
\fontsize{\fontdimen8\fake@name}{\baselineskip}\selectfont%
\uppercase{#1}%
\endgroup%
}


\newcommand\fauxsc[1]{\fauxschelper#1 \relax\relax}
\def\fauxschelper#1 #2\relax{%
\fauxschelphelp#1\relax\relax%
\if\relax#2\relax\else\ \fauxschelper#2\relax\fi%
}
\def\Hscale{.83}\def\Vscale{.72}\def\Cscale{1.00}
\def\fauxschelphelp#1#2\relax{%
\ifnum`#1>``\ifnum`#1<`\{\scalebox{\Hscale}[\Vscale]{\uppercase{#1}}\else%
	\scalebox{\Cscale}[1]{#1}\fi\else\scalebox{\Cscale}[1]{#1}\fi%
\ifx\relax#2\relax\else\fauxschelphelp#2\relax\fi}

% Add colour to \em
\let\oldem\em
\renewrobustcmd{\em}{\fontseries{l}\selectfont\oldem}

% Add colour to inline math
\renewrobustcmd{\(}{\@ifstar\@inlinemath\@@inlinemath}
\DeclareRobustCommand{\@inlinemath}{\relax\ifmmode\@badmath\else$\fi}
\DeclareRobustCommand{\@@inlinemath}{\relax\ifmmode\@badmath\else$\fi\color{tertiary!50!text}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%		Titling
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Cover Page
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% \newcommand\subtitle[1]{\renewcommand\@foo{#1}}
% \newcommand\@subtitle{\@latex@error{No \noexpand\subtitle given}\@ehc}

\renewcommand{\maketitle}{
	\ifbool{optionSolid}{
		\pagecolor{primary}
	}{
		\pagecolor{page}
	}

	\begin{titlepage}
		\newgeometry{left=4cm,right=2.7cm, top=1.5cm}

		\ifbool{optionSolid}{
			\ifbool{optionDark}{
				\color{page}
			}{
				\color{contrastColour}
			}
		}{
			\color{primary}
		}

		\fontfamily{\titleFont}\selectfont

		\ifdefempty{\@titlehead}{}{
			\begin{center}
				\LARGE
				% \ifbool{optionSolid}{
				% 	\color{alternativePrimary}
				% }{
						\color{primary!60!contrastColour}
				% }
				\expandafter\fauxsc\expandafter{\@titlehead}
				%
			\end{center}
		}

		\vspace*{3.5cm}

		\fontsize{2cm}{4em}\fontseries{sb}\selectfont
		\@title
		\vspace{-1.1cm}

		\noindent\makebox[\linewidth]{
			\hspace{2.64cm}
			\ifbool{optionSolid}{
				\ifbool{optionDark}{
					\color{contrastColour}
				}{
					\color{alternativePrimary}
				}
			}{
				\color{primaryVariant}
			}
			\rule{\paperwidth-2.64cm}{2pt}
		}

		\hspace*{-0.25mm}\fontseries{r}\selectfont\huge\@subtitle

		\vspace{2.5cm}

		\fontseries{l}\selectfont
		\@author

		\vfill

		% @\subject

		\vspace{1.5cm}

		% \@publishers

		\fontseries{r}\selectfont\Large
		\@date

		\restoregeometry
	\end{titlepage}

	\newpage
	\pagecolor{page}
}


\AtBeginDocument{%
	\color{text}
	\pagecolor{page}
}

% Other Titling
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\ifbool{optionArticle}{
}{

\RequirePackage{titlesec}
% Chapter format
\titleformat{\chapter}[display]
	{}
	{\titleBackground\thispagestyle{empty}}
	{4pt}
	{
		\begin{minipage}[t]{8.2cm-\leftmargin}
			\mbox{}\\
			\null\hfill\fontsize{6.5cm}{1ex}\selectfont{\ifbool{optionSolid}{\color{page}}{\color{primary}}\thechapter}
		\end{minipage}
		\hspace*{-5mm}
		\begin{minipage}[t]{\paperwidth-7cm-\leftmargin}
			\mbox{}\\
			\vspace*{-1.1cm}
			\begin{flushleft}
				\begin{spacing}{5}
					\fontsize{1.7cm}{1em}
					\fontseries{tx}
					\selectfont
					\ifbool{optionDark}{
						\color{primaryVariant}
					}{
						\color{alternativePrimary}
					}
	}[\end{spacing}\end{flushleft}\end{minipage}]

\titleformat{name=\chapter, numberless}[display]
	{}
	{\titleBackground\thispagestyle{empty}}
	{0pt}
	{
		\fontsize{2cm}{1em}
	}

}


\addtokomafont{section}{\Huge\color{primary}\bfseries\fontfamily{\headingsFont}\selectfont}
\addtokomafont{subsection}{\huge\color{primary}\fontseries{sb}\fontfamily{\headingsFont}\selectfont}
\addtokomafont{subsubsection}{\LARGE\color{primary}\fontseries{sb}\fontfamily{\headingsFont}\selectfont}
\addtokomafont{paragraph}{\color{primary!70!text}\fontseries{mb}\fontfamily{\headingsFont}\selectfont}
\addtokomafont{subparagraph}{\color{primary!70!text}\fontseries{mb}\fontfamily{\headingsFont}\selectfont}

\renewcommand{\sectionformat}{
    \bfseries\itshape\thesection\enspace
}

\renewcommand{\subsectionformat}{
    \bfseries\itshape\thesubsection\enspace
}

\renewcommand{\subsubsectionformat}{
    \bfseries\itshape\thesubsubsection\enspace
}

\ifbool{optionArticle}{
	\renewcommand{\sectionlinesformat}[4]{
		#4 \hfill #3
		\vspace*{-.5\baselineskip}
		\mbox{}
		\textcolor{primary}{\rule{\textwidth}{.4pt}}\par\nobreak
	}
}{}

\RedeclareSectionCommands[indent=0em]{section,subsection,subsubsection}

% \titleformat
% {\section} % command
% {\huge} % format
% {\hspace*{-3mm}\fontsize{3ex}{3.6ex}\sectionNumbers\selectfont\color{sectionNumbersColor}\raisebox{-1mm}{\thesection}}
% % label
% {-3mm} % sep
% {\fontspec{Fira Sans Medium}\selectfont} % before
% {}

% \titleformat{\subsection}{\LARGE}{%
% 	\hspace*{-3mm}\fontsize{3ex}{3.6ex}\selectfont\color{subsectionNumbersColor}%
% 	\raisebox{-1mm}{\thesubsection}%
% }{-3mm}{}{}


	%Titling spacing
% \titlespacing*{\chapter}{0mm}{0pt}{10pt}
% \titlespacing*{name=\chapter,numberless}{0pt}{10pt}{0pt} %starred version of chapter default: 0pt, 50pt, 40pt
% \titlespacing*{\section}{0mm}{4mm}{3mm}
% \titlespacing*{\subsection}{0mm}{3mm}{2mm}
% \titlespacing*{\subsubsection}{0mm}{2mm}{1.5mm}

% Make parahraphs and subparagraphs more like sections (unless disabled)
\ifbool{optionParagraph}{}{
	\ifx\paragraph\undefined\else
	\let\oldparagraph\paragraph
	\renewcommand{\paragraph}[1]{\oldparagraph{#1}\mbox{}}
	\fi
	\ifx\subparagraph\undefined\else
	\let\oldsubparagraph\subparagraph
	\renewcommand{\subparagraph}[1]{\oldsubparagraph{#1}\mbox{}}
	\fi
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%		ToC and Mini-ToC
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{titletoc}
\RequirePackage{framed}
\RequirePackage[absolute,overlay]{textpos}

\newcommand{\fancytoc}{
	% \titleBackground
	{\hypersetup{linkcolor=text}
		\setcounter{tocdepth}{0}
		\begingroup
			\let\clearpage\relax
			\tableofcontents
		\endgroup
	}
	\begin{textblock*}{5cm}(1.6cm,6cm) % {block width} (coords)
		\fontsize{4cm}{2em}\selectfont
		\rotatebox[origin=c]{90}{\color{primaryVariant}Contents}
	\end{textblock*}
	\newpage
}

%		ToC
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\ifbool{optionArticle}{
	\renewcommand{\contentsname}{Contents}
}{
	\renewcommand{\contentsname}{}
}

\pretocmd{\tableofcontents}{\hypertarget{contents}{}}{}{}

\newenvironment{tocChapterText}{
	\def\FrameCommand{
		\ifbool{optionNotes}{
			\hspace*{\dimexpr13.3cm-1\leftmargin\relax}
		}{
			\hspace*{\dimexpr9.7cm-1\leftmargin\relax}
		}
	}
	\MakeFramed{
		% \parshape 1 0cm .75\textwidth \relax\FrameRestore
		\parshape 1 0cm 12.5cm \relax
	}
}{\endMakeFramed}
\titlecontents{chapter}[0em]{\vspace*{1\baselineskip}}{
	\parbox{7.5cm-\leftmargin}{\hfill{\ifbool{optionSolid}{\hypersetup{linkcolor=contrastColour}}{\hypersetup{linkcolor=primary}}\fontsize{1.5cm}{1ex}\selectfont\color{page}\thecontentspage}\hspace*{3mm}}
	\vspace*{-1.48cm}\fontfamily{\headingsFont}\selectfont\tocChapterText{\large\chaptertitlename~\thecontentslabel}
	\\[-3mm]
	\huge\fontfamily{\familydefault}\selectfont
}{}{\endtocChapterText\vskip-5mm}

%		Mini-ToC
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\printMiniToc}{
	\vfill
	\hspace*{\dimexpr-1\leftmargin+6.7cm\relax}\parbox[t]{\paperwidth-6.5cm-\leftmargin}{
		\hspace*{-3mm}\raisebox{0.25mm}{\fontsize{0.6cm}{1ex}\selectfont\ifbool{optionSolid}{\color{contrastColour}}{\color{primary}}\faList}
		\ifbool{optionSerif}{\hspace*{5.5mm}}{\hspace*{6.5mm}} {\fontfamily{\headingsFont}\fontseries{tx}\selectfont\huge{Summary}}
		\vspace*{2mm}
		\startcontents[chapters]
		\hypersetup{linkcolor=text}
		\begin{spacing}{1}
			\printcontents[chapters]{p}{1}{\setcounter{tocdepth}{1}}
		\end{spacing}
	}
	\vfill
	\newpage
}


%Redefining toc style so that it dont get indented in partialTocs
\titlecontents{psection}[3em]
{} {\large{\ifbool{optionSolid}{\color{contrastColour}}{\color{primary}}\bfseries\contentslabel{3.5em}}} {} {, \thecontentspage}

\titlecontents{psubsection}[3em]
{} {\large{\ifbool{optionSolid}{\color{contrastColour}}{\color{primary}}\bfseries\contentslabel{3.5em}}} {} {, \thecontentspage} %\contentslabel{4.2em} to right-align

\ifbool{optionSolid}{
	\newcommand{\titleBackground}{
		\begin{tikzpicture}[remember picture, overlay]
			\fill[fill=primary] (current page.south west) rectangle ++(7.5cm, \paperheight);
		\end{tikzpicture}
	}
}{}

\ifbool{optionStripe}{
	\newcommand{\titleBackground}{
		\begin{tikzpicture}[remember picture, overlay]
			\fill[fill=primary] ([xshift=7.42cm]current page.south west) rectangle ++(1mm, \paperheight);
		\end{tikzpicture}
	}
}{}

\ifboolexpr{not bool {optionSolid} and not bool {optionStripe}}{
	\newcommand{\titleBackground}{}
}{}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%		Links
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{hyperref}
\RequirePackage{hyperxmp}
\AtEndPreamble{
	\hypersetup{
		pdftoolbar=false,
		pdfmenubar=true,
		pdffitwindow=false,
		pdfborder={1 1 0},
		pdftitle={\@title},
		pdfauthor={\@author},
		pdfsubject={\@subtitle},
		pdfcreator=pdfLaTeX,
		% pdfkeywords={{a}{b}},
		colorlinks=true,
		linkcolor=href,
		linktoc=all,
		urlcolor=href,
		citecolor=href,
		filecolor=href,
		breaklinks=true
	}
}
\urlstyle{same}

%%%%%%%%%%%%%%%%%%

% Automatically add to \chapter

% \let\oldscr@@startchapter\scr@@startchapter
% \def\scr@@startchapter#1[#2]#3{%
% 	\oldscr@@startchapter{#1}[#2]{#3}%
% 	% \newgeometry{right=2.7cm, marginparwidth=0cm, marginparsep=0mm}
% 	\printMiniToc
% 	% \restoregeometry
% }

% \xpretocmd{\scr@@startchapter}{}{}{}
\xapptocmd{\scr@@startchapter}{\printMiniToc}{}{}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%      Header and Footer
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\ifdraft{
	\AfterPackage*{scrlayer-scrpage}{%
    \DeclareNewLayer[
      head,
      height=0pt,
      foreground,
      contents=\textcolor{text!60!page}{\layercontentsmeasure}
    ]{head.ruler}
    \DeclareNewLayer[
      foot,
      height=0pt,
      addvoffset=\footheight-\dp\strutbox,
      background,
      contents=\textcolor{text!60!page}{\layercontentsmeasure}
    ]{foot.ruler}
    \AddLayersAtBeginOfPageStyle{scrheadings}{head.ruler,foot.ruler}
    \AddLayersAtBeginOfPageStyle{plain.scrheadings}{head.ruler,foot.ruler}
  }
}{

	\clearpairofpagestyles
	\cfoot*{\hyperlink{contents}{\pagemark}}

	\ifbool{optionArticle}{
		\chead{\hypersetup{colorlinks,allcolors=.}\hyperlink{section.\arabic{section}}{\headmark}}
	}{
		\chead{\hypersetup{colorlinks,allcolors=.}\hyperlink{chapter.\arabic{chapter}}{\headmark}}
	}

	\addtokomafont{pagehead}{\fontfamily{\headingsFont}\selectfont\bfseries\upshape\ifbool{optionSolid}{\color{contrastColour}}{\color{primary}}}
	\addtokomafont{pagenumber}{\fontfamily{\headingsFont}\fontseries{sb}\selectfont\color{primary}}

	% shift the predefined head layers
	\ForEachLayerOfPageStyle*{scrheadings}{%
	\ifstrstart{#1}{scrheadings.head.}
		{\ModifyLayer[addvoffset=-.5in-.5\voffset-.5\topmargin]{#1}}
		{}%
	}
	\ForEachLayerOfPageStyle*{plain.scrheadings}{%
	\ifstrstart{#1}{plain.scrheadings.head.}
		{\ModifyLayer[addvoffset=-.5in-.5\voffset-.5\topmargin]{#1}}
		{}%
	}

	% Defining the Layer
	\DeclareLayer[
		background,
		topmargin,
		addheight=\headheight,
		contents={%
			\ifbool{optionSolid}{\color{primary}}{\color{page}}
			\rule{\layerwidth}{\layerheight}%
		}%
	]{my.head.background}

	%Adding the Layer to the pagestyles
	\AddLayersAtBeginOfPageStyle{scrheadings}{my.head.background}
	\AddLayersAtBeginOfPageStyle{plain.scrheadings}{my.head.background}

}

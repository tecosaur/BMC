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
% The Current Maintainer of this work is M. Y. Name.
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
\booltrue{optionSans}
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
		\PassOptionsToClass{\CurrentOption}{scscrartclrreprt}
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

% \RequirePackage{etex}
\RequirePackage[activate={true,nocompatibility},final,tracking=true,kerning=true,spacing=true,factor=1100,stretch=15,shrink=15]{microtype}
\microtypecontext{spacing=nonfrench}
\RequirePackage{calc}
\RequirePackage[usenames,dvipsnames,svgnames,table]{xcolor}
\RequirePackage[automark]{scrlayer-scrpage}
\RequirePackage{setspace}
\RequirePackage{tikz}
\ifbool{optionPlot}{
	\RequirePackage{pgfplots}
	\pgfplotsset{compat=1.16}
}{}
\RequirePackage{ctable}
\RequirePackage{tabularx}
\RequirePackage{multicol}
\RequirePackage{graphicx}
\RequirePackage{grffile} % fix allowed filenames
\RequirePackage{subcaption}
\usepackage[hypcap=true]{caption}

\RequirePackage{fontawesome5}
\RequirePackage{infoBulle}
\RequirePackage{marginInfoBulle}

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
}{}

% Layout
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\setlength{\leftmargin}{2.5cm}

\ifbool{optionNotes}{
	\setlength{\rightmargin}{1cm}
	\RequirePackage[a4paper, ignoreheadfoot, includemp, left=\leftmargin, right=\rightmargin, top=2cm, bottom=3.5cm, headsep=1cm, marginparwidth=4cm, marginparsep=5mm ]{geometry}
}{
	\setlength{\rightmargin}{2.7cm}
	\RequirePackage[a4paper, ignoreheadfoot, left=\leftmargin, right=\rightmargin, top=2cm, bottom=3.5cm, headsep=1cm, marginparwidth=0cm, marginparsep=0mm ]{geometry}
}

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
\definecolor{primaryVarient}{HTML}{1CBE77} % emerald mixed with lighter green
\definecolor{contrastColour}{HTML}{E8F1F2} % white

\definecolor{secondary}{HTML}{C47238} % orange
\definecolor{tertiary}{HTML}{C6B53C} % yellow
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
\definecolor{Red}{HTML}{eb3b5a}
\definecolor{LightRed}{HTML}{fc5c65}

\definecolor{Yellow}{HTML}{f7b731}
\definecolor{LightYellow}{HTML}{fed330}

\definecolor{Blue}{HTML}{3867d6}
\definecolor{LightBlue}{HTML}{4b7bec}
% Secondary Colours
\definecolor{Green}{HTML}{20bf6b}
\definecolor{LightGreen}{HTML}{26de81}

\definecolor{Orange}{HTML}{fa8231}
\definecolor{LightOrange}{HTML}{fd9644}

\definecolor{Purple}{HTML}{8854d0}
\definecolor{LightPurple}{HTML}{a55eea}
% Tertiary+ Colours
% \definecolor{Brown}{HTML}{}
\definecolor{Cyan}{HTML}{0fb9b1}
\definecolor{LightCyan}{HTML}{2bcbba}

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
% % Secondary Colours
% \definecolor{Green}{HTML}{27ae60}
% \definecolor{LightGreen}{HTML}{2ecc71}

% \definecolor{Orange}{HTML}{e67e22}
% \definecolor{LightOrange}{HTML}{f39c12}

% \definecolor{Purple}{HTML}{8e44ad}
% \definecolor{LightPurple}{HTML}{9b59b6}
% % Tertiary+ Colours
% % \definecolor{Brown}{HTML}{}
% \definecolor{Cyan}{HTML}{16a085}
% \definecolor{LightCyan}{HTML}{1abc9c}


% redefine info bulle colours

\colorlet{informationColor}{primaryVarient}
\colorlet{infoBulleBackground}{page!80!text}
\colorlet{infoBulleText}{text}
\colorlet{marginInfoBulleBackground}{page}
\colorlet{marginInfoBulleText}{text}

% set link colour
\ifbool{optionDark}{
	\colorlet{hrefColor}{tertiary}
}{
	\colorlet{hrefColor}{secondary}
}

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

\ifboolexpr{bool {optionMathSerif} or bool {optionMathSans} or bool {optionMathMono}}{
	\RequirePackage{amsmath,amssymb}
	\RequirePackage{fourier}
	\RequirePackage{xfrac}
	\RequirePackage[makeroom]{cancel}

	\usepackage{mathtools}
	\DeclarePairedDelimiter{\abs}{\lvert}{\rvert}
	\DeclarePairedDelimiter{\norm}{\lVert}{\rVert}
	\newcommand{\R}{\mathbb{R}}
	\newcommand{\N}{\mathbb{N}}
	\newcommand{\Z}{\mathbb{Z}}
	\newcommand{\C}{\mathbb{C}}
	\newcommand{\dd}{\mathrm{d}}
	\newcommand{\Lap}{\mathcal{L}}
}{}
\ifbool{optionMathSerif}{
	\renewcommand{\familydefault}{\rmdefault}
	\RequirePackage[basic,italic,symbolgreek]{mathastext}

	%
	% \@for\@tempa:=a,b,c,d,e,h,i,k,l,m,n,o,q,r,t,u,v,w\do{
	% \MTsetmathskips{\@tempa}{0.5mu}{0.5mu}}
	%

	\MTsetmathskips{f}{4.5mu}{0.5mu}
	\MTsetmathskips{g}{2.5mu}{0.5mu}
	\MTsetmathskips{j}{4mu}{0.5mu}
	\MTsetmathskips{p}{2.5mu}{0mu}
	\MTsetmathskips{s}{1mu}{0.5mu}
	\MTsetmathskips{x}{1.5mu}{0.5mu}
	\MTsetmathskips{y}{3.5mu}{0.5mu}
	\MTsetmathskips{z}{1.5mu}{0.5mu}
}{}
\ifbool{optionMathSans}{
	\renewcommand{\familydefault}{\sfdefault}
	\RequirePackage[basic,italic,symbolgreek]{mathastext}

	%
	% \@for\@tempa:=a,b,c,d,e,h,i,k,l,m,n,o,q,r,s,t,u,v,w,x\do{
	% \MTsetmathskips{\@tempa}{0.5mu}{0.5mu}}
	%

	\MTsetmathskips{f}{2.5mu}{0.5mu}
	\MTsetmathskips{g}{1.5mu}{0.5mu}
	\MTsetmathskips{j}{2.5mu}{0.5mu}
	\MTsetmathskips{p}{1.5mu}{0mu}
	\MTsetmathskips{y}{1.5mu}{0.5mu}
	\MTsetmathskips{z}{1mu}{0.5mu}
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

% Small Caps
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

		\begin{center}
			\LARGE
			% \ifbool{optionSolid}{
			% 	\color{alternativePrimary}
			% }{
					\color{primary!60!contrastColour}
			% }
			% \expandafter\fauxsc\expandafter{\@titlehead}
			\@titlehead
		\end{center}

		\vspace*{3.5cm}

		\fontsize{2cm}{2em}\selectfont
		\textbf{\@title}
		\vspace{-0.5cm}

		\noindent\makebox[\linewidth]{
			\hspace{2.8cm}
			\ifbool{optionSolid}{
				\ifbool{optionDark}{
					\color{contrastColour}
				}{
					\color{alternativePrimary}
				}
			}{
				\color{primaryVarient}
			}
			\rule{\paperwidth-2.8cm}{2pt}
		}

		\hspace*{1mm}\huge\@subtitle

		\vspace{2.5cm}

		\textbf{\@author}

		\vfill

		% @\subject

		\vspace{1.5cm}

		% \@publishers

		\Large
		\@date

		\restoregeometry
	\end{titlepage}

	\newpage
	\pagecolor{page}
}


\color{text}
\pagecolor{page}

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
					\fontsize{1.7cm}{1em}\selectfont
					\ifbool{optionDark}{
						\color{primaryVarient}
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


\addtokomafont{section}{\Huge\color{primary}\fontfamily{\headingsFont}\selectfont}
\addtokomafont{subsection}{\huge\color{primary}\fontfamily{\headingsFont}\selectfont}
\addtokomafont{subsubsection}{\LARGE\color{primary}\fontfamily{\headingsFont}\selectfont}
\addtokomafont{paragraph}{\color{primary!70!text}\fontfamily{\headingsFont}\selectfont}
\addtokomafont{subparagraph}{\color{primary!70!text}\fontfamily{\headingsFont}\selectfont}

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
		\rotatebox[origin=c]{90}{\color{primaryVarient}Contents}
	\end{textblock*}
	\newpage
}

%		ToC
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\ifboolexpr{bool {optionSolid} and not bool {optionArticle}}{
	\renewcommand{\contentsname}{}
}{
	\renewcommand{\contentsname}{Contents}
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
	\parbox{7.5cm-\leftmargin}{\hfill{\ifbool{optionSolid}{\hypersetup{linkcolor=contrastColour}}{\hypersetup{linkcolor=primary}}\fontsize{1.5cm}{1ex}\selectfont\thecontentspage}\hspace*{3mm}}
	\vspace*{-1.48cm}\tocChapterText{\large\chaptertitlename~\thecontentslabel}
	\\[-3mm]
	\huge
}{}{\endtocChapterText\vskip-5mm}

%		Mini-ToC
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\printMiniToc}{
	\vfill
	\hspace*{\dimexpr-1\leftmargin+6.7cm\relax}\parbox[t]{\paperwidth-6.5cm-\leftmargin}{
		\hspace*{-5mm}\raisebox{0.25mm}{\fontsize{0.6cm}{1ex}\selectfont\ifbool{optionSolid}{\color{contrastColour}}{\color{primary}}\faList}
		\hspace*{9.6mm} {\huge{Summary}}
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
\hypersetup{
	pdftoolbar=false,
	pdfmenubar=true,
	pdffitwindow=false,
	pdfborder={1 1 0},
	pdftitle={\@title},
	pdfauthor={\@author},
	pdfsubject={\@subtitle},
	pdfcreator=LaTeX,
	% pdfkeywords={{a}{b}},
	colorlinks=true,
	linkcolor=hrefColor,
	linktoc=all,
	urlcolor=hrefColor,
	citecolor=hrefColor,
	filecolor=hrefColor,
	breaklinks=true
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


\clearpairofpagestyles
\cfoot*{\hyperlink{contents}{\pagemark}}

\ifbool{optionArticle}{
	\chead{\hypersetup{colorlinks,allcolors=.}\hyperlink{section.\arabic{section}}{\headmark}}
}{
	\chead{\hypersetup{colorlinks,allcolors=.}\hyperlink{chapter.\arabic{chapter}}{\headmark}}
}

\addtokomafont{pagehead}{\bfseries\upshape\ifbool{optionSolid}{\color{contrastColour}}{\color{primary}}}
\addtokomafont{pagenumber}{\bfseries\color{primary}}

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

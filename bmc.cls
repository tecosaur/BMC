%══════════════════════════════════════════%
%                                          %
%                  BMC                     %
%     A Bespoke, Multipurpose Class        %
%                 -~=~-                    %
%          Authored by tecosaur            %
%        Insired by Yves Zumbach           %
%                                          %
%══════════════════════════════════════════%


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
% This work consists of the files bmc.cls, accompanying bmc-*.sty files,
% and modifications made to infoBulle.sty and marginInfoBulle.sty


\ProvidesClass{bmc}[1/1/2019 Bespoke Multipurpose Class]
\NeedsTeXFormat{LaTeX2e}

\newcommand*{\@bmc}{true}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%		Options
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{etoolbox}
\RequirePackage{kvoptions}

\SetupKeyvalOptions{family=bmc, prefix=bmc@}

% General
\DeclareBoolOption{solid}
\DeclareBoolOption{stripe}

\DeclareBoolOption{article}

\DeclareBoolOption{paragraph}

% extras
\DeclareBoolOption{notes}
\DeclareBoolOption{chem}
\DeclareBoolOption{code}
\DeclareBoolOption{plot}
\DeclareBoolOption{externalise}

% text font
\DeclareBoolOption{serif}
\DeclareBoolOption{sans}
\DeclareBoolOption{mono}
\DeclareStringOption[serif]{body} % serif, sans, or mono

\DeclareStringOption{math}[serif] % serif, sans, or mono

\DeclareBoolOption{headingsSerif}
\DeclareBoolOption{headingsSans}
\DeclareBoolOption{headingsMono}
\DeclareStringOption[sans]{headings} % serif, sans, or mono

% colour options
\DeclareBoolOption[true]{light}
\DeclareBoolOption{dark}
\DeclareStringOption[de]{palette}

\DeclareDefaultOption{
	\ifbool{bmc@article}{
		\PassOptionsToClass{\CurrentOption}{scrartcl}
	}{
		\PassOptionsToClass{\CurrentOption}{scrreprt}
	}
}

\ProcessKeyvalOptions*

% process values

\newcommand{\ifdefstringx}[2]{%
  \begingroup
  \edef\x{#1}%
  \ifdefstring{\x}{#2}{\endgroup\@firstoftwo}{\endgroup\@secondoftwo}%
}

\ifbool{bmc@serif}{
	\renewcommand{\bmc@body}{serif}
}{}
\ifbool{bmc@sans}{
	\renewcommand{\bmc@body}{sans}
}{}
\ifbool{bmc@mono}{
	\renewcommand{\bmc@body}{mono}
}{}

\ifbool{bmc@headingsSerif}{
	\renewcommand{\bmc@headings}{serif}
}{}
\ifbool{bmc@headingsSans}{
	\renewcommand{\bmc@headings}{sans}
}{}
\ifbool{bmc@headingsMono}{
	\renewcommand{\bmc@headings}{mono}
}{}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%		Basic settings, options processing
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\ifbool{bmc@article}{
	\LoadClass[usegeometry,pointlessnumbers]{scrartcl}
}{
	\LoadClass[usegeometry,pointlessnumbers]{scrreprt}
}

% Ignore Certain Warnings
\RequirePackage{silence}
\WarningFilter{microtype}{You are using the `ragged2e' package}
\WarningFilter{mathdesign}{Package 'amsfonts' shouldn't be used in conjonction with package mdput}
\WarningFilter{mathdesign}{Package 'amssymb' shouldn't be used in conjonction with package mdput}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%		Some nice packages
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{ifdraft}
\RequirePackage[automark,draft=false,headwidth=textwithmarginpar,footwidth=head]{scrlayer-scrpage}
\RequirePackage{calc}
\ifdraft{
	\PassOptionsToPackage{gray}{xcolor}
}{}
\RequirePackage[usenames,dvipsnames,svgnames,table]{xcolor}

\RequirePackage{tikz}
\ifbool{bmc@externalise}{
	\usetikzlibrary{external}
	\tikzexternalize[
		prefix=tikz/,
		% mode=list and make,
		only named=true
	]
	% \tikzset{external/system call={pdflatex \tikzexternalcheckshellescape
	% 	-halt-on-error -interaction=batchmode -jobname "\image" "\texsource"}
	% }
}{}
\ifbool{bmc@plot}{
	\RequirePackage{pgfplots}
	\usetikzlibrary{plotmarks}
	\usepgfplotslibrary{fillbetween}
	\usetikzlibrary{arrows.meta}
	\pgfplotsset{
		compat=newest,
		% only marks,
		% -- LEGEND
		legend pos=outer north east,
		legend style={
			draw=none,
			fill opacity=0.75,
			fill=text!6!page,
			text opacity=1
		},
		legend cell align={left},
		% -- AXIS
		axis lines=middle,
		inner axis line style={-Latex[round]}, % TODO: improve look of arrow
		axis on top,
		% -- TICKS
		minor x tick num=1,
		% xtick pos=left,
		% ytick pos=left,
		enlarge x limits=false,
		every x tick/.style={color=text, thin},
		every y tick/.style={color=text, thin},
		tick align=outside,
		% -- LABELS
		yticklabel style={/pgf/number format/fixed},
		every tick label/.append style={font=\fontfamily{\sfdefault}\selectfont},
		xlabel near ticks,
		ylabel near ticks,
		% -- COLOURS
		cycle list={quatrinary\\secondary\\primary\\tertiary\\},
		%
		every axis plot/.append style={
			very thick,
		},
		% every inner x axis line/.append style={|->},
		% every patch/.append style={line join=round,line cap=round}
		% every axis/.append style={axis line style={<->}}
		% tick label style = {font=\large},
		% every axis label = {font=\sffamily},
		% legend style = {font=\sffamily},
		% label style = {font=\sffamily},
		% small,
	}
}{}

\RequirePackage{booktabs}
\RequirePackage{tabularx}
\RequirePackage{longtable}

\RequirePackage{multicol}
% \RequirePackage{siunitx}

\RequirePackage{graphicx}
\RequirePackage{grffile} % fix allowed filenames

\RequirePackage{subcaption}
\RequirePackage[hypcap=true]{caption}

\RequirePackage{fontawesome5}
\RequirePackage{infoBulle}
\RequirePackage{marginInfoBulle}

% \RequirePackage[check=warning]{widows-and-orphans} % wait till texlive 2019

\RequirePackage{xpatch}

\ifbool{bmc@chem}{
	\RequirePackage[version=4]{mhchem}
	\RequirePackage{chemfig}
	\setchemfig{
		chemfig style={line width=0.06642 em},  % 'Line Width'
		angle increment=30,
		double bond sep=0.35700 em,  % 'Bond Spacing'
		atom sep=1.78500 em,  % 'Fixed Length'
		bond offset=0.18265 em  % 'Margin Width'
	}
	\renewcommand*\printatom[1]{\small\ensuremath{\mathsf{#1}}}
	% \ifbool{bmc@externalise}{ % source: https://tex.stackexchange.com/questions/245015/precompile-molecules-for-faster-compilation/

	% \def\CF@chemfig@iii[#1][#2]{%
	% 	\edef\CF@tmp@str{\noexpand\begin{tikzpicture}[remember picture,every node/.style={anchor=base,inner sep=\z@,outer sep=\z@,minimum size=\z@\ifx\@empty#2\@empty\else,#2\fi},baseline\ifx\@empty#1\@empty\else,#1\fi]}%
	% 	\begingroup
	% 		\everyeof{\@nil}\endlinechar\m@ne
	% 		\CF@sanitize@catcode
	% 		\CF@chemfig@iv
	% }

	% \def\CF@chemfig@iv#1{%
	% 	\CF@tmp@str
	% 		\let\CF@hook@list\@empty
	% 		\ifx\CF@atom@sep\@empty\def\CF@atom@sep{3em}\fi
	% 		\ifx\CF@cram@basewidth\@empty\def\CF@cram@basewidth{1.5ex}\fi
	% 		\CF@incyclefalse
	% 		\CF@cnt@groupnumber\z@
	% 		\let\CF@last@action\z@% 0=d\'ebut du dessin 1=trac\'e d'un noeud 2=trac\'e d'une liaison
	% 		\let\CF@start@offset\@empty
	% 		\let\CF@end@offset\@empty
	% 		\let\CF@bond@outcontentsaved\@empty
	% 		\def\CF@cycle@anglecorrection{180/\CF@cycle@num}%
	% 		\def\CF@default@angle{0}%
	% 		\def\CF@default@stringangle{:0}% angle pris par d\'efaut si le champ est vide
	% 		\def\CF@default@length{1}%
	% 		\let\CF@default@fromatom\@empty% numero de l'atome d'o\`u partent les liaisons par d\'efaut
	% 		\let\CF@default@toatom\@empty% num\'ero de l'atome o\`u arrivent les laisons par d\'efaut
	% 		\let\CF@default@tikz\@empty
	% 		\let\CF@previous@bondangle\empty
	% 		\let\CF@joinbond\z@
	% 		\let\CF@previous@tikz\empty
	% 		\expandafter\assign@tonil\expandafter\CF@remain@molecule\scantokens{#1}%
	% 		\expandafter\CF@chemfig@v\expandafter{\CF@remain@molecule}%
	% 	\end{tikzpicture}%
	% 	\endgroup
	% 	\let\CF@split@state\z@
	% }
	% \def\CF@chemfig@vi{%
	% 	\let\CF@next@action\CF@chemfig@vi% \`a priori, on reboucle
	% 	\ifx\CF@remain@molecule\@empty
	% 		\let\CF@next@action\empty
	% 	\else
	% 		\CF@seek@submol
	% 		\expandafter\CF@seek@node\expandafter{\CF@remain@molecule}\CF@current@atomgroup\CF@remain@molecule
	% 		\ifx\@empty\CF@current@atomgroup% pas de noeud pour commencer ?
	% 			\def\CF@bond@outnode{n\CF@last@groupnumber-%
	% 				\ifx\CF@current@fromatom\@empty
	% 					\ifdim\CF@current@angle pt<90pt \number\CF@cnt@atomingroup
	% 					\else\ifdim\CF@current@angle pt>270pt \number\CF@cnt@atomingroup\else1\fi
	% 					\fi
	% 				\else\CF@current@fromatom
	% 				\fi}%
	% 			\expandafter\futurelet\expandafter\CF@toks@a\expandafter\CF@gobble@tonil\CF@remain@molecule\relax\@nil
	% 			\CF@if@firsttokin@i{-=<>~}% la suite est une liaison
	% 				{\ifnum\CF@last@action=\tw@% c'est la deuxi\`eme liaison cons\'ecutive ?
	% 					\CF@insert@emptygroup\CF@remain@molecule% ins\`ere un groupe vide
	% 					\edef\CF@bond@outnode{\CF@bond@outnode}%
	% 				\else
	% 					\ifCF@incycle\advance\CF@cnt@cycle\@ne\fi
	% 					\expandafter\CF@analyse@bond\expandafter{\CF@remain@molecule}\CF@bond@type
	% 					\edef\CF@bond@outnode{\CF@bond@outnode}%
	% 					\let\CF@remain@molecule\CF@remain@afterbond
	% 					\ifCF@incycle
	% 						\ifnum\CF@cnt@cycle=\CF@cycle@num\relax
	% 							\expandafter\expandafter\expandafter\@firstoftwo
	% 						\else
	% 							\ifnum\CF@cnt@cycle=\@ne
	% 								\let\CF@cycle@firsttikz\CF@current@tikz
	% 								\unless\ifx\CF@start@offset\@empty\let\CF@cycle@joinlast\z@\fi
	% 							\fi
	% 							\expandafter\expandafter\expandafter\@secondoftwo
	% 						\fi
	% 					\else
	% 						\expandafter\@secondoftwo
	% 					\fi
	% 						{\let\CF@next@action\endgroup
	% 						\CF@draw@bond\CF@bond@type{\CF@bond@outnode}{\CF@hook@cycle}\CF@previous@atomgroup\CF@hook@atomgroup
	% 						}%
	% 						{\node[at=(\CF@bond@outnode\ifCF@incycle\else\ifCF@macrofixedbondlength.\CF@current@angle\fi\fi),shift=(\ifcase\CF@split@state\or180-\or-\fi\CF@current@angle:\CF@current@length*\CF@atom@sep)](CF@node){};
	% 						\let\CF@previous@angle\CF@current@angle
	% 						\let\CF@last@action\tw@
	% 						}%
	% 				\fi
	% 				\ifcat\relax\detokenize\expandafter{\romannumeral-`\.\expandafter\noexpand\CF@remain@molecule}\relax
	% 				% s'il ne reste plus rien apr\`es la liaison (sans tenir compte de l'espace devant)-> ins\`ere un groupe vide
	% 					\CF@insert@emptygroup\CF@remain@molecule
	% 				\fi
	% 				}%
	% 				{\edef\CF@bond@outnode{\CF@bond@outnode}% \'evalue le l'atome de d\'epart de liaison
	% 				\CF@ifx(\CF@toks@a% une parenth\`ese pour commencer ?
	% 					{\ifnum\CF@last@action=\tw@% il y avait une liaison juste avant ?
	% 						\CF@insert@emptygroup\CF@remain@molecule
	% 					\else
	% 						\expandafter\CF@grab@submol\expandafter{\CF@remain@molecule}%
	% 						\begingroup
	% 							\ifCF@incycle\let\CF@last@action\thr@@\fi% on \'etait dans un cycle
	% 							\CF@incyclefalse
	% 							\aftergroup\CF@chemfig@vi
	% 							\def\CF@next@action{\expandafter\CF@chemfig@v\expandafter{\CF@sub@mol}}%
	% 					\fi
	% 					}%
	% 					{\ifx\CF@remain@molecule\@empty
	% 						\let\CF@next@action\endgroup
	% 					\else% ce qui reste apr\`es le noeud courant n'est pas vide, ne commence pas par "-=~", ni par une parenth\`ese
	% 						\CF@ifx*\CF@toks@a% un cycle ?
	% 						{\ifnum\CF@last@action=\tw@
	% 							\CF@insert@emptygroup\CF@remain@molecule% ins\`ere un groupe vide
	% 						\else
	% 							\ifCF@incycle\let\CF@last@action\thr@@\fi% on \'etait dans un cycle
	% 							\ifnum\CF@last@action=\thr@@\let\CF@lastcycle@num\CF@cycle@num\fi
	% 							\CF@expafterarg@ntimes2\CF@if@firsttokmatch{\expandafter\@gobble\CF@remain@molecule}*% un 2\`e "*" ?
	% 								{\CF@expafterarg@ntimes2{\def\CF@remain@molecule}{\expandafter\@gobble\CF@remain@molecule}% enl\`eve la 1er \'etoile
	% 								\CF@expafterarg@ntimes2\CF@if@firsttokmatch{\expandafter\@gobble\CF@remain@molecule}[% un crochet ensuite ?
	% 									{\expandafter\CF@cycle@parsepreamblewithoptarg\CF@remain@molecule\@nil% \begingroup inclus
	% 									}%
	% 									{\def\CF@cyclearc@startangle{0}\def\CF@cyclearc@endangle{360}%
	% 									\let\CF@cyclearc@directtikz\@empty
	% 									\expandafter\CF@cycle@parsepreamble\CF@remain@molecule\@nil% \begingroup inclus
	% 									}%
	% 								\CF@cyclearctrue
	% 								}%
	% 								{\expandafter\CF@cycle@parsepreamble\CF@remain@molecule\@nil% \begingroup inclus
	% 								\CF@cyclearcfalse
	% 								}%
	% 							\CF@cnt@cycle\z@
	% 							\edef\CF@hook@cycle{\CF@bond@outnode}%
	% 							\let\CF@hook@atomgroup\CF@previous@atomgroup
	% 							\ifx\CF@hook@atomgroup\CF@empty@node
	% 								\let\CF@cycle@joinlast\@ne% joindre le dernier
	% 							\else
	% 								\let\CF@cycle@joinlast\z@
	% 							\fi
	% 							\CF@incycletrue
	% 							\ifnum\CF@last@action=\thr@@
	% 								\pgfmathparse{360/\CF@lastcycle@num-180}% c'est un cycle dans un cycle
	% 							\else
	% 								\pgfmathparse{-180/\CF@cycle@num-90+\CF@cycle@anglecorrection}%
	% 							\fi
	% 							\let\CF@initcycle@angle\pgfmathresult
	% 							\aftergroup\CF@chemfig@vi
	% 							\def\CF@next@action{\expandafter\CF@chemfig@v\expandafter{\CF@sub@mol}}%
	% 						\fi
	% 						}%
	% 						{\errmessage{Package \CF@package@name\space Error: something went wrong here: \detokenize\expandafter{\CF@remain@molecule}^^JIf you think it's a bug, please, send a Minimal Example to the author.}}%
	% 					\fi}%
	% 				}%
	% 		\else
	% 			\CF@expand@second{\CF@expand@second{\CF@expand@second\CF@draw@atomgroup\CF@current@angle}\CF@current@toatom}\CF@current@atomgroup
	% 		\fi
	% 	\fi
	% 	\CF@next@action
	% }

	% % \edef\CF@tmp@str{\noexpand\begin{tikzpicture}[remember picture,every node/.style={anchor=base,inner sep=1pt,outer sep=\z@,minimum size=\z@\ifx\@empty#2\@empty\else,#2\fi},baseline\ifx\@empty#1\@empty\else,#1\fi]}%

	% }{}
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
\ifbool{bmc@notes}{
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
% we don't want paragraphs to indent, but we do want \indent to work
\newlength\tindent
\setlength{\tindent}{\parindent}
\setlength{\parindent}{0pt}
\renewcommand{\indent}{\hspace*{\tindent}}

% set caption style
\setkomafont{caption}{\itshape\color{text}}
\setkomafont{captionlabel}{\fontfamily{\headingsFont}\fontseries{tx}\selectfont\upshape\color{text}}
\captionsetup{justification=raggedright,singlelinecheck=true}

% ensure tables have correct text colour
\AtBeginEnvironment{tabular}{\color{text}}

% Code blocks
\ifbool{bmc@code}{
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
		xleftmargin=3.5em,
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
			overlay={\fill[page!90!text] (frame.south west) rectangle ([xshift=2.8em]frame.north west);},
			colback=page!95!text,
			colframe=page!95!text, % make frame colour same as background
			breakable,% Allow page breaks
			arc=0pt,outer arc=0pt,sharp corners, % sharp corners
			boxsep=0pt,left=0pt,right=0pt,top=0pt,bottom=0pt % no margin/paddding
		]
	}
	\AfterEndEnvironment{minted}{\end{tcolorbox}}

	\ifbool{bmc@dark}{
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

	\renewcommand\theFancyVerbLine{\color{text!60!page}\arabic{FancyVerbLine}} % minted line numbering

	\let\mintinlineold\mintinline
	\setmintedinline{breaklines,bgcolor={}}
	% FIXME: issue with line breaking (it doesn't)
	\DeclareTotalTCBox{\mintinline}{v v}{
		nobeforeafter,tcbox raise base,
		enhanced, frame hidden, arc=3pt,
		boxsep=0pt,left=3pt,right=3pt,top=2pt,bottom=2pt, % minimal margin/paddding
		colback=page!94!text,
		outer arc=0pt,
		leftrule=0pt,rightrule=0pt,toprule=0pt,bottomrule=0pt
	}{\mintinlineold{#1}{#2}}

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

\RequirePackage{bmc-color}

% and fill the row(s) after \toprule
\newbool{tabularTitleRow}
\boolfalse{tabularTitleRow}
\colorlet{tableheadcolor}{text!5!page} % Table header colour = 5% gray

% region headerfill

% from https://tex.stackexchange.com/a/494959/167605

\renewcommand{\toprule}{%
    \showrowcolors
    \arrayrulecolor{text}\specialrule{\heavyrulewidth}{\abovetopsep}{0pt}%
    \arrayrulecolor{tableheadcolor}\specialrule{\belowrulesep}{0pt}{0pt}%
    \arrayrulecolor{text}%
    \rowcolor{tableheadcolor}%
}

\apptocmd\midrule{\hiderowcolors}{}{\FAILED}

\let\@BTrule@ORI=\@BTrule
\let\my@BTrule=\@BTrule

% Modified version of \@BTrule that doesn't do \vskip\@aboverulesep, for use
% when the corresponding vertical space should be coloured.
\patchcmd{\my@BTrule}{%
    \ifnum\@lastruleclass=\z@\vskip\@aboverulesep\else
  }{%
    \ifnum\@lastruleclass=\z@\else
  }{}{\FAILED}

\let\@arraycrORI=\@arraycr

% The “master counter” hackery is explained in the TeXbook appendix D (Dirty
% Tricks), pp. 385-386. It is also mentioned in the array.sty implementation
% notes concerning \@arraycr.
\renewcommand*{\@arraycr}{%
  % Increase the master counter. This is needed to prevent TeX from
  % prematurely finishing the alignment entry in case \\ was followed by '&'
  % (when the \futurelet from \@ifnextchar causes TeX to read a '&', this
  % finishes the entry unless the master counter has a different value than it
  % had when the entry was started).
  \relax\iffalse{\fi\ifnum 0=`}\fi
  % Each of the two branches takes care of decreasing the master counter.
  \@ifnextchar\midrule
    {\@firstoftwo{\my@endtablehead}}% gobble the following \midrule
    \my@closebrace@and@arraycrORI
}

\newcommand*{\my@endtablehead}{%
 \ifnum 0=`{}\fi % the second brace decreases the master counter
 \@arraycrORI[\aboverulesep]% this colours the additional space with the
                            % current row color
 \noalign{\global\let\@BTrule\my@BTrule}% temporarily modify \@BTrule
 \midrule
 \noalign{\global\let\@BTrule\@BTrule@ORI}% restore it
}

\newcommand*{\my@closebrace@and@arraycrORI}{%
  \ifnum 0=`{}\fi % the second brace decreases the master counter
  \@arraycrORI
}

\rowcolors{1}{tableheadcolor}{tableheadcolor}
% endregion headerfill


\RequirePackage{bmc-fonts}
\ifdefempty{\bmc@math}{}{
	\RequirePackage{bmc-maths}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%		Titling
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{bmc-sectioning}

% Cover Page
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% \newcommand\subtitle[1]{\renewcommand\@foo{#1}}
% \newcommand\@subtitle{\@latex@error{No \noexpand\subtitle given}\@ehc}

\renewcommand{\maketitle}{
	\thispdfpagelabel{Cover}

	\ifbool{bmc@solid}{
		\pagecolor{primary}
	}{
		\pagecolor{page}
	}

	\begin{titlepage}
		\newgeometry{left=4cm,right=2.7cm, top=1.5cm}

		\ifbool{bmc@solid}{
			\ifbool{bmc@dark}{
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
				% \ifbool{bmc@solid}{
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
			\ifbool{bmc@solid}{
				\ifbool{bmc@dark}{
					\color{contrastColour}
				}{
					\color{alternativePrimary}
				}
			}{
				\color{primaryVariant}
			}
			\rule{\paperwidth-2.64cm}{2pt}
		}

		\hspace*{-0.25mm}\fontseries{m}\selectfont\huge\@subtitle

		\vspace{2.5cm}

		\fontseries{l}\selectfont
		\@author

		\vfill

		% @\subject

		\vspace{1.5cm}

		% \@publishers

		\fontseries{m}\selectfont\Large
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




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%																			   %
%																			   %
%								zCv										   %
%																			   %
%																			   %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% This work is based on the following works:
%
% * https://github.com/HarveySheppard/yLaTeX
% * https://github.com/spagnuolocarmine/TwentySecondsCurriculumVitae-LaTex
%-------------------------------------------------------------------------------

\NeedsTeXFormat{LaTeX2e}


\ProvidesClass{zCv}[A modern and fancy CV template]
\LoadClass{article}
\NeedsTeXFormat{LaTeX2e}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%		Basic settings, options processing
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage[no-math, quiet]{fontspec}

\RequirePackage{polyglossia}
\setdefaultlanguage{english}




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%		Needed packages
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{graphicx}
\RequirePackage{calc}
\RequirePackage[usenames,dvipsnames,svgnames,table]{xcolor}
\RequirePackage{appendix}
\RequirePackage{ragged2e}
\RequirePackage{varwidth}
\RequirePackage{fancyhdr}
\RequirePackage{titletoc}
%% CV
\RequirePackage[sfdefault]{ClearSans}
\RequirePackage{pstricks}
\RequirePackage{fontawesome}
\RequirePackage[absolute,overlay]{textpos}
\RequirePackage{ifmtarg}
\RequirePackage{ifthen}
\RequirePackage{pgffor}
\RequirePackage{marvosym}
\RequirePackage{parskip}

\RequirePackage{enumitem}
\setlist[itemize]{leftmargin=*}


\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax


\def\arrow#1{\pspicture[shift=2pt](#1,0)\psline{->}(#1,0)\endpspicture}

%----------------------------------------------------------------------------------------
%	 COLOURS
%----------------------------------------------------------------------------------------

\definecolor{mainColor}{RGB}{211, 47, 47}
\colorlet{lightMainColor}{mainColor!80}
\newcommand{\lightMainColor}{\colorlet{lightMainColor}{mainColor!80}\color{lightMainColor}}
\colorlet{darkMainColor}{mainColor!60!Black}
\newcommand{\darkMainColor}{\colorlet{darkMainColor}{mainColor!70!Black}\color{darkMainColor}}
{\darkMainColor}
\newcommand{\updateDarkMainColor}{\colorlet{darkMainColor}{mainColor!70!Black}}
\definecolor{secondColor}{RGB}{255, 193, 7}


\definecolor{white}{RGB}{255,255,255}
\definecolor{gray}{HTML}{4D4D4D}
\definecolor{sidecolor}{HTML}{E7E7E7}
\definecolor{mainblue}{HTML}{0E5484}
\definecolor{maingray}{HTML}{B9B9B9}

\definecolor{pblue}{HTML}{0395DE}

\definecolor{darkgray}{HTML}{333333}
\definecolor{gray}{HTML}{4D4D4D}
\definecolor{lightgray}{HTML}{999999}
\definecolor{green}{HTML}{C2E15F}
\definecolor{orange}{HTML}{FDA333}
\definecolor{purple}{HTML}{D3A4F9}
\definecolor{red}{HTML}{FB4485}
\definecolor{blue}{HTML}{6CE0F1}
\definecolor{pblue}{HTML}{0395DE}
\definecolor{materialpurple}{HTML}{9C27B0}
\definecolor{materialindigo}{HTML}{3F51B5}
\definecolor{materialblue}{HTML}{2196F3}
\definecolor{materialcyan}{HTML}{00BCD4}
\definecolor{materialteal}{HTML}{009688}
\definecolor{materialgreen}{HTML}{4CAF50}
\definecolor{materiallime}{HTML}{CDDC39}
\definecolor{materialamber}{HTML}{FFC107}
\definecolor{materialbrown}{HTML}{795548}
\definecolor{materialred}{HTML}{FF4436}
\definecolor{materialorange}{HTML}{FF5722}
\definecolor{linkedin}{HTML}{0085AE}
\definecolor{test}{HTML}{0077be}
\definecolor{yt}{HTML}{c71610}

\ifdefined\@cv@print
	\colorlet{green}{gray}
	\colorlet{orange}{gray}
	\colorlet{purple}{gray}
	\colorlet{red}{gray}
	\colorlet{blue}{gray}
	\colorlet{fillheader}{white}
	\colorlet{header}{gray}
\else
	\colorlet{fillheader}{white}
	\colorlet{header}{gray}
\fi
\colorlet{textcolor}{gray}
\colorlet{headercolor}{gray}

%----------------------------------------------------------------------------------------
%	 MISC CONFIGURATIONS
%----------------------------------------------------------------------------------------

% \renewcommand{\bfseries}{\color{black}} % Make \textbf produce coloured text instead

\pagestyle{empty} % Disable headers and footers

\setlength{\parindent}{0pt} % Disable paragraph indentation

% --------------------------------------------------------------------------------------
% 	FONTS
%-------------------------------------------------------------------------------------
\defaultfontfeatures{Ligatures=TeX}

\setsansfont{Fira Sans Light}[
	Numbers=OldStyle,
	BoldFont=Fira Sans Medium,
	ItalicFont=Fira Sans Light Italic,
	BoldItalicFont=Fira Sans Medium Italic
]

\newfontfamily\headingfont{Fira Sans Book}
\newfontfamily{\titleFont}{Canter Light}
\newfontfamily{\heavyFont}{Fira Sans Heavy}
\newfontfamily{\lightBoldFont}{Fira Sans}
%----------------------------------------------------------------------------------------
%	 SIDEBAR DEFINITIONS
%----------------------------------------------------------------------------------------

\setlength{\TPHorizModule}{1cm} % Left margin
\setlength{\TPVertModule}{1cm} % Top margin

\newlength\imagewidth
\newlength\imagescale
\pgfmathsetlength{\imagewidth}{5cm}
\pgfmathsetlength{\imagescale}{\imagewidth/600}

\newcommand{\profilesection}[2]{\vspace{8pt}{\color{black!80} \huge #1 \rule[0.15\baselineskip]{#2}{1pt}}}

% Define custom commands for CV info
\newcommand{\cvdate}[1]{\renewcommand{\cvdate}{#1}}
\newcommand{\cvlinkedin}[1]{\renewcommand{\cvlinkedin}{#1}}
\newcommand{\cvgithub}[1]{\renewcommand{\cvgithub}{#1}}
\newcommand{\cvgitlab}[1]{\renewcommand{\cvgitlab}{#1}}
\newcommand{\cvmail}[1]{\renewcommand{\cvmail}{#1}}
\newcommand{\cvnumberphone}[1]{\renewcommand{\cvnumberphone}{#1}}
\newcommand{\cvaddress}[1]{\renewcommand{\cvaddress}{#1}}
\newcommand{\cvtwitter}[1]{\renewcommand{\cvtwitter}{#1}}
\newcommand{\cvsite}[1]{\renewcommand{\cvsite}{#1}}
\newcommand{\aboutme}[1]{\renewcommand{\aboutme}{#1}}
\newcommand{\profilepic}[1]{\renewcommand{\profilepic}{#1}}
\newcommand{\cvname}[1]{\renewcommand{\cvname}{#1}}
\newcommand{\cvjobtitle}[1]{\renewcommand{\cvjobtitle}{#1}}

% Command for printing the contact information icons
\newcommand*\icon[1]{\tikz[baseline=(char.base)]{\node[shape=circle,draw,inner sep=1pt, fill=mainblue,mainblue,text=white] (char) {#1};}}

% Command for printing skill progress bars
\newcommand\programming[1]{
	\renewcommand{\programming}{
		\begin{tikzpicture}
			\newcommand\theLengthOfTheList{-1}
			\foreach [count=\i] \x/\y in {#1}{
					\draw[fill=maingray,maingray] (0,\i) rectangle (6,\i+0.4);
					\draw[fill=white,mainColor](0,\i) rectangle (\y,\i+0.4);
					\node [above right] at (0,\i+0.35) {\x};
					\global\let\theLengthOfTheList=\i
				}
			\node [above right] at (0, \theLengthOfTheList + 1) {$0 \:  \: \arrow{5.2} \: 10 \: $};
		\end{tikzpicture}
	}
}
\newcommand{\setPlFont}{\fontspec{Vollkorn}\color{Black}}
%\newcommand\projects[1]{ 
%	\renewcommand{\projects}{
%		{#1}
%	}
%}

%----------------------------------------------------------------------------------------
%  SIDEBAR LAYOUT
%----------------------------------------------------------------------------------------

\newcommand{\makeprofile}{
	\begin{tikzpicture}[remember picture,overlay]
		\node [rectangle, fill=sidecolor, anchor=north, minimum width=9cm, minimum height=\paperheight+1cm] (box) at (-5cm,0.5cm){};
	\end{tikzpicture}

	%------------------------------------------------

	\begin{textblock}{6}(0.5, 0.2)

		%------------------------------------------------

		\vspace{4mm}
		{\Huge\color{lightMainColor}\cvname}

		\vspace{2mm}

		%------------------------------------------------

		{\Large\color{black!80}\cvjobtitle}

		%------------------------------------------------

		\vspace{4mm}
		\renewcommand{\arraystretch}{2}
		\begin{tabular}{p{1cm} @{\hskip 0.5cm}p{5cm}}
			\ifthenelse{\equal{\cvnumberphone}{}}{}{
				{$
							\begin{array}{l}
								\hspace{4mm} \Huge \textnormal{\faMobile}
							\end{array}
						$}
			   & \cvnumberphone\\}

			\ifthenelse{\equal{\cvsite}{}}{}{
				{$
							\begin{array}{l}
								\hspace{2.8mm} \huge \textnormal{\textcolor{test}{\faGlobe}}
							\end{array}
						$}
			   & \href{http://\cvsite}{\cvsite} \\}
			\ifthenelse{\equal{\cvmail}{}}{}{
				{$
							\begin{array}{l}
								\hspace{2.5mm} \huge \textnormal{\textcolor{yt}{\faEnvelopeO}}
							\end{array}
						$}
			   & \href{mailto:\cvmail @gmail.com}{\cvmail} \\}

			\ifthenelse{\equal{\cvlinkedin}{}}{}{
				{$
							\begin{array}{l}
								\hspace{3mm} \huge \textnormal{\textcolor{linkedin}{\faLinkedin}}
							\end{array}
			$} & \href{https://www.linkedin.com/in/\cvlinkedin}{\cvlinkedin}         \\
			}
			\ifthenelse{\equal{\cvgithub}{}}{}{
				{$
							\begin{array}{l}
								\hspace{3mm} \huge \textnormal{\faGithub}
							\end{array}
			$} & \href{https://www.github.com/\cvgithub}{\cvgithub}                  \\
			}
			\ifthenelse{\equal{\cvaddress}{}}{}{
				{$
							\begin{array}{l}
								\hspace{2.5mm} \huge \textnormal{\textcolor{yt}{\faHome}}
							\end{array}
						$}
			   & {\cvaddress} \\}

			\ifthenelse{\equal{\cvtwitter}{}}{}{
				{$
							\begin{array}{l}
								\hspace{2.5mm} \huge \textnormal{\textcolor{yt}{\faTwitter}}
							\end{array}
						$}
			   & {\cvtwitter} \\}
		\end{tabular}

		%------------------------------------------------
		\vspace{4mm}
		\profilesection{Skills}{4cm}

		{\large \textbf{Overview}}

		\skills

		%------------------------------------------------

		\vspace{3mm}

		{\large \textbf{Programming}}

		\programming

		\vspace{4mm}
		%\profilesection{Projects}{3cm} 

		%   \projects

	\end{textblock}
}


%----------------------------------------------------------------------------------------
%	 COLOURED SECTION TITLE BOX
%----------------------------------------------------------------------------------------

\newcommand*\round[2]{%
	\tikz[baseline=(char.base)]\node[anchor=north west, draw,rectangle, rounded corners, inner sep=1.6pt, minimum size=5.5mm, text height=3.6mm, fill=#2,#2,text=white](char){#1};%
}


%----------------------------------------------------------------------------------------
%	 LONG LIST ENVIRONMENT
%----------------------------------------------------------------------------------------

\setlength{\tabcolsep}{0pt}

% New environment for the long list
\newenvironment{twenty}{%
	\begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}ll}
		}{%
	\end{tabular*}
}


\newcommand{\twentyitem}[6]{%
	#1&\parbox[t]{0.83\textwidth}{%
		\textbf{#3}% 
		\hfill%
		{\footnotesize#4}%
	}\\%
	#2&\parbox[t]{0.83\textwidth}{%
		\ifblank{#5}{}{#5 \\}
		#6%
	}\\
}

%----------------------------------------------------------------------------------------
%	 SMALL LIST ENVIRONMENT
%----------------------------------------------------------------------------------------

\setlength{\tabcolsep}{0pt}

% New environment for the small list
\newenvironment{twentyshort}{%
	\begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}ll}
		}{%
	\end{tabular*}
}

\newcommand{\twentyitemshort}[2]{%
	#1&\parbox[t]{0.83\textwidth}{%
		#2%
	}\\
}

%----------------------------------------------------------------------------------------
%	 MARGINS AND LINKS
%----------------------------------------------------------------------------------------

\RequirePackage[a4paper,
	ignoreheadfoot,
	left=3.5cm,
	right=3.5cm,
	top=3.5cm,
	bottom=3.5cm,
	nohead,
	marginparwidth=0cm,
	marginparsep=0mm]{geometry}

\usepackage{smartdiagram}
\smartdiagramset{
	bubble center node font = \footnotesize,
	bubble node font = \footnotesize,
	% specifies the minimum size of the bubble center node
	bubble center node size = 0.55cm,
	%  specifies the minimum size of the bubbles
	bubble node size = 0.65cm,
	% specifies which is the distance among the bubble center node and the other bubbles
	distance center/other bubbles = 0.65cm,
	% sets the distance from the text to the border of the bubble center node
	distance text center bubble = 0.5cm,
	% set center bubble color
	bubble center node color = pblue,
	% define the list of colors usable in the diagram
	set color list = {lightgray, materialcyan, orange, green, materialorange, materialteal, materialamber, materialindigo, materialgreen, materiallime},
	% sets the opacity at which the bubbles are shown
	bubble fill opacity = 0.6,
	% sets the opacity at which the bubble text is shown
	bubble text opacity = 1,
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%		End of CV configs
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%		Layout
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{changepage}
\setlength{\parindent}{0pt}
\setlength{\parskip}{\baselineskip}
\setlength{\marginparpush}{\baselineskip}

% Commands for changing the page layout mid-document
\newcommand{\symmetricalPage}{
	\fancyhfoffset[OR, EL]{0mm}
	\newgeometry{
		top=20mm,
		bottom=20mm,
		inner=20mm,
		outer=20mm,
		includehead,
		ignorefoot,
		nomarginpar,
		headsep=10mm,
		footskip=10mm,
	}
}
\newcommand{\asymmetricalPage}{
	\restoregeometry
	\fancyhfoffset[OR, EL]{\marginparsep + \marginparwidth}
}

\setlength{\columnsep}{\marginparsep}

% Saving some length as commands
\newlength{\wholeMargin}
\setlength{\wholeMargin}{\marginparwidth}
\addtolength{\wholeMargin}{\marginparsep}

\newlength{\wholeWidth}
\setlength{\wholeWidth}{\textwidth}
\addtolength{\wholeWidth}{\wholeMargin}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%		Font
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% For source code
\setmonofont{Source Code Pro Light}[
	BoldFont=Source Code Pro,
]
% Normal font
\setsansfont{Fira Sans Light}[
	Numbers=OldStyle,
	BoldFont=Fira Sans Medium,
	ItalicFont=Fira Sans Light Italic,
	BoldItalicFont=Fira Sans Medium Italic
]
% Normal font
\setmainfont{Fira Sans Light}[
	BoldFont=Fira Sans Medium,
	ItalicFont=Fira Sans Light Italic,
	BoldItalicFont=Fira Sans Medium Italic
]
\newfontfamily{\normalFont}{Fira Sans Light}
\newfontfamily{\chapterNumberFont}{Butler Bold}%{London}%{DiamondsThinItalic}%Abril Fatface}
\newfontfamily{\chapterFont}{Butler}
\newfontfamily{\serifFont}{Vollkorn}
\newcommand{\sectionNumbers}{\subsectionNumbers\bfseries\selectfont}
\newfontfamily{\subsectionNumbers}{Oswald RegularItalic}
\newfontfamily{\abril}{Abril Fatface}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%		Colors
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\definecolor{mainColor}{RGB}{211, 47, 47}
\colorlet{lightMainColor}{mainColor!80}
\colorlet{darkMainColor}{mainColor!60!Black}
% {\darkMainColor}
\definecolor{secondColor}{RGB}{255, 193, 7}

\definecolor{sectionNumbersColor}{gray}{.8}
\colorlet{subsectionNumbersColor}{sectionNumbersColor}

\definecolor{lightGrey}{gray}{0.94}
\definecolor{middleGrey}{gray}{.75}
\definecolor{darkGrey}{gray}{.55}
\colorlet{bigVerticalLineGrey}{lightGrey}

\colorlet{light-gray}{lightGrey} %redefines infoBulle background light-grey to match yReport lightGrey

\ProvideDocumentCommand{\inColor}{m}{\textbf{\textcolor{mainColor}{#1}}}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%		TikZ
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{tikz}
\usetikzlibrary{fit}
\usetikzlibrary{calc}
\usetikzlibrary{matrix}
\usetikzlibrary{positioning}
\usetikzlibrary{fadings}

\pgfdeclarelayer{bg}    % declare background layer
\pgfsetlayers{bg,main}	% set the order of the layers (main is the standard layer)

\newlength{\bigVerticalLineWidth}
\setlength{\bigVerticalLineWidth}{\evensidemargin + 1in + \hoffset}

\newlength{\bigVerticalLinePartOfMarginParSep}
\setlength{\bigVerticalLinePartOfMarginParSep}{\marginparsep/8}
\setlength{\bigVerticalLinePartOfMarginParSep}{5\bigVerticalLinePartOfMarginParSep}

\addtolength{\bigVerticalLineWidth}{-\bigVerticalLinePartOfMarginParSep}

\newcommand{\bigVerticalLine}[1]{
	\strictpagechecktrue
	\checkoddpage
	\ifoddpage%
		\AddToShipoutPictureBG*{
			\begin{tikzpicture}[remember picture, overlay]
				\fill[fill=#1] (current page.south east) rectangle ++(-\bigVerticalLineWidth, \paperheight);
			\end{tikzpicture}
		}
	\else%

		\AddToShipoutPictureBG*{
			\begin{tikzpicture}[remember picture, overlay]
				\fill[fill=#1] (current page.south west) rectangle ++(\bigVerticalLineWidth, \paperheight);
			\end{tikzpicture}
		}
	\fi%
}

\DeclareDocumentCommand{\hexagon}{O{Black} m m O{}}{
	\fill [#1, #4] ($ (#2) + (0:#3) $) -- ($ (#2) + (60:#3) $) -- ($ (#2) + (120:#3) $) -- ($ (#2) + (180:#3) $) -- ($ (#2) + (240:#3) $) -- ($ (#2) + (300:#3) $) -- cycle;
}

\DeclareDocumentCommand{\hexagonOutline}{O{Black} m m O{ultra thick}}{
	\path [draw, #1, #4] ($ (#2) + (0:#3) $) -- ($ (#2) + (60:#3) $) -- ($ (#2) + (120:#3) $) -- ($ (#2) + (180:#3) $) -- ($ (#2) + (240:#3) $) -- ($ (#2) + (300:#3) $) -- cycle;
}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%		Utilities
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\DeclareDocumentCommand{\isOddPage}{mm}{%
	\strictpagechecktrue%
	\checkoddpage%
	\ifoddpage%
		#1%
	\else%
		#2%
	\fi%
}
\DeclareDocumentCommand{\alignLeftOrRight}{O{} O{}}{%
	\strictpagechecktrue%
	\checkoddpage%
	\ifoddpage%
		\begin{FlushRight}%
		#1%
	\else%
		\begin{FlushLeft}%
			#2%
			\fi%
			}
			\DeclareDocumentCommand{\alignLeftOrRightEnd}{O{} O{}}{%
			\strictpagechecktrue%
			\checkoddpage%
			\ifoddpage%
			\end{FlushRight}%
			#1%
			\else%
		\end{FlushLeft}%
		#2%
	\fi%
}
\DeclareDocumentCommand{\alignLeftOrRightStandalone}{}{
	\strictpagechecktrue%
	\checkoddpage%
	\ifoddpage%
		\FlushRight%
	\else%
		\FlushLeft%
	\fi%
}
\DeclareDocumentCommand{\alignLeftOrRightStandaloneInversed}{}{
	\strictpagechecktrue%
	\checkoddpage%
	\ifoddpage%
		\FlushLeft%
	\else%
		\FlushRight%
	\fi%
}
\newcommand{\noHyphen}{\hyphenpenalty10000\exhyphenpenalty10000\righthyphenmin62\lefthyphenmin62}

\newcommand{\emaillink}[1]{%
	{\hypersetup{urlcolor=black}\href{mailto:#1}{#1}}%
}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%		Titling
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{titlesec}
\newcommand{\chapterNumberRadius}{2.1cm}
\titleformat{\chapter}[block]
{} % format
{ % label
	{\darkMainColor}
	\backgroundThisPageColor%
	\begin{tikzpicture}[remember picture, overlay]
		\tikzfading[name=monfading,left color=transparent!100,right color=transparent!0]
		\isOddPage{%
			\coordinate[xshift=-\bigVerticalLineWidth/2, yshift=-5.8cm] (numberCenter) at (current page.north east);
		}{%
			\coordinate[xshift=\bigVerticalLineWidth/2, yshift=-5.8cm] (numberCenter) at (current page.north west);
		}
		\hexagon[darkMainColor]{numberCenter}{\chapterNumberRadius}[path fading=south, fading angle=-60]
		\node[yshift=2mm] at (numberCenter) (chapterNumber) {
			\chapterNumberFont%
			\fontsize{\chapterNumberRadius}{\chapterNumberRadius}%
			\selectfont%
			\thechapter%
		};
		\node [below=1mm of chapterNumber, text=Black!80] {
			\addfontfeatures{LetterSpace=20.0}%
			\fontsize{1.2em}{1.4em}\selectfont%
			\chaptertitlename%
		};
	\end{tikzpicture}%
}
{0pt} % sep
{ % code before
	\isOddPage{
		\begin{FlushRight}
		\vspace*{-1.5mm}
	}{
		\begin{FlushLeft}
		\vspace*{-10mm}
	}
	\fontsize{1.8cm}{2.16cm}\chapterFont\selectfont%
}[ % code after
	\alignLeftOrRightEnd
]

\titleformat{name=\chapter, numberless}[block]
{} % format
{\backgroundThisPageColor} % label
{0pt} % sep
{ % code before
	\alignLeftOrRight
	\fontsize{1.8cm}{2.16cm}\chapterFont\selectfont
}[ % code after
	\alignLeftOrRightEnd
]

\renewcommand{\thesection}{\arabic{section}}

\titleformat{\section}{\huge}{%
	\hspace*{-3mm}\fontsize{3ex}{3.6ex}\sectionNumbers\selectfont\color{sectionNumbersColor}%
	\raisebox{-1mm}{\thesection}%
}{-3mm}{\fontspec{Fira Sans Medium}\selectfont}{}


\titleformat{\subsection}{\LARGE}{%
	\hspace*{-3mm}\fontsize{3ex}{3.6ex}\subsectionNumbers\selectfont\color{subsectionNumbersColor}%
	\raisebox{-1mm}{\thesubsection}%
}{-3mm}{}{}
\titleformat*{\subsubsection}{\Large}

%Titling spacing: left before after [right]
\titlespacing*{\chapter}{0mm}{3mm}{1cm}
%\titlespacing*{name=\chapter,numberless}{0pt}{10pt}{0pt} %starred version of chapter default: 0pt, 50pt, 40pt
\titlespacing*{\section}{0mm}{3mm}{0mm}
\titlespacing*{name=\section, numberless}{0mm}{0.5mm}{0mm}
\titlespacing*{\subsection}{0mm}{2mm}{0mm}
\titlespacing*{\subsubsection}{0mm}{2mm}{0mm}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%		Date typesetting
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{datetime}
\newcommand{\monthThreeLetterName}{%
	\ifcase\the\month
	\or Jan% 1
	\or Feb% 2
	\or Mar% 3
	\or Apr% 4
	\or May% 5
	\or Jun% 6
	\or Jul% 7
	\or Aug% 8
	\or Sep% 9
	\or Oct% 10
	\or Nov% 11
	\or Dec% 12
	\fi
}
\newdateformat{dayNumberOnTwoDigit}{\twodigit{\THEDAY}}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%		Title page
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\@subtitle}{}
\newcommand{\subtitle}[1]{\renewcommand{\@subtitle}{#1}}
\newcommand{\bigColoredTitle}{{\color{mainColor}\fontsize{1.5cm}{1.3cm}\selectfont\chapterFont\runtitle}}

\newlength{\titlepageHeaderHeight}
\setlength{\titlepageHeaderHeight}{11cm}
\newcommand\getwidthofnode[2]{%
	\pgfextractx{#1}{\pgfpointanchor{#2}{east}}%
	\pgfextractx{\pgf@xa}{\pgfpointanchor{#2}{west}}% \pgf@xa is a length defined by PGF for temporary storage. No need to create a new temporary length.
	\addtolength{#1}{-\pgf@xa}%
}
\newcommand{\dateRadius}{1.7}
\newlength{\titlepageTitleLength}
\DeclareDocumentCommand{\titleTwo}{o o}{
	\updateDarkMainColor
	\thispagestyle{empty}
	\symmetricalPage
	\null
	\tikzset{
		fitting node/.style={
				inner sep=0pt,
				fill=none,
				draw=none,
				reset transform,
				fit={(\pgf@pathminx,\pgf@pathminy) (\pgf@pathmaxx,\pgf@pathmaxy)}
			},
		reset transform/.code={\pgftransformreset}
	}
	\begin{tikzpicture}[remember picture, overlay]
		% some coordinates
		\coordinate[yshift=-\titlepageHeaderHeight](rectangleEnd) at (current page.north east);
		\coordinate[xshift=-4cm](dateCenter) at (rectangleEnd);

		% draw an image if one was provided
		\IfValueT{#1}{\draw (current page.center)[yshift=-\titlepageHeaderHeight/2] node[align=center, inner sep=0mm, anchor=center] {{\includegraphics[height=\paperheight-\titlepageHeaderHeight]{#1}}};}

		% red rectangle
		\fill[mainColor] (current page.north west) rectangle (rectangleEnd) node[fitting node] (headerRectangle) {};

		% title page text (title rule and subtitle)
		% title
		\draw (\leftmargin-9mm, -3cm) node[align=left, inner sep=0mm, anchor=south west, font=\fontsize{1.4cm}{1.2cm}\selectfont\chapterFont] (title) {
			\hspace*{-.8mm}\begin{varwidth}{\textwidth}%
				\FlushLeft%
				\noHyphen\IfValueT{#2}{#2}\IfNoValueT{#2}{\runtitle}%
			\end{varwidth}%
		};
		% rule
		\getwidthofnode{\titlepageTitleLength}{title}
		\node[inner xsep=0mm, text width=\titlepageTitleLength+2mm, anchor=north west, yshift=-2mm, xshift=-1mm] (rule) at (title.south west) {{\color{White}\rule{\linewidth}{.6mm}}};
		% author
		\node[inner xsep=0mm, text width=\linewidth, anchor=north west, yshift=-2mm] (subtitle) at (rule.south west) {
			{\fontsize{.6cm}{.72cm}\selectfont\color{White}
					\@subtitle}% \runauthor
		};

		% Date
		\hexagon[mainColor]{dateCenter}{\dateRadius}
		\hexagon[darkMainColor]{dateCenter}{\dateRadius}[path fading=south, fading angle=-60]
		\draw(dateCenter) node[text width=1.3cm, align=center] (day) {\fontsize{1cm}{1.2cm}\selectfont\textbf{\dayNumberOnTwoDigit\today}};
		\draw(dateCenter) node [node distance = .75cm, above of=day, text width=1.3cm, align=center](month) {\fontsize{.5cm}{1.2cm}\selectfont\textsc{\addfontfeatures{LetterSpace=10.0}\monthThreeLetterName}};
		\draw(dateCenter) node[node distance = .65cm, below of=day, text width=1.3cm, align=center] (year) {\fontsize{.4cm}{1.2cm}\selectfont{\addfontfeatures{LetterSpace=20.0}\the\year} };
		% author
		\IfNoValueT{#2}{\node[anchor=south east] at ($(current page.south east)+(-6mm, 6mm)$) {\fontspec{Canter Light}\fontsize{10mm}{6mm}\color{White}\selectfont \runauthor};}
	\end{tikzpicture}
	\null
	\vfill
	\newpage
	\asymmetricalPage
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%		Hyper-references
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{hyperref}
\hypersetup{
	pdftoolbar=false,
	pdfmenubar=true,
	pdffitwindow=false,
	pdfborder={0 0 0},
	pdfcreator=LaTeX,
	linkcolor=blue,
	linktoc=all,
	urlcolor=blue,
	citecolor=blue,
	filecolor=blue,
	colorlinks=false,           % no lik border color
	breaklinks
}
%\RequirePackage{memhfixc} %fix some problem with hyperref

% break also on hyphens inside the \url command
\def\UrlBreaks{\do\.\do\@\do\\\do\/\do\!\do\_\do\|\do\;\do\>\do\]%
	\do\)\do\,\do\?\do\'\do+\do\=\do\#\do-}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%		Penalties
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\clubpenalty=1000 %penalty for breaking after the first line of a par
\widowpenalty=1000 %penalty for breaking before the last line of a par
\brokenpenalty=700 %penalty for page breaking after hyphenated line
\tolerance=500 %Allow LaTeX to break lines too often. It prevents line for overflowing in the margins



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%		Numbers typesetting
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\DeclareDocumentCommand{\bigNumber}{o m O{\lightMainColor}}{% style line_color number
{\heavyFont\LARGE{\IfValueT{#1}{#1}#2}}\\{#3\rule{1.5cm}{2mm}}% \contourlength{.4pt}\contournumber{50}\contour{mainColor}
}

\DeclareDocumentCommand{\sideNumber}{O{mainColor} o m O{mainColor} m}{% sidenotemark_color number_style number line_color text
{%
		\hypersetup{linkcolor=mainColor}%
		\normalFont%
		\footnotemark%
	}%
\ignorespaces%
\marginElement{%
{\heavyFont\fontsize{1.2cm}{1.44cm}\selectfont\color{darkGrey}{\IfValueT{#2}{#2}#3}}\\%
{\color{#4}\rule{1.5cm}{2mm}}\\%
\sideMark[#1]{\thefootnote}
\ignorespaces%
#5%
}%
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 		Shortcuts for CV and CoverLetter structures
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\initauthor}{
	\makeatletter
	\let\runauthor\@author
	\let\runtitle\@title
	\makeatother
}

\newcommand{\initcv}{
	\clearpage
	\thispagestyle{empty}
	\newgeometry{a4paper,left=7.4cm,top=0.005mm,right=1cm,bottom=0.005mm,nohead,nofoot}

	\setlength{\TPHorizModule}{1cm} % Left margin
	\setlength{\TPVertModule}{1cm} % Top margin

	\pgfmathsetlength{\imagewidth}{5cm}
	\pgfmathsetlength{\imagescale}{\imagewidth/600}
	\setlength{\parindent}{0pt} % Disable paragraph indentation	
	\setlength{\parskip}{0pt}
	\setlength{\marginparpush}{0pt}}




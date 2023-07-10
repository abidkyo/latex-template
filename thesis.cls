%----------------------------------------

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{thesis}[Custom Document Class]

\LoadClass[a4paper,fontsize=12pt,oneside,openany,titlepage,numbers=noenddot,parskip=half,listof=totoc,bibliography=numbered]{scrbook}


%----------------------------------------
%	Page Layout
%-----------------------------------------

\RequirePackage{geometry}
\setlength{\textwidth}{14.9cm}
\setlength{\textheight}{21cm}
\setlength{\parindent}{0cm}
\setlength{\headheight}{1.5cm}
\setlength{\headsep}{1cm}
\setlength{\topmargin}{-1cm}

%-------------------------------------------
% Spacing
%-------------------------------------------

\RequirePackage{setspace}  % Spacing
\onehalfspacing

%	Space before/after section/subsection
\RedeclareSectionCommand[
	beforeskip=1\baselineskip,
	afterskip=0.5\baselineskip]{section}

\RedeclareSectionCommand[
	beforeskip=0.75\baselineskip,
	afterskip=0.5\baselineskip]{subsection}


%-------------------------------------
%	Language, Font, Encoding
%-------------------------------------

\RequirePackage[english]{babel}  % Language setting

\addtokomafont{disposition}{\rmfamily}  % Change headings font
\RequirePackage{lmodern}  % Latin modern font
\RequirePackage{newtxtext, newtxmath}  % Times font for text and math

\RequirePackage[T1]{fontenc}  % 8-bit font (e.g for Umlaut)
\RequirePackage[utf8]{inputenc}
%\RequirePackage[applemac]{inputenc}  % For Apple User (instead of utf8)

\RequirePackage{csquotes}  % Quote symbol depends on babel language setting


%------------------------------------------------
%	Header and Footer
%------------------------------------------------

% Style
\RequirePackage[headsepline]{scrlayer-scrpage}
\pagestyle{scrheadings}
\automark[chapter]{chapter}  % only chapter name in header (not section)

% Header
\clearpairofpagestyles
\ihead{\headmark} %% Chapter name in header
\ohead{\includegraphics[height=36pt]{latex-featured}}

% Header Font
\setkomafont{pageheadfoot}{\normalsize\scshape}

% Page Number in Footer
\cfoot[\pagemark]{\pagemark}

% Footnote numbering
\renewcommand{\thefootnote}{[\arabic{footnote}]}


%------------------------------------------------
%	Chapter Name
%------------------------------------------------

% 2 lines wrapping the chapter name
% Command with @ needs to start with makeatletter and end with makeatother
\makeatletter
\def\@makeschapterhead#1{  % Command for non-chapter page
  \vspace*{-110pt}  % Remove space at chapter head
  { \parindent 0pt \raggedright\vspace*{10pt}
    \parskip 10pt\rule{\textwidth}{0.5pt}\vspace*{6mm}  % Line above
    \LARGE\bfseries{#1}\par % name of the page
    \parskip 18pt\rule{\textwidth}{0.5pt}  % Line below
  }
  \vskip 10pt  % Space between title and text.
}

\def\@makechapterhead#1{  % Command for chapter page
  \vspace*{-110pt}
  { \parindent 0pt \raggedright\vspace*{10pt}
    \parskip 10pt\rule{\textwidth}{0.5pt}\vspace*{6mm}
    \LARGE\bfseries\thechapter~~#1\par
    \parskip 18pt\rule{\textwidth}{0.5pt}
  }
  \vskip 10pt  % Space between title and text.
}
\makeatother


%-----------------------------------------------
% Float Barrier
%-----------------------------------------------

% Do not let floats pass section, subsection and subsubsection borders
\RequirePackage[section]{placeins}
\makeatletter
\AtBeginDocument{%
  \expandafter\renewcommand\expandafter\subsection\expandafter{%
    \expandafter\@fb@secFB\subsection
  }%
}
\makeatother
%
\makeatletter
\AtBeginDocument{%
  \expandafter\renewcommand\expandafter\subsubsection\expandafter{%
    \expandafter\@fb@secFB\subsubsection
  }%
}
\makeatother


%-----------------------------------------------
%	Packages
%-----------------------------------------------

% Floats
\RequirePackage{float}
\RequirePackage{floatflt}

% Figures
\RequirePackage{graphicx}
\graphicspath{ {./images/} }
\RequirePackage{rotating}

% Tables
\RequirePackage{booktabs}
\RequirePackage{multirow}

% Acronyms
\RequirePackage[printonlyused]{acronym}

% SI units
\RequirePackage[separate-uncertainty,list-units=single,range-units=single]{siunitx}

% Maths
\RequirePackage{amsmath}
\RequirePackage{mathtools}

% Algorithm
\RequirePackage{algorithm}
\RequirePackage{algpseudocode}
\RequirePackage{listings} % Code block
\lstset{frame=tb, aboveskip=\baselineskip, basicstyle=\scriptsize\ttfamily, captionpos=b, name=lstlisting}

% Colors
\RequirePackage[usenames,dvipsnames]{xcolor}

% PDF
\RequirePackage{pdfpages} % Include pdf


%-------------------------------------------
%	Chapter/Section Numbering
%-------------------------------------------

\setcounter{tocdepth}{2}  % 2 level in contents page (until subsection)
\setcounter{secnumdepth}{3}  % Numbering for 3 level (until subsubsection)


%-------------------------------------------
%	Captions
%-------------------------------------------

\RequirePackage{caption}
\RequirePackage{subcaption}
\captionsetup{format=hang,justification=raggedright}
\captionsetup{font=small,labelfont=bf}
\captionsetup[table]{belowskip=10pt}  % Spacing between caption and table

\newcommand{\algorithmautorefname}{Algorithm} % default is just number

%	number in captions
\numberwithin{figure}{chapter}  % For figures
\numberwithin{table}{chapter}  % For tables
\numberwithin{equation}{section}   % For equation, depends on sections
\numberwithin{algorithm}{section} % For algorithm, depends on sections


%-------------------------------------------
%	Extras
%-------------------------------------------

\RequirePackage{lipsum} % Blindtext
\RequirePackage{scrhack} % Remove warning for deprecated features


%-------------------------------------------
%	Bibliography
%-------------------------------------------

\RequirePackage[backend=biber,style=ieee,sorting=nyt,urldate=long,backref=true,giveninits=true]{biblatex}
\addbibresource{./include/literature.bib}


%-------------------------------------------
%	Hyperlinks and Bookmark
%-------------------------------------------

\RequirePackage[colorlinks]{hyperref}  % Load as last package if possible
\hypersetup{linkcolor=black,citecolor=black,filecolor=black,urlcolor=black}
\RequirePackage{bookmark}  % Needs to be loaded after Hyperref
\bookmarksetup{
  % Have PDF TOC numbered and expanded by default
  numbered,
  open,
}

%-------------------------------------------

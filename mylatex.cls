
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{mylatex}[Custom Document Class]

% Load base
\LoadClass[a4paper,fontsize=12pt,oneside,openany,DIV=calc,BCOR=10mm,titlepage,numbers=noenddot,parskip=half,listof=totoc,bibliography=totoc]{scrbook}


%----------------------------------------
%	Page Settings
%-----------------------------------------

\RequirePackage{geometry}
\setlength{\textwidth}{14.9cm}
\setlength{\textheight}{21cm}
\setlength{\parindent}{0cm}
\setlength{\headheight}{1.5cm}
\setlength{\headsep}{1cm}
\setlength{\topmargin}{-1cm}
\RequirePackage{setspace}  % Spacing
\onehalfspacing


%-------------------------------------
%	Language, Font, Encoding
%-------------------------------------

\addtokomafont{disposition}{\rmfamily}  % Change headings font
\RequirePackage{lmodern}  % Latin modern font
\RequirePackage[T1]{fontenc}  % 8-bit font (e.g for Umlaut)
\RequirePackage{newtxtext, newtxmath}  % Times font for text and math
\RequirePackage[english]{babel}  % English spellchecker
\RequirePackage[utf8]{inputenc}
%\RequirePackage[applemac]{inputenc}  % For Apple User (instead of utf8)
\RequirePackage{csquotes}  % Quote symbol depends on babel language setting
\RequirePackage{ifthen}  % Command


%------------------------------------------------
%	Header and Footer Setting
%------------------------------------------------

% Sizing
\newcommand\headrule{
\vspace{-1cm}
\begin{minipage}{1\textwidth}
\hrule width \hsize \kern 2mm
\end{minipage}
}

% Style
\RequirePackage[headsepline]{scrlayer-scrpage}
\pagestyle{scrheadings}
\automark[chapter]{chapter}  % only chapter name in header (not section)

% Header
\clearpairofpagestyles
\ihead{\headmark} %% Chapter name in header
\ohead{\includegraphics[height=36pt]{latex-featured}}

% Font
\setkomafont{pageheadfoot}{\normalsize\scshape}

% Page Number in Footer
\cfoot[\pagemark]{\pagemark}


%------------------------------------------------
%	Page Layout
%------------------------------------------------

% 2 lines wrapping the chapter name
\makeatletter  % Command with @ needs to start with makeatletter and end with makeatother
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


%-------------------------------------------
%	Space before/after section/subsection
%-------------------------------------------

\RedeclareSectionCommand[
	beforeskip=1\baselineskip,
	afterskip=0.5\baselineskip]{section}

\RedeclareSectionCommand[
	beforeskip=0.75\baselineskip,
	afterskip=0.5\baselineskip]{subsection}


%-------------------------------------------
%	List and Numbering Setting
%-------------------------------------------

\setcounter{secnumdepth}{3}  % Numbering for 3 level (until subsubsection)
\setcounter{tocdepth}{2}  % 2 level in contents page (until subsection)
\RequirePackage[printonlyused]{acronym}  % For Acronym list


%-----------------------------------------------
%	Symbols, Graphics, Equation
%-----------------------------------------------

\RequirePackage{textcomp} % For extra symbols
\RequirePackage[separate-uncertainty,list-units=single,range-units=single]{siunitx}
\RequirePackage{gensymb}
\RequirePackage{latexsym}
\RequirePackage{amsmath}  % Numbering of equation
% \RequirePackage{amssymb}  % Equation
\RequirePackage{upgreek}  % Upright Greek symbol in equation
\RequirePackage[right]{eurosym}  % Eur symbol \EUR{number}, or Number \euro{}
\RequirePackage{graphicx}
\graphicspath{ {./images/} }
\RequirePackage{float}
\RequirePackage{floatflt}
\RequirePackage{multirow}
\RequirePackage[usenames,dvipsnames]{xcolor}
\RequirePackage{mathtools}  % load amsmath
\RequirePackage{booktabs}  % For Tables
\RequirePackage{pdfpages} % Include pdf
\definecolor{color0}{rgb}{0,0,0}  % Black
\definecolor{color1}{rgb}{0.22,0.45,0.70}  % Light blue
\definecolor{color2}{rgb}{0.45,0.45,0.45}  % Dark grey


%----------------------------------------------------
%	Chapter Number in Captions
%----------------------------------------------------

\RequirePackage{subfigure}
\numberwithin{figure}{chapter}  % For figures
\numberwithin{table}{chapter}  % For tables
\numberwithin{equation}{section}   % For equation, depends on sections


%-------------------------------------------
%	Figure, Table Captions
%-------------------------------------------

\RequirePackage{ragged2e}
\RequirePackage{caption}
\captionsetup{format=hang,justification=raggedright}
\captionsetup{font=small,labelfont=bf}
\captionsetup[table]{belowskip=10pt}  % Spacing between caption and table


%-------------------------------------------
%	Links, Blindtext, Layout Title Page
%-------------------------------------------

\RequirePackage{refstyle}
\RequirePackage{lipsum} % Blindtext
\RequirePackage{scrhack}
\RequirePackage{microtype}  % should remove badboxes, but not working
\RequirePackage[hyphens]{url} % Links, break URLs e.g. in footnotes


%-------------------------------------------
%	Bibliography
%-------------------------------------------

\RequirePackage[backend=biber,style=ieee,sorting=nyt,urldate=long,backref=true,giveninits=true]{biblatex}
\addbibresource{./include/literature.bib}
% \bibliography{literature}


%-------------------------------------------
%	Hyperlinks
%-------------------------------------------

\RequirePackage[colorlinks]{hyperref}  % Load as last package if possible
\hypersetup{linkcolor=color0,citecolor=color0,filecolor=black,urlcolor=color0}
\RequirePackage{bookmark}  % Needs to be loaded after Hyperref
\bookmarksetup{
  % Have PDF TOC numbered and expanded by default
  numbered,
  open,
}


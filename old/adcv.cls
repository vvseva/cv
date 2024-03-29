%% adcv.cls
%% Copyright 2016-2017 Alessandro Rossini.
%
% This work may be distributed and/or modified under the conditions of the LaTeX Project Public License (LPPL) version 1.3 or later.
%
% The latest version of this license is in
%   http://www.latex-project.org/lppl.txt
% and version 1.3 or later is part of all distributions of LaTeX version 2005/12/01 or later.
%
% This work consists of the files adcv.cls, adcv_en.def, bib_alessandro_rossini.bib, and cv_alessandro_rossini_en.tex.

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{adcv}[2016/12/15 Adaptive CV]

% Options

\newif\ifextended
\extendedfalse
\DeclareOption{extended}{
  \extendedtrue
}

\newif\ifonline
\onlinefalse
\DeclareOption{online}{
  \onlinetrue
}

\newif\ifprint
\printfalse
\DeclareOption{print}{
  \printtrue
}


\DeclareOption{en}{
  \AtEndOfPackage{
    \InputIfFileExists{adcv_en.def}{}{
      \ClassError{adcv}{English definition file 'adcv_en.def' not found.}
    }
  }
}



\DeclareOption*{
  \PassOptionsToClass{\CurrentOption}{article}
}

\ExecuteOptions{en}
\ProcessOptions
\LoadClass{article}

% Geometry

\RequirePackage[top=2cm,left=2cm,right=2cm,bottom=2cm]{geometry}

\newlength\adcv@leftcol
\newlength\adcv@centercol
\newlength\adcv@rightcol
\newlength\adcv@colsep
\newlength\adcv@leftcentercol
\newlength\adcv@centerrightcol
\newlength\adcv@langcol

\setlength{\adcv@leftcol}{12em}
\setlength{\adcv@rightcol}{9em}
\setlength{\adcv@colsep}{1em}
\setlength{\adcv@centercol}{\textwidth}
\addtolength{\adcv@centercol}{-\adcv@leftcol}
\addtolength{\adcv@centercol}{-\adcv@rightcol}
\addtolength{\adcv@rightcol}{-2\adcv@colsep}
\setlength{\adcv@leftcentercol}{\textwidth}
\addtolength{\adcv@leftcentercol}{-\adcv@rightcol}
\addtolength{\adcv@leftcentercol}{-\adcv@colsep}
\setlength{\adcv@centerrightcol}{\textwidth}
\addtolength{\adcv@centerrightcol}{-\adcv@leftcol}
\addtolength{\adcv@centerrightcol}{-\adcv@colsep}
\setlength\adcv@langcol{0.2\adcv@centerrightcol}
\addtolength{\adcv@langcol}{-2\tabcolsep}
\addtolength{\adcv@langcol}{-2\arrayrulewidth}

% Colours

\RequirePackage{xcolor}

\definecolor{white}{HTML}{FFFFFF}
\definecolor{lightgray}{HTML}{999999}
\definecolor{gray}{HTML}{555555}
\definecolor{paynegray}{HTML}{353E49}
\definecolor{black}{HTML}{000000}
% \definecolor{paynegray}{HTML}{272F38}
\definecolor{coralpink}{HTML}{FF706C}
\definecolor{teal}{HTML}{008080}
\definecolor{turquoise}{HTML}{40E0D0}

\ifprint
  \colorlet{regulartext}{black}
  \colorlet{headerfill}{white}
  \colorlet{headertext}{black}
  \colorlet{lighttext}{gray}
  \colorlet{linktextcolor}{lightgray}
\else
  \colorlet{regulartext}{gray}
  \colorlet{headerfill}{gray}
  \colorlet{headertext}{white}
  \colorlet{lighttext}{lightgray}
  \colorlet{linktextcolor}{teal}
\fi

% Header

\RequirePackage{tikz}

\newcommand*{\adcvname}[2]{\def\adcv@firstname{#1}\def\adcv@lastname{#2}}
\newcommand*{\adcvtitle}[1]{\def\adcv@title{#1}}
% \newcommand*{\adcvaddress}[4]{\def\adcv@street{#1}\def\adcv@postalcode{#2}\def\adcv@locality{#3}\def\adcv@country{#4}}
\newcommand*{\adcvaddress}[2]{\def\adcv@locality{#1}\def\adcv@country{#2}}
\newcommand*{\adcvphone}[1]{\def\adcv@phone{#1}}
\newcommand*{\adcvemail}[3]{\def\adcv@emaillocal{#1}\def\adcv@emaildomainsecond{#2}\def\adcv@emaildomaintop{#3}}
\newcommand*{\adcvwebsite}[2]{\def\adcv@websiteurl{#1}\def\adcv@websitetext{#2}}
% \newcommand*{\adcvwebsitefixed}[1]{\def\adcv@websitehref{#1}}
\newcommand*{\adcvtwitter}[2]{\def\adcv@twitterurl{#1}\def\adcv@twittertext{#2}}

% Hyperref
\RequirePackage{hyperref}

    \hypersetup{%
      colorlinks=true,%
      citecolor=linktextcolor,%
      linkcolor=linktextcolor,%
      urlcolor=  teal,%
      pdfauthor={\adcv@firstname~\adcv@lastname},%
      pdfsubject={\adcv@firstname~\adcv@lastname\adcv@cvofkey},%
      pdftitle={\adcv@firstname~\adcv@lastname\adcv@cvofkey}%
    }%

\ifextended
  \AtBeginDocument{%
    % \hypersetup{%
    %   colorlinks=true,%
    %   citecolor=linktextcolor,%
    %   linkcolor=linktextcolor,%
    %   urlcolor=  teal,%
    %   pdfauthor={\adcv@firstname~\adcv@lastname},%
    %   pdfsubject={\adcv@firstname~\adcv@lastname\adcv@cvofkey},%
    %   pdftitle={\adcv@firstname~\adcv@lastname\adcv@cvofkey}%
    % }%
  }
\else
  \AtBeginDocument{%
    % \hypersetup{%
    %   colorlinks=true,%
    %   citecolor=linktextcolor,%
    %   linkcolor=linktextcolor,%
    %   % urlcolor=linktextcolor,%
    %   pdfauthor={\adcv@firstname~\adcv@lastname},%
    %   pdfsubject={\adcv@firstname~\adcv@lastname\adcv@resumeofkey},%
    %   pdftitle={\adcv@firstname~\adcv@lastname\adcv@resumeofkey}%
    % }%
  }
\fi


% Fonts

\RequirePackage{fontspec}

\setmainfont[
  Path = fonts/,
  BoldFont = Roboto-Bold.ttf,
  ItalicFont = Roboto-Italic.ttf,
  BoldItalicFont = Roboto-BoldItalic.ttf,
  Color=regulartext
]{Roboto-Light.ttf}

\newfontfamily\regular[Path = fonts/, Color=regulartext]{Roboto-Regular.ttf}
\newfontfamily\light[Path = fonts/, Color=regulartext]{Roboto-Light.ttf}
\newfontfamily\thin[Path = fonts/, Color=regulartext]{Roboto-Thin.ttf}
\newfontfamily\regularheader[Path = fonts/, Color=headertext]{Roboto-Regular.ttf}
\newfontfamily\thinheader[Path = fonts/, Color=headertext]{Roboto-Thin.ttf}

\newcommand*{\lighttext}{\addfontfeature{Color=lighttext}}
\newcommand*{\linktextfunc}[1]{\addfontfeature{Color=linktextcolor}}

% \def\@sectioncolor#1#2#3{{\addfontfeature{Color=linktext} #1#2#3}} 
% different header color for the first 3 letters
\def\HyColor@@@@UseColor#1\@nil{\addfontfeatures{Color=linktextcolor}} % color headings 2

% \renewcommand{\section}[1]{{\Large\bfseries\@sectioncolor #1}}
\renewcommand{\section}[1]{{\Large\bfseries #1}}
\renewcommand{\subsection}[2]{\large\bfseries #2}


\graphicspath{{icons/}}

\ifprint
  \newcommand*{\aticon}{\includegraphics[height=0.75em]{at_print.png}}
  \newcommand*{\doticon}{\includegraphics[height=0.1em]{dot_print.png}}
\else
  \newcommand*{\aticon}{\includegraphics[height=0.75em]{at.png}}
  \newcommand*{\doticon}{\includegraphics[height=0.1em]{dot.png}}
\fi
\newcommand*{\twittericon}{\includegraphics[height=0.75em]{twitter-square-logo.png}}
\newcommand*{\chaticon}{\includegraphics[height=0.75em]{chat.pdf}}
\newcommand*{\envelopeicon}{\includegraphics[height=0.75em]{envelope.pdf}}
\newcommand*{\houseicon}{\includegraphics[height=0.75em]{house.pdf}}
\newcommand*{\phoneicon}{\includegraphics[height=0.75em]{phone.pdf}}
\newcommand*{\placeicon}{\includegraphics[height=0.75em]{place.pdf}}

\ifonline
  \def\adcv@address{\placeicon~\adcv@locality,~\adcv@country}
  \def\adcv@email{\envelopeicon~{\linktextfunc{\adcv@emaillocal\aticon\adcv@emaildomainsecond\doticon\adcv@emaildomaintop}}}
  \def\adcv@telephone{}
\else
  \def\adcv@address{\placeicon~\adcv@locality,~\adcv@country
%   \placeicon~\adcv@street,~\adcv@postalcode~\adcv@locality,~\adcv@country
      }
  \def\adcv@email{\envelopeicon~\href{mailto:\adcv@emaillocal @\adcv@emaildomainsecond.\adcv@emaildomaintop}{\adcv@emaillocal @\adcv@emaildomainsecond.\adcv@emaildomaintop}}
  \def\adcv@telephone{\phoneicon~\adcv@phone}
\fi

\AtBeginDocument{%
  \begin{tikzpicture}[remember picture, overlay]%
    \node [rectangle, fill=headerfill, minimum width=\paperwidth, minimum height=8em, anchor=north] (box) at (current page.north) {};%
    \node [text=headertext, anchor=center] (name) at (box) {%
      {\Huge\thinheader\adcv@firstname~\regularheader\adcv@lastname}%
    };%
    \node [text=headertext, anchor=north] at (name.south) {%
      \Large\thinheader\adcv@title%
    };%
  \end{tikzpicture}%

  \vspace{\baselineskip}%

  % \ifdefined\adcv@websitehref%
  %   \ifx\adcv@websitehref\empty%
  \ifdefined\adcv@websiteurl%
    \ifx\adcv@websiteurl\empty%
      \def\adcv@website{}%
    \else%
      \def\adcv@website{\houseicon~\href{\adcv@websiteurl}{~\adcv@websitetext}}%
        % \def\adcv@website{\houseicon~\adcv@websitehref}%
    \fi%
  \else%
    \def\adcv@website{}%
  \fi%
  
  \ifdefined\adcv@twitterurl%
    \ifx\adcv@twitterurl\empty%
      \def\adcv@twitter{}%
    \else%
      \def\adcv@twitter{\twittericon~\href{\adcv@twitterurl}{\adcv@twittertext}}%
    \fi%
  \else%
    \def\adcv@twitter{}%
  \fi%

  \begin{center}%
    \ifonline%
        \adcv@address~\adcv@email~\adcv@website%
    %   \adcv@email~\adcv@website%
    \else%
        \adcv@address~\adcv@telephone~\\~\adcv@email~\adcv@website%
    \fi%
  \end{center}%
}

% Footer

\RequirePackage{array}
\RequirePackage{fancyhdr}
\RequirePackage{totpages}

\newcommand*{\adcvdate}[1]{\def\adcv@date{#1}}

\def\adcv@totpages{~/~\ref{TotPages}}
\def\adcv@page{\adcv@pagekey~\thepage\adcv@totpages}

\AtBeginDocument{%
  \pagestyle{fancy}%
  \fancyhead{}%
  \fancyfoot[C]{\footnotesize\light\adcv@firstname~\adcv@lastname\ifextended\adcv@cvofkey\else\adcv@resumeofkey\fi, \adcv@date, \adcv@telephone~\adcv@email}%
  \fancyfoot[R]{\raggedleft\footnotesize\light\adcv@page}%
  \renewcommand{\headrulewidth}{0em}%
  \setlength\footskip{\baselineskip}%
}

% Tables

\RequirePackage{longtable}
\RequirePackage{parskip}

\setlength{\LTpre}{\parskip}
\setlength{\LTpost}{0em}
\setlength{\LTleft}{0em}
\setlength{\LTright}{0em}

\newenvironment*{adcvtabletwo}{\begin{longtable}[l]{@{}>{\raggedright}p{\adcv@leftcentercol}@{\hspace{\adcv@colsep}} @{}>{\raggedleft}p{\adcv@rightcol}@{}}}{\end{longtable}}

\newcommand*{\adcvrowtwo}[2]{#1 & #2\tabularnewline}
\newcommand*{\adcvrowmulti}[1]{\multicolumn{2}{@{}p{\textwidth}}{\lighttext #1}\tabularnewline}

\newenvironment*{adcvtablethree}{\begin{longtable}[l]{@{}>{\raggedright}p{\adcv@leftcol}@{\hspace{\adcv@colsep}} @{}>{\raggedright}p{\adcv@centercol}@{} @{\hspace{\adcv@colsep}}>{\raggedleft}p{\adcv@rightcol}@{}}}{\end{longtable}}

\newcommand*{\adcvrowthree}[3]{\bfseries #1 & #2 & #3\tabularnewline}

\newcommand*{\adcvrowskip}{\tabularnewline[-\parskip]}

% Languages

\newenvironment*{adcvlanguages}{\begin{longtable}[l]{@{}>{\raggedleft}p{\adcv@leftcol}@{\hspace{\adcv@colsep}} @{}p{\adcv@centerrightcol}@{}}}{\end{longtable}}

\newcommand*{\adcvmothertongue}[1]{{\adcv@mothertonguekey} & {\bfseries #1}\tabularnewline[0em]}

\newcommand*{\adcvlanguagesheader}{%
  \adcv@otherkey$^{\mbox{\scriptsize1}}$ &%
  \setlength\extrarowheight{0em}%
  \begin{tabular}[t]{|m{\adcv@langcol}|m{\adcv@langcol}|m{\adcv@langcol}|m{\adcv@langcol}|m{\adcv@langcol}|}%
    \firsthline%
    \multicolumn{2}{|c|}{{\bfseries\adcv@understandingkey}} & \multicolumn{2}{c|}{{\bfseries\adcv@speakingkey}} & \centering{\bfseries\adcv@writingkey}\tabularnewline%
    \cline{1-4}%
    \centering\small{\adcv@listeningkey} & \centering\small{\adcv@readingkey} & \centering\small{\adcv@interactionkey} & \centering\small{\adcv@productionkey} & \tabularnewline%
    \hline%
  \end{tabular}\tabularnewline[-\arrayrulewidth]%
}

\newcommand*{\adcvlanguage}[7]{%
  \bfseries #2$^{\mbox{\scriptsize#1}}$ &%
  \setlength\extrarowheight{0em}%
  \begin{tabular}{|m{\adcv@langcol}|m{\adcv@langcol}|m{\adcv@langcol}|m{\adcv@langcol}|m{\adcv@langcol}|}%
    \hline%
    #3 & #4 & #5 & #6 & #7\tabularnewline%
    \hline%
  \end{tabular}\tabularnewline[-\arrayrulewidth]%
}

\newcommand*{\adcvlanguagesfooter}{\adcvrowtwo{}{\footnotesize$^{\mbox{1}}$\textit{\adcv@cefrkey}}}
\newcommand*{\adcvlanguagesfootnote}[2]{\adcvrowtwo{}{\footnotesize$^{\mbox{#1}}$\textit{#2}}}

\newcommand*{\adcvCEF}[2]{%
  \begin{tabular}{@{}>{\footnotesize}p{0.2\adcv@langcol}@{\hspace{1mm}}>{\footnotesize\centering}p{0.75\adcv@langcol}@{}}%
    #1 & #2\tabularnewline%
  \end{tabular}%
}

\newcommand*{\adcvAOne}{\adcvCEF{A1}{\adcv@basickey}}
\newcommand*{\adcvATwo}{\adcvCEF{A2}{\adcv@basickey}}
\newcommand*{\adcvBOne}{\adcvCEF{B1}{\adcv@independentkey}}
\newcommand*{\adcvBTwo}{\adcvCEF{B2}{\adcv@independentkey}}
\newcommand*{\adcvCOne}{\adcvCEF{C1}{\adcv@fluentkey}}
\newcommand*{\adcvCTwo}{\adcvCEF{C2}{\adcv@fluentkey}}

% Publications

\RequirePackage[backend=biber,defernumbers=false,maxnames=99,sorting=none,style=numeric]{biblatex}
\RequirePackage{csquotes}
\urlstyle{same}

\DeclareFieldFormat[article]{title}{#1\par}
\DeclareFieldFormat[inproceedings]{title}{#1\par}
\DeclareFieldFormat[misc]{title}{#1\par}
\DeclareFieldFormat[report]{title}{#1\par}

\DeclareBibliographyDriver{article}{%
  \printfield{title}%
  \par%
  \newblock%
  \printnames{author}%
  \par%
  \newblock%
  {%
    \small\lighttext%
    \usebibmacro{journal+issuetitle}%
    \setunit{\space}%
    \printfield{pages}%
    \newunit%
    \printlist{publisher}%
    \setunit*{\addcomma\space}%
    \printfield{year}%
    \iffieldundef{doi}{%
      \iffieldundef{isbn}{}{%
        \newunit%
        \printfield{isbn}%
      }%
    }{%
      \newunit%
      \printfield{doi}%
    }%
    \vspace{.5\baselineskip}%
  }%
}

\DeclareBibliographyDriver{inproceedings}{%
  \printfield{title}%
  \par%
  \newblock%
  \printnames{author}%
  \par%
  \newblock%
  {%
    \small\lighttext%
    \printfield{booktitle}%
    \setunit{\addcomma\space}%
    \printfield{year}%
    \iffieldundef{doi}{%
      \iffieldundef{isbn}{}{%
        \newunit%
        \printfield{isbn}%
      }%
    }{%
      \newunit%
      \printfield{doi}%
    }%
    \vspace{.5\baselineskip}%
  }%
}

\DeclareBibliographyDriver{report}{%
  \printfield{title}%
  \par%
  \newblock%
  \printnames{author}%
  \par%
  \newblock%
  {%
    \small\lighttext%
    \printfield{type}%
    \setunit{\addcomma\space}%
    \printlist{institution}%
    \setunit{\addcomma\space}%
    \printfield{year}%
    \iffieldundef{isbn}{}{%
      \newunit%
      \printfield{isbn}%
    }%
    \vspace{.5\baselineskip}%
  }%
}

\DeclareBibliographyDriver{misc}{%
  \printfield{title}%
  \par%
  \newblock%
  \printnames{author}%
  \par%
  \newblock%
  {%
    \small\lighttext%
    \printfield{booktitle}%
    \setunit*{\addcomma\space}%
    \printfield{note}%
    \setunit*{\addcomma\space}%
    \printfield{year}%
    \vspace{.5\baselineskip}%
  }%
}

\DeclareNameFormat{author}{%
  \small\lighttext%
  \nameparts{#1}%
  \ifblank{\namepartgiven}{}{\namepartgiven\space}\namepartfamily%
  \ifthenelse{\value{listcount}<\value{liststop}}{\addcomma\space}{}%
}

% Presentations

\RequirePackage{enumitem}

\newenvironment*{adcvpresentations}{%
  \setlist[enumerate]{labelsep=1em}%
  \renewcommand{\theenumi}{[\arabic{enumi}]}%
  \renewcommand{\labelenumi}{\theenumi}%
  \begin{enumerate}%
}{%
  \end{enumerate}%
}

\newcommand*{\adcvpresentation}[2]{\item #1\\{\small\lighttext #2}}

% % Date command
% \setlength{\TPHorizModule}{1mm}
% \setlength{\TPVertModule}{1mm}
% \textblockorigin{0mm}{5mm} % start everyth
% \newcommand{\lastupdated}{\begin{textblock}{60}(165,0)
% \color{date}\fontspec[Path = fonts/raleway/]{Raleway-ExtraLight}\fontsize{8pt}{10pt}\selectfont 
% Last Updated on
% \today
% \end{textblock}}
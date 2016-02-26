% Original template author:
% Adrien Friggeri (adrien@friggeri.net)
% https://github.com/afriggeri/CV
% Modified by Krisztian Kurucz
%
% License:
% CC BY-NC-SA 3.0 (http://creativecommons.org/licenses/by-nc-sa/3.0/)
%
% Important notes:
% This template needs to be compiled with XeLaTeX and the bibliography, if used,
% needs to be compiled with biber rather than bibtex

\NeedsTeXFormat{LaTeX2e}

\DeclareOption{print}{\def\@cv@print{}}
\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{article}%
}
\ProcessOptions\relax
\LoadClass{article}


%%%%%%%%%%
% Colors %
%%%%%%%%%%

\RequirePackage{xcolor}

\definecolor{white}{RGB}{255,255,255}

\definecolor{black}{HTML}{000000}
\definecolor{darkgray}{HTML}{333333}
\definecolor{gray}{HTML}{4D4D4D}
\definecolor{lightgray}{HTML}{999999}

\colorlet{fillheader}{white}
\colorlet{header}{darkgray}
\colorlet{textcolor}{gray}
\colorlet{headercolor}{black}


%%%%%%%%%
% Fonts %
%%%%%%%%%

\RequirePackage[quiet]{fontspec}
\RequirePackage[math-style=TeX,vargreek-shape=unicode]{unicode-math}
\RequirePackage{fontawesome}

\newfontfamily\bodyfont[]{Roboto}
\newfontfamily\thinfont[]{Roboto Thin}
\newfontfamily\headingfont[]{Roboto Condensed}
\newfontfamily{\FA}{FontAwesome}

\def\twitter{{\FA \faTwitter}}
\def\facebook{{\FA \faFacebook}}
\def\linkedin{{\FA \faLinkedinSquare}}
\def\github{{\FA \faGithub}}
\def\mobile{{\FA \faMobilePhone}}
\def\phone{{\FA \faPhone}}
\def\mail{{\FA \faEnvelopeO}}
\def\website{{\FA \faGlobe}}

\defaultfontfeatures{Mapping=tex-text}
\setmainfont[Mapping=tex-text, Color=textcolor]{Roboto Light}

%%%%%%%%%%
% Header %
%%%%%%%%%%

\RequirePackage{tikz}

\newcommand{\rolefont}{%
  \fontsize{14pt}{24pt}\selectfont%
  \thinfont%
  \color{white}%
}

\newcommand{\header}[3]{%
  \begin{tikzpicture}[remember picture,overlay]
    \node [rectangle, fill=fillheader, anchor=north, minimum width=\paperwidth, minimum height=4cm] (box) at (current page.north){};
    \node [anchor=center] (name) at (box) {%
      \fontsize{40pt}{72pt}\color{header}%
      {\thinfont #1} {\bodyfont  #2}
    };
    \node [anchor=north] at (name.south) {%
      \fontsize{14pt}{24pt}\color{header}%
      \thinfont #3%
    };
  \end{tikzpicture}
  \vspace{2cm}
  \vspace{-2\parskip}
}


%%%%%%%%%%%%%
% Structure %
%%%%%%%%%%%%%
\RequirePackage{parskip}

\newcounter{colorCounter}
\def\@sectioncolor#1#2#3{%
  {%
    \color{%
        headercolor%
    } #1#2#3%
  }%
  \stepcounter{colorCounter}%
}

\renewcommand{\section}[1]{
  \par\vspace{\parskip}
  {%
    \LARGE\headingfont\color{headercolor}%
    \@sectioncolor #1%
  }
  \par\vspace{\parskip}
}

\renewcommand{\subsection}[1]{
  \par\vspace{.25\parskip}%
  {\large\headingfont\color{headercolor} #1}
  \par\vspace{.25\parskip}%
}

\renewcommand{\subsubsection}[2]{
  \par\vspace{.5\parskip}%
  {\Large\headingfont\color{headercolor} #2}
  \par\vspace{.25\parskip}%
}

\pagestyle{empty}


%%%%%%%%%%%%%%%%%%%%
% List environment %
%%%%%%%%%%%%%%%%%%%%

\RequirePackage{etoolbox}

\setlength{\tabcolsep}{0pt}
\newenvironment{entrylist}{%
  \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}ll}
}{%
  \end{tabular*}
}
\renewcommand{\bfseries}{\headingfont\color{headercolor}}
\newcommand{\entry}[5]{%
  \parbox[t]{14cm}{%
    \textbf{#2}%
    \hfill%
    {\footnotesize\addfontfeature{Color=lightgray} #3}\\%
	#4\null\hfill{\footnotesize\addfontfeature{Color=gray} #1}%
	#5
	\vspace{2mm}%
  }\\}

%%%%%%%%%%%%%%
% Side block %
%%%%%%%%%%%%%%

\RequirePackage[absolute,overlay]{textpos}
\setlength{\TPHorizModule}{1cm}
\setlength{\TPVertModule}{1cm}
\newenvironment{aside}{%
  \let\oldsection\section
  \renewcommand{\section}[1]{
    \par\vspace{\baselineskip}{\Large\headingfont\color{headercolor} ##1}
  }
  \begin{textblock}{4.2}(1.3, 4.33)
  \begin{flushright}
  \obeycr
}{%
  \restorecr
  \end{flushright}
  \end{textblock}
  \let\section\oldsection
}

%%%%%%%%%%%%%%%%
% Other tweaks %
%%%%%%%%%%%%%%%%

\RequirePackage[left=6.1cm,top=2cm,right=1.5cm,bottom=2.5cm,nohead,nofoot]{geometry}
\RequirePackage[hidelinks]{hyperref}
\hypersetup{
    colorlinks=false,
    linkcolor=red,
    citecolor=red,
    filecolor=red,
    urlcolor = red}

% A fix for \href{}{} colors not working with fontspec
\makeatletter
\def\HyColor@@@@UseColor#1\@nil{\addfontfeatures{Color=#1}}
\makeatother
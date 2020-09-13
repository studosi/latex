%   Copyright (c) 2020 studosi.net
%
%   STUDOSI NO-PROFIT LICENSE v1.0
%
%   Permission is hereby granted, free of charge, to any person
%   obtaining a copy of this software and associated documentation
%   files (the "Software"), to deal in the Software without
%   restriction, including without limitation the rights to use,
%   copy, modify, merge, publish, distribute, and/or sublicense
%   copies of the Software, and to permit persons to whom the
%   Software is furnished to do so, subject to the following
%   conditions:
%
%   The above copyright notice and this permission notice shall be
%   included in all copies or substantial portions of the
%   Software.
%
%   The Software shall be used for Good, not Evil.
%
%   The copyright holder as well as the primary contributors
%   reserve the exclusive and indisputable right to determine what
%   is considered Good and Evil.
%
%   The Software shall not be used for profit.
%
%   THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY
%   KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
%   WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR
%   PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
%   COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
%   LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
%   OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
%   SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

\NeedsTeXFormat{LaTeX2e}
\ProvidesPackage{studosi-workbook}[A LaTeX document class for workbooks]

\PassOptionsToClass{10pt,a4paper,twoside,openright}{book}
\ProcessOptions\relax

\LoadClass{book}

\RequirePackage[T1]{fontenc}
\RequirePackage[utf8]{inputenc}

\RequirePackage{amsmath}
\RequirePackage{calc}
\RequirePackage[croatian]{babel}
\RequirePackage{geometry}
\RequirePackage{graphicx}
\RequirePackage[hyperref]{xcolor}
\RequirePackage{hyperref}
\RequirePackage[framemethod=tikz]{mdframed}
\RequirePackage{minted}
\RequirePackage{tikz}
\RequirePackage{xparse}

\definecolor{studosicolor}{HTML}{43ADA9}
\definecolor{citecolor}{HTML}{ADA943}
\definecolor{filecolor}{HTML}{AD4347}
\definecolor{antistudosicolor}{HTML}{AD4347}
\definecolor{urlcolor}{HTML}{A943AD}
\definecolor{tagcolor}{HTML}{286765}

\newcommand{\studosititle}{\large{\textsc{Studoši}}}
\newlength{\studosititlewidth}
\setlength{\studosititlewidth}{\widthof{\studosititle}}
\addtolength{\studosititlewidth}{+25pt}

\renewcommand{\maketitle}{%
    \newgeometry{centering}
    \begin{titlepage}
        \begin{center}
            \vspace*{\fill}

            \studosititle \\
            \vspace*{-8pt}
            \centerline{\rule{\studosititlewidth}{0.2pt}}
            \vspace*{20pt}

            \huge{\textbf{\textsc{\@title}}}

            \large{\textsc{zbirka zadataka}}

            \vspace*{\fill}

            \normalsize{zadnje ažurirano \today}
        \end{center}
    \end{titlepage}
    \restoregeometry
}

\AtBeginDocument{%
\hypersetup{
    linkcolor=studosicolor,
    linkbordercolor=studosicolor,
    citecolor=citecolor,
    citebordercolor=citecolor,
    filecolor=filecolor,
    urlcolor=urlcolor,
    urlbordercolor=urlcolor
    }
}
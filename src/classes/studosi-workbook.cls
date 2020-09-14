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

\PassOptionsToClass{12pt,a4paper,twoside,openany}{book}
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
\definecolor{codebgcolor}{HTML}{E3E3E3}

\newcounter{tasknum}[chapter]
\newcounter{answernum}[tasknum]
\setcounter{tasknum}{0}

\newcommand{\studosititle}{\large{\textsc{Studoši}}}

\setlength\parindent{0pt}
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

% For anyone wondering why this is implemented in such a braindead way:
% alignment gets all fucky if I try to simulate a stack program.
\NewDocumentCommand{\recordpoints}{m m m}{%
    \IfNoValueTF{#3}{
        \IfNoValueTF{#2}{
            \IfNoValueTF{#1}{}{%
                (\textcolor{studosicolor}{#1})
            }
        }{%
            (\textcolor{studosicolor}{#1} \hspace{0.1cm}
             \textcolor{antistudosicolor}{#2})
        }
    }{%
        (\textcolor{studosicolor}{#1} \hspace{0.2cm}
         \textcolor{gray}{#2} \hspace{0.2cm}
         \textcolor{antistudosicolor}{#3})
    }
}

\NewDocumentCommand{\recordtag}{m}{%
    \IfNoValueTF{#1}{}{#1 \space}
}

\NewDocumentCommand{\recordauthors}{m}{%
	\IfNoValueTF{#1}{}{#1 \space}
}

% Arguments are points in (), tags in []
\NewDocumentEnvironment{zadatak}{>{\SplitArgument{2}{;}}d() >{\SplitList{,}}d[]}{%
    \refstepcounter{tasknum}
    \vspace*{10pt}
    \begin{flushleft}
        \Large{%
            \textsc{Zadatak \thechapter.\thetasknum} \space \IfNoValueTF{#1}{}{%
                \mbox{\normalsize \textbf{\recordpoints #1}}
            }
        } \\
        \small{%
            \IfNoValueTF{#2}{}{%
                \mbox{%
                    \textsc{ključne riječi:} \hspace{15pt} \textcolor{tagcolor}{%
                        \textbf{\ProcessList{#2}{\recordtag}}
                    }
                }
            }
        }
        \vspace{5pt}
    \end{flushleft}
} {%
    \vspace*{10pt}
}

\NewDocumentCommand{\komentar}{d[] m}{%
	\begin{flushleft}
		\footnotesize{%
			\IfNoValueTF{#2}{%
				\textit{prazan komentar}
			}{%
				\textbf{%
					\IfNoValueTF{#1}{%
						Komentar:
					}{%
						\textcolor{studosicolor}{#1} komentira:
					}%
				} \textit{#2}
			}
		}
	\end{flushleft}
}

% Arguments are a single () argument for points, and authors in []
\NewDocumentEnvironment{odgovor}{d() >{\SplitList{,}}d[]}{%
    \refstepcounter{answernum}
    \vspace*{10pt}
    \begin{flushleft}
        \large
        \textsc{%
        	Odgovor {\theanswernum} na zadatak \thechapter.\thetasknum%
        } \hspace{20pt} \IfNoValueTF{#1}{}{%
            \hfill \mbox{%
                \normalsize{\textsc{bodovi:} \textbf{\textcolor{studosicolor}{#1}}}
            }
        } \\
    \small{%
    	\IfNoValueTF{#2}{}{%
    		\mbox{%
    			\textsc{priložili:} \hspace{15pt} \textcolor{tagcolor}{%
    				\textbf{\ProcessList{#2}{\recordauthors}}
    			}
    		}
    	}
    }
    \vspace{5pt}
    \end{flushleft}
}{%
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

    \newminted[kod]{text}{bgcolor=codebgcolor,baselinestretch=1.2,tabsize=4,fontsize=\small,breaklines,autogobble}
}
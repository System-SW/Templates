%
%  Letter Template
%  Seongjin Lee
%  Systems Research Lab.
%  2021-07-27
%


\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{GnuLetter}

\def\textest{pdflatex}
\def\cmrbody{false}
\def\havefoundrysterling{true}
\DeclareOption{xelatex}{\def\textest{xelatex}}
\DeclareOption{cmrbody}{\def\cmrbody{true}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{letter}}
\ProcessOptions

\LoadClass[a4paper,12pt]{letter}
\RequirePackage{graphicx}
\RequirePackage[dvipsnames]{xcolor}
\RequirePackage{hyperref}
\RequirePackage{ifthen}
\RequirePackage{lastpage}
\RequirePackage{kotex}

\hypersetup{
    colorlinks=false,
    hidelinks
}



\ifthenelse{\equal{\textest}{xelatex}}%
{
%alternative font setup if using xelatex (which also produces a PDF)
\RequirePackage{xltxtra}
\ifthenelse{\equal{\cmrbody}{true}}%
{}
{%set main font to be Arial
\setmainfont[Mapping=tex-text]{Arial}
}
}
{
%default font setup for use with pdflatex
\RequirePackage[T1]{fontenc}
\ifthenelse{\equal{\cmrbody}{true}}%
{}
{%set main font to be Helvetica 
\renewcommand{\rmdefault}{phv}%
}
}

% define page layout lengths
\setlength{\textheight}{190mm} %firstpage only
\setlength{\textwidth}{160mm}
\setlength{\topmargin}{-43mm}
\setlength{\headheight}{30mm}
\setlength{\footskip}{10mm}
\setlength{\oddsidemargin}{0mm} 
\setlength{\evensidemargin}{0mm}
\setlength{\parskip}{1em}
\setlength{\parindent}{2em}

% define newcommands for user set information
\newcommand{\SUBJECT}[1]{\renewcommand{\SUBJECT}{#1}}
\newcommand*{\position}[1]{\def\fromposition{#1}}

\newcommand{\logo}[1]{\renewcommand{\logo}{#1}}
\newcommand{\MyName}[1]{\renewcommand{\MyName}{#1}}
\newcommand{\MyTitle}[1]{\renewcommand{\MyTitle}{#1}}
\newcommand{\UnivName}[2]{\renewcommand{\UnivName}{{\textcolor{RoyalBlue}{\scshape#1\\#2}}}}
\newcommand{\EMAIL}[1]{\renewcommand{\EMAIL}{\href{mailto:#1}{#1}}}
\newcommand{\FAX}[1]{\renewcommand{\FAX}{#1}}
\newcommand{\PHONE}[1]{\renewcommand{\PHONE}{#1}}
\newcommand{\PREFIXNO}[1]{\renewcommand{\PREFIXNO}{#1}}
\newcommand{\CELLPHONE}[1]{\renewcommand{\CELLPHONE}{#1}}
\newcommand{\AFFone}[1]{\renewcommand{\AFFone}{#1}}
\newcommand{\AFFtwo}[1]{\renewcommand{\AFFtwo}{#1}}
\newcommand{\AFFthree}[1]{\renewcommand{\AFFthree}{#1}}
\newcommand{\SITE}[1]{\renewcommand{\SITE}{\href{#1}{#1}}}
\newcommand{\FOOTERTEXT}[1]{\renewcommand{\FOOTERTEXT}{#1}}

\FOOTERTEXT{
    \centering
    \textcolor{BlueGreen}{\raisebox{0.5mm}{\rule{3cm}{1pt}}} \quad {\tiny $\heartsuit$} \quad \textcolor{BlueGreen}{\raisebox{0.5mm}{\rule{3cm}{1pt}}}\\
       \scriptsize \textcolor{BlueGreen}{
       \textsf{General Enquiries Tel: +82-55-772-1370 \quad Direct: +82-55-772-{\PHONE} \quad E-Mail: \href{mailto:it@gnu.ac.kr}{it@gnu.ac.kr}\\
         Fax: +82-55-772-{\FAX} \quad
         Web: \href{http://anse.gnu.ac.kr}{http://anse.gnu.ac.kr}}
       }
}

\PREFIXNO{+82-55-772-}

\newcommand{\myinfo}[1]{\renewcommand{\myinfo}{#1}}
\newcommand{\myinfogroup}{
	%\hspace{\fill} 
	%\parbox[t]{0.3\textwidth}{ 
		\small 
		\MyName\MyTitle\\[1em] 
		\textit{\footnotesize \myinfo} 
	%}
}

\myinfo{
	\AFFtwo \\ % Your department/institution
	\AFFthree \\ % Your address
	\PREFIXNO\PHONE\\ % Your phone number
    {\EMAIL} \\ % Your email address
	\SITE \\[-1em]~% Your URL
}


%\makeatletter
\newcommand{\vhrulefill}[1]{\leavevmode\leaders\hrule\@height#1\hfill \kern\z@}
%\makeatother

% first page header and footer 
\renewcommand{\ps@firstpage}{%
  \setlength{\headsep}{70mm}
  \setlength{\textwidth}{166mm}
  % 
  \renewcommand{\@oddhead}{%
    \parbox[t]{\textwidth}{%
    \raisebox{-34mm}{%{\parbox[t]{1.5in}{
    \includegraphics[width=1.5in]{\logo}
    }%}} 	
      \raisebox{-30.5mm}{{\hspace*{5mm}\parbox[t]{60mm}{%
             { 	\vskip -0.095\textheight~\\
                \large\UnivName\hfill\\[-0.004\textheight] 
                \hspace{0.8\textwidth} \normalsize \textcolor{RoyalBlue}{\rule{11.5cm}{5pt}}}\\[32mm]
                \hspace*{-4.4cm}\begin{minipage}[c]{5cm}
                  \toname \\[0.5em]
                  \toaddress
                \end{minipage}
          }
        }}%\hfill
      \raisebox{-14.5mm}{\hspace{-3.65cm}\parbox[t]{90mm}{%
        \flushright \textcolor{RoyalBlue}{\myinfogroup}\\[5mm]
        \@date\hspace*{4mm}
      }
      }%
    }%
  }%
  % 
  \renewcommand{\@oddfoot}{%  
    \hspace*{-3mm}
    \parbox{\textwidth}{
      \FOOTERTEXT
     }
   }
   % 
  \renewcommand{\@evenhead}{}
  \renewcommand{\@evenfoot}{}
}

% subsequent pages 
\renewcommand{\ps@headings}{%
  \setlength{\headsep}{30mm}
  % 
  \renewcommand{\@oddhead}{
    \raisebox{-10mm}{
        \parbox[t]{140mm}{%
        {\hspace*{-2mm}\scriptsize \textcolor{BlueGreen}{Page \thepage \hspace{1pt} of \pageref{LastPage}}}\\[-2mm]
           \hspace*{-2mm}\textcolor{BlueGreen}{\rule{14cm}{2pt}}
        }
    }
        \parbox[t]{23mm}{%
           \flushright{\includegraphics[width=20mm]{\logo}}
        }
    }
  % 
  \renewcommand{\@oddfoot}{
    \hspace*{0.79mm}\parbox{\textwidth}{
      \FOOTERTEXT
      }     
  }
  \renewcommand{\@evenhead}{\@oddhead}
  \renewcommand{\@evenfoot}{\@oddfoot}
}

\providecommand{\@evenhead}{}\providecommand{\@oddhead}{}
\providecommand{\@evenfoot}{}\providecommand{\@oddfoot}{}

\pagestyle{headings}

%write the date in the form 1st July 2010 rather than July 1, 2010
\renewcommand{\today}{%
  \ifcase\day\or
  1st\or 2nd\or 3rd\or 4th\or 5th\or
  6th\or 7th\or 8th\or 9th\or 10th\or
  11th\or 12th\or 13th\or 14th\or 15th\or
  16th\or 17th\or 18th\or 19th\or 20th\or
  21st\or 22nd\or 23rd\or 24th\or 25th\or
  26th\or 27th\or 28th\or 29th\or 30th\or
  31st\fi~\ifcase\month\or January\or February\or March\or
  April\or May\or June\or July\or August\or September\or October\or
  November\or December\fi \space \number\year%
}

% redefine opening command to show letter subject
% and set subsequent page lengths
\renewcommand{\opening}[1]{\thispagestyle{firstpage}%
  \setlength{\textheight}{230mm}
  \noindent #1 \par
  \ifthenelse{\equal{\SUBJECT}{}}
  {}{\noindent\textbf{\SUBJECT} \par}
  \nobreak
}

% redefine closing command to sign off with name and postion
\renewcommand{\closing}[1]{\par\nobreak\vspace{2\parskip}%
  \stopbreaks
  \noindent
  \parbox{\indentedwidth}{\raggedright
    \ignorespaces #1\\[9\medskipamount]%
    \fromsig\\ \fromposition}%
  \par
}

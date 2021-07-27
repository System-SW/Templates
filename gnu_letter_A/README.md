# GNU Letter Style A

## Required
A version of TeXLive (preferably the most recent one)

## To Generate PDF file
> xelatex letter_template.tex
or 
> pdflatex letter_template.tex

## Customizable varibles
\logo{gnu_v1} : Square logo of your institution

\signature{Seongijn Lee, PhD} : The name at the end of the letter

\position{Associate Professor} : Your position at the organization

\PHONE{1378} : Last four digits of your land line phone (prefix is set to +82-55-772-, \PREFIXNO is defined in the class file)

\FAX{1580} : Last four digits of fax number (prefix is set to +82-55-772-)

\EMAIL{insight@gnu.ac.kr} : Email address

\CELLPHONE{+82-10-3703-1078} : Cellular phone number

\AFFone{Department of AI Convergence Engineering} : Affiliation (not used)

\AFFtwo{Department of Aerospace and Software Engineering} Affiliation (used)

\AFFthree{Gyeongnam Jinjusi Jinjudaero 501, 407-314\\52828, South Korea} : Address of you organization

\SITE{http://open.gnu.ac.kr} : Your homepage

\MyName{Seongjin Lee} : Name in the letter head

\MyTitle{, PhD} : Degree to go with your name in the letter head

## GnuLetter.cls file
* Information in the footer is in the class file under \FOOTERTEXT. You might want to change it before using the template.

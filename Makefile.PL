
use strict;
use warnings;

use ExtUtils::MakeMaker;

WriteMakefile(
  DISTNAME  => 'Email-MIME-Kit-Renderer-Text-Template',
  NAME      => 'Email::MIME::Kit::Renderer::Text::Template',
  AUTHOR    => "Ricardo\ Signes\ \<rjbs\@cpan\.org\>",
  ABSTRACT  => "render\ parts\ of\ your\ mail\ with\ Text\:\:Template",
  VERSION   => '1.092920',
  EXE_FILES => [ qw() ],
  (eval { ExtUtils::MakeMaker->VERSION(6.31) } ? (LICENSE => 'perl') : ()),
  PREREQ_PM    => {
    "Email::MIME::Kit" => '2',
    "Text::Template" => '0',
  },
  test => {TESTS => 't/*.t'}
);


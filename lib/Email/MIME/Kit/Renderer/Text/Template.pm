package Email::MIME::Kit::Renderer::Text::Template;
our $VERSION = '1.092921';


use Moose;
with 'Email::MIME::Kit::Role::Renderer';
# ABSTRACT: render parts of your mail with Text::Template

use Text::Template ();

sub _enref_as_needed {
  my ($self, $hash) = @_;

  my %return;
  while (my ($k, $v) = each %$hash) {
    $return{ $k } = (ref $v and not blessed $v) ? $v : \$v;
  }

  return \%return;
}

has template_args => (
  is  => 'ro',
  isa => 'HashRef',
);

sub render  {
  my ($self, $input_ref, $args)= @_;

  my $hash = $self->_enref_as_needed({
    (map {; $_ => ref $args->{$_} ? $args->{$_} : \$args->{$_} } keys %$args),
  });

  my $result = Text::Template::fill_in_string(
    $$input_ref,
    %{ $self->{template_args} || {} },
    HASH   => $hash,
    BROKEN => sub { die shift },
  );

  die $Text::Template::ERROR unless defined $result;

  return \$result;
}

1;




=pod

=pod 

=head1 NAME

Email::MIME::Kit::Renderer::Text::Template - render parts of your mail with Text::Template

=head1 VERSION

version 1.092921

=head1 AUTHOR

  Ricardo Signes <rjbs@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2009 by Ricardo Signes.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2009 by Ricardo Signes.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut 



__END__




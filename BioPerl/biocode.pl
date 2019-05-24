#!/bin/perl -w

use Bio::Seq;

$seq_obj = Bio::Seq->new(-seq => "aaaatgggggggggggccccgtt",
                         -alphabet => 'dna' );

                         print $seq_obj->seq;

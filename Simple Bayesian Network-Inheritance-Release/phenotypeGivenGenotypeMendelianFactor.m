function phenotypeFactor = phenotypeGivenGenotypeMendelianFactor(isDominant, genotypeVar, phenotypeVar)
% This function computes the probability of each phenotype given the
% different genotypes for a trait.  It assumes that there is 1 dominant
% allele and 1 recessive allele.
%
% If you do not have much background in genetics, you should read the
% on-line Appendix or watch the Khan Academy Introduction to Heredity Video
% (http://www.khanacademy.org/video/introduction-to-heredity?playlist=Biology)
% before you start coding.
%
% For the genotypes, assignment 1 maps to homozygous dominant, assignment 2
% maps to heterozygous, and assignment 3 maps to homozygous recessive.  For
% example, say that there is a gene with two alleles, dominant allele A and
% recessive allele a.  Assignment 1 would map to AA, assignment 2 would
% make to Aa, and assignment 3 would map to aa.  For the phenotypes, 
% assignment 1 maps to having the physical trait, and assignment 2 maps to 
% not having the physical trait.
%
% THE VARIABLE TO THE LEFT OF THE CONDITIONING BAR MUST BE THE FIRST
% VARIABLE IN THE .var FIELD FOR GRADING PURPOSES
%
% Input:
%   isDominant: 1 if the trait is caused by the dominant allele (trait 
%   would be caused by A in example above) and 0 if the trait is caused by
%   the recessive allele (trait would be caused by a in the example above)
%   genotypeVar: The variable number for the genotype variable (goes in the
%   .var part of the factor)
%   phenotypeVar: The variable number for the phenotype variable (goes in
%   the .var part of the factor)
%
% Output:
%   phenotypeFactor: Factor denoting the probability of having each 
%   phenotype for each genotype

phenotypeFactor = struct('var', [], 'card', [], 'val', []);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%INSERT YOUR CODE HERE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  

% Fill in phenotypeFactor.var.  This should be a 1-D row vector.
% Fill in phenotypeFactor.card.  This should be a 1-D row vector.
phenotypeFactor.var(1) = phenotypeVar;  %  we want P(phenotype|genotype), so phenotypeVar comes first
phenotypeFactor.var(2) = genotypeVar;
phenotypeFactor.card = [2 3]; 

phenotypeFactor.val = zeros(1, prod(phenotypeFactor.card));
% Replace the zeros in phentoypeFactor.val with the correct values.

% Genotype assignments
HOMODOMINANT = 1;
HETERO = 2;
HOMORECESSIVE = 3;

% Phenotype assignments
TRAIT = 1;
NOTRAIT = 2;

True = 1;
False = 0;

% Fill in phenotypeFactor.val
for i=1:prod(phenotypeFactor.card)
    assignments = IndexToAssignment(i, phenotypeFactor.card);
    phenotype_assignment = assignments(1);
    genotype_assignment = assignments(2);
    if isDominant == True     % dominant allel 
       
       if phenotype_assignment == TRAIT
           if (genotype_assignment == HOMODOMINANT || genotype_assignment == HETERO) 
               phenotypeFactor.val(i) = True;
           else
               phenotypeFactor.val(i) = False;
           end
       else
           if (genotype_assignment == HOMORECESSIVE)
               phenotypeFactor.val(i) = True;
           else
               phenotypeFactor.val(i) = False;
           end
       end 
       
    else
       if phenotype_assignment == TRAIT
           if (genotype_assignment == HOMORECESSIVE || genotype_assignment == HETERO) 
               phenotypeFactor.val(i) = True;
           else
               phenotypeFactor.val(i) = False;
           end
       else
           if (genotype_assignment == HOMODOMINANT)
               phenotypeFactor.val(i) = True;
           else
               phenotypeFactor.val(i) = False;
           end
       end 
    end       
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

S := ${SUFFIX}

all: thesis${S}

# default target

general_physics.%: 
	touch $@	

Iinear_algebra.%:
	touch $@

univariate_calculus.%:
	touch $@

multivariate_calculus.%:univariate_calculus.%
	touch $@

probability_theory.%: multivariate_calculus.%
	touch $@
	echo  $(basename $^)  > $@

thermodynamics.%:multivariate_calculus.%  general_physics.%
	touch  $@
	echo  $(basename $^ )  > $@

mathematical_physics.%: multivariate_calculus.%  Iinear_algebra.%
	touch $@
	echo  $(basename $^)  > $@

statistical_mechanics.%:thermodynamics.%  probability_theory.%
	touch $@
	echo  $(basename $^ )  > $@

analytical_mechanics.%: multivariate_calculus.%  general_physics.%  mathematical_physics.%
	touch $@
	echo  $(basename $^ )  > $@


quantum_mechanics.%:Iinear_algebra.%  general_physics.%  analytical_mechanics.%
	touch $@
	echo  $(basename $^ )  > $@


electrodynamics.%: multivariate_calculus.%  general_physics.%  mathematical_physics.%
	touch $@
	echo  $(basename $^)  > $@
	

thesis.%:analytical_mechanics.%  quantum_mechanics.%  statistical_mechanics.%  electrodynamics.%
	touch $@
	echo $(basename $^) > $@

# clean up
clean:
	rm -r *${S}


.PRECIOUS:%${S}
.SECONDARY:

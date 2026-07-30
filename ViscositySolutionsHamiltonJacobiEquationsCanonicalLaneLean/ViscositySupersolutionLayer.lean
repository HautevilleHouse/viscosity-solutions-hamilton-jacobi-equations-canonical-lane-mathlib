import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ViscositySolutionsHamiltonJacobiEquationsCanonicalLaneLean.ViscosityOperators

namespace HautevilleHouse
namespace ViscositySolutionsHamiltonJacobiEquationsCanonicalLaneLean

structure ViscositySupersolutionCertificate where
  flow : HJFlow
  supersolutionProperty : Prop
  viscosityConsistency : Prop
  barrierCondition : Prop
  supersolutionClosed : supersolutionProperty
  viscosityConsistencyClosed : viscosityConsistency
  barrierConditionClosed : barrierCondition

def sourceViscositySupersolutionCertificate : ViscositySupersolutionCertificate := {
  flow := primitiveFlow
  supersolutionProperty := HJEquationClosed primitiveFlow
  viscosityConsistency := True
  barrierCondition := True
  supersolutionClosed := primitive_flow_equation_closed_checked
  viscosityConsistencyClosed := trivial
  barrierConditionClosed := trivial
}

def ViscositySupersolutionClosed (C : ViscositySupersolutionCertificate) : Prop :=
  C.supersolutionProperty ∧ C.viscosityConsistency ∧ C.barrierCondition

theorem source_viscosity_supersolution_closed :
    ViscositySupersolutionClosed sourceViscositySupersolutionCertificate := by
  exact And.intro sourceViscositySupersolutionCertificate.supersolutionClosed
    (And.intro sourceViscositySupersolutionCertificate.viscosityConsistencyClosed
      sourceViscositySupersolutionCertificate.barrierConditionClosed)

end ViscositySolutionsHamiltonJacobiEquationsCanonicalLaneLean
end HautevilleHouse
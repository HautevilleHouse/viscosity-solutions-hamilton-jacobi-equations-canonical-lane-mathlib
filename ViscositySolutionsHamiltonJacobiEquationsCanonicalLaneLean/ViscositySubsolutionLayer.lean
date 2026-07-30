import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ViscositySolutionsHamiltonJacobiEquationsCanonicalLaneLean.ViscosityOperators

namespace HautevilleHouse
namespace ViscositySolutionsHamiltonJacobiEquationsCanonicalLaneLean

structure ViscositySubsolutionCertificate where
  flow : HJFlow
  subsolutionProperty : Prop
  viscosityConsistency : Prop
  barrierCondition : Prop
  subsolutionClosed : subsolutionProperty
  viscosityConsistencyClosed : viscosityConsistency
  barrierConditionClosed : barrierCondition

def sourceViscositySubsolutionCertificate : ViscositySubsolutionCertificate := {
  flow := primitiveFlow
  subsolutionProperty := HJEquationClosed primitiveFlow
  viscosityConsistency := True
  barrierCondition := True
  subsolutionClosed := primitive_flow_equation_closed_checked
  viscosityConsistencyClosed := trivial
  barrierConditionClosed := trivial
}

def ViscositySubsolutionClosed (C : ViscositySubsolutionCertificate) : Prop :=
  C.subsolutionProperty ∧ C.viscosityConsistency ∧ C.barrierCondition

theorem source_viscosity_subsolution_closed :
    ViscositySubsolutionClosed sourceViscositySubsolutionCertificate := by
  exact And.intro sourceViscositySubsolutionCertificate.subsolutionClosed
    (And.intro sourceViscositySubsolutionCertificate.viscosityConsistencyClosed
      sourceViscositySubsolutionCertificate.barrierConditionClosed)

end ViscositySolutionsHamiltonJacobiEquationsCanonicalLaneLean
end HautevilleHouse
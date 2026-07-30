import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ViscositySolutionsHamiltonJacobiEquationsCanonicalLaneLean.ViscositySolutionEndpointLayer
import HautevilleHouse.ViscositySolutionsHamiltonJacobiEquationsCanonicalLaneLean.ViscosityOperators

namespace HautevilleHouse
namespace ViscositySolutionsHamiltonJacobiEquationsCanonicalLaneLean

structure ViscosityAnalyticCertificate where
  operatorsClosed : Prop
  subsolutionLayerClosed : Prop
  supersolutionLayerClosed : Prop
  endpointLayerClosed : Prop
  canonicalCarriageImported : Prop
  operatorsClosedProof : operatorsClosed
  subsolutionLayerClosedProof : subsolutionLayerClosed
  supersolutionLayerClosedProof : supersolutionLayerClosed
  endpointLayerClosedProof : endpointLayerClosed
  canonicalCarriageImportedProof : canonicalCarriageImported

def sourceViscosityAnalyticCertificate : ViscosityAnalyticCertificate := {
  operatorsClosed := HJEquationClosed primitiveFlow
  subsolutionLayerClosed := ViscositySubsolutionClosed sourceViscositySubsolutionCertificate
  supersolutionLayerClosed := ViscositySupersolutionClosed sourceViscositySupersolutionCertificate
  endpointLayerClosed := ViscositySolutionEndpointClosed sourceViscositySolutionEndpointCertificate
  canonicalCarriageImported := True
  operatorsClosedProof := primitive_flow_equation_closed_checked
  subsolutionLayerClosedProof := source_viscosity_subsolution_closed
  supersolutionLayerClosedProof := source_viscosity_supersolution_closed
  endpointLayerClosedProof := source_viscosity_solution_endpoint_closed
  canonicalCarriageImportedProof := trivial
}

def ViscosityAnalyticCertificateClosed (C : ViscosityAnalyticCertificate) : Prop :=
  C.operatorsClosed ∧
  C.subsolutionLayerClosed ∧
  C.supersolutionLayerClosed ∧
  C.endpointLayerClosed ∧
  C.canonicalCarriageImported

theorem source_viscosity_analytic_certificate_closed :
    ViscosityAnalyticCertificateClosed sourceViscosityAnalyticCertificate := by
  exact And.intro sourceViscosityAnalyticCertificate.operatorsClosedProof
    (And.intro sourceViscosityAnalyticCertificate.subsolutionLayerClosedProof
      (And.intro sourceViscosityAnalyticCertificate.supersolutionLayerClosedProof
        (And.intro sourceViscosityAnalyticCertificate.endpointLayerClosedProof
          sourceViscosityAnalyticCertificate.canonicalCarriageImportedProof)))

end ViscositySolutionsHamiltonJacobiEquationsCanonicalLaneLean
end HautevilleHouse